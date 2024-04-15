from machine import Pin
from time import sleep


class ShiftRegisterDriver():
    def __init__(self, digits_in_chain: int, sr_clk: int, r_clk: int, latch: int, sr_clr: int, sr_data: int):
        self.blink_on_shift = True if sr_data != 2 else False
        if self.blink_on_shift:
            self.onboard_led = Pin(2, Pin.OUT)
            self.onboard_led(1)
        print("setting registers in chain...")
        self.digit_count = digits_in_chain
        print("Digits in use:", digits_in_chain)
        # sleep(1)
        print("Initializing.")
        self.sr_clk = Pin(sr_clk, Pin.OUT)
        self.sr_clk.off()
        self.r_clk = Pin(r_clk, Pin.OUT)
        self.r_clk.off()
        self.latch_g = Pin(latch, Pin.OUT)
        self.latch_g.on()
        self.sr_clr = Pin(sr_clr, Pin.OUT)
        self.sr_clr.on()
        self.ser_send = Pin(sr_data, Pin.OUT)
        self.ser_send.off()
        self.blank()
        self.numbers = {
            0: 33, 
            1: 237, # 1110 1101
            2: 131,
            3: 137,
            4: 77,
            5: 25,
            6: 17,
            7: 173, # 1010 1101
            8: 1,   # 0000 0001
            9: 13
        }
        self.loops = [
            253, # 1111 1101
            239, # 1110 1111
            191, # 1011 1111
            127, # 0111 1111
            247, # 1111 0111
            251, # 1111 1011
            # 254  # 1111 1110
        ]
        self.big_loops = [
            255, # 1111 1111 -- 0 / all off
            127, # 0111 1111 -- 1
            191, # 1011 1111 -- 2
            223, # 1101 1111 -- 3
            239, # 1110 1111 -- 4
            247, # 1111 0111 -- 5
            251, # 1111 1011 -- 6
            253, # 1111 1101 -- 7
            # 254  # 1111 1110 -- 8 (the dot)
        ]
        self.timer_lines_full = [ # NOT inverted!
            # order of countdown segments to turn off: 2, 1, 4, 3, 5, 7, 6, 8 
            0,   # 0000 0000
            1,   # 0000 0001
            9,   # 0000 1001
            11,  # 0000 1011
            15,  # 0000 1111
            47,  # 0010 1111
            63,  # 0011 1111
            191, # 1011 1111
            255, # 1111 1111 (all on)
        ]
        self.timer_lines = [
            0, # 0000 0000
            4, # 0000 0100
            36, # 0010 0100
            100, # 0110 0100
        ]
#    _____
#   |  2  |
# 1 |     | 4
#   |_____|
#   |  3  |
# 5 |     | 7
#   |_____|
#      6     . 8
        self.characters = { # NOT inverted!
            '0': 222, # 1101 1110
            '1': 18,  # 0001 0010
            '2': 124, # 0111 1100
            '3': 118, # 0111 0110
            '4': 178, # 1011 0010
            '5': 230, # 1110 0110
            '6': 238, # 1110 1110
            '7': 82,  # 0101 0010
            '8': 254, # 1111 1110
            '9': 242, # 1111 0010
            'A': 250, # 1111 1010
            'a': 250,
            'B': 174, # 1010 1110
            'b': 174,
            'C': 204, # 1100 1100
            'c': 44,  # 0010 1100
            'D': 62,  # 0011 1110
            'd': 62,
            'E': 236, # 1110 1100
            'e': 236,
            'F': 232, # 1110 1000
            'f': 232,
            'G': 206, # 1100 1110
            'g': 206,
            'H': 170, # 1010 1010
            'h': 170,
            'I': 18,  # 0001 0010
            'i': 2,   # 0000 0010
            'J': 30,  # 0001 1110
            'j': 30,
            'K': 138, # 1000 1010
            'k': 138,
            'L': 140, # 1000 1100
            'l': 140,
            'M': 74,  # 0100 1010
            'm': 74,
            'N': 42,  # 0010 1010
            'n': 42,
            'O': 222, # 1101 1110
            'o': 46,  # 0010 1110
            'P': 248, # 1111 1000
            'p': 248,
            'Q': 242, # 1111 0010
            'q': 242,
            'R': 40,  # 0010 1000
            'r': 40,
            'S': 230, # 1110 0110
            's': 230,
            'T': 200, # 1100 1000
            't': 168, # 1010 1000
            'U': 158, # 1001 1110
            'u': 14,  # 0000 1110
            'V': 146, # 1001 0010
            'v': 146,
            'W': 148, # 1001 0100
            'w': 148,
            'X': 186, # 1011 1010
            'x': 186,
            'Y': 182, # 1011 0110
            'y': 182,
            'Z': 124, # 0111 1100
            'z': 124,
            '.': 1,   # 0000 0001
        }
        # invert all loops values
        for i in range(len(self.loops)):
            self.loops[i] = self.invert_int_bits(integer=self.loops[i])
        # invert all timer_lines_full values
        for i in range(len(self.big_loops)):
            self.big_loops[i] = self.invert_int_bits(integer=self.big_loops[i])
        if self.blink_on_shift:
            self.onboard_led(0)
            # sleep(1)

    
    def str_to_int_list(self, string: str):
        int_list = []
        for i in range(len(string)):
            # print(i)
            # print(string[i])
            try:
                this_char = self.characters[string[i]]
            except KeyError as ex:
                raise KeyError("in string: '{0}', the character '{1}' is not available.".format(string, string[i]))
            except:
                raise
            if i == 0:
                int_list.append(this_char)
                # print("Char added: '{0}'".format(char))
            elif this_char == 1 and int_list[-1] % 2 == 0:
                # if '.' isn't the first character,
                # and the previous character is even number (% == return only the remainder)
                # then add 1 (the dot) to the previous character and move on.                    
                # print("Adding dot to char: '{0}'({1})".format(string[i-1], int_list[-1]))
                int_list[-1] = int_list[-1] + 1
                continue
            else:
                int_list.append(this_char)
                # print("Char added: '{0}'".format(char))
        # check if list is too long after conversion to int list in case there's an extra '.' so that it can get added to the last character.
        # i.e. "Show..." is 7 characters, so if digit_count is 6, that could still get displayed since the first '.' would get added to the 'w'
        if len(int_list) > self.digit_count:
            raise ValueError("String '{1}'({0}) is too long for this display ({2}).\nInts are: {3}".format(len(int_list), string, self.digit_count, int_list))
        # print("writing to display: '{0}' : {1}".format(string, int_list))
        return int_list[::-1]

    def invert_int_bits(self, integer: int):
        # ~ gives the compliment, then bit-wise AND's with 8 bits. i.e. ~3 == -4
        # i.e. ~0011 == 1100, but with 2's compliment a negative number starts with infinite 1's (postitive with infinite 0's),
        # so we bitwise AND it with the max bit chars we're using to return the positive-number representation of the compliment.
        # e.g. ~42 & 255 == 170 because:
        # ~0000 0101 0101   ==   1111 1010 1010, then
        # 1111 1010 1010   &   0000 1111 1111   ==   1010 1010
        return (~integer & 255)

    def write_string(self, string: str, color: str, log_display=False, hold_display=0.0, log_display_data=False):
        # print("writing string: '{0}'".format(string))
        char_list = []
        int_list = self.str_to_int_list(string=string)
        for char in int_list:
            char_list.append((char, color))
        if log_display:
            if log_display_data:
                print("writing to display: '{0}' : {1}".format(string, char_list))
            else:
                print("writing to display: '{0}'".format(string))
        self.display(char_list=char_list)
        sleep(hold_display)

    def write_shape(self, int_list: list[int], color: str, log_display=False, hold_display=0.0):
        char_list = []
        for char in int_list:
            char_list.append((char, color))
        while len(char_list) > self.digit_count:
            char_list.append(0, 'amber')
        if log_display:
            print("writing to display: '{0}'".format(char_list))
        self.display(char_list=char_list)
        sleep(hold_display)


    def get_big_loop(self, digit_count=0):
        if digit_count == 0:
            digit_count = self.digit_count
        big_loop = []
        blank_loop = [self.big_loops[0] for i in range(digit_count)]
        # print(blank_loop)
        # order: [5,1,2,4,7,8,6]
        # 5
        new_loop = blank_loop.copy()
        new_loop[0] = self.big_loops[5]
        big_loop.append(new_loop)
        # 1
        new_loop = blank_loop.copy()
        new_loop[0] = self.big_loops[1]
        big_loop.append(new_loop)
        # 2
        i = 0
        while i < digit_count:
            new_loop = blank_loop.copy()
            new_loop[i] = self.big_loops[2]
            big_loop.append(new_loop)
            i += 1
        # 4
        new_loop = blank_loop.copy()
        new_loop[-1] = self.big_loops[4]
        big_loop.append(new_loop)
        # 7
        new_loop = blank_loop.copy()
        new_loop[-1] = self.big_loops[7]
        big_loop.append(new_loop)
        # 6
        i = digit_count-1
        while i >= 0:
            new_loop = blank_loop.copy()
            dot_loop = blank_loop.copy()

            new_loop[i] = self.big_loops[6]
            big_loop.append(new_loop)
            # dot_loop[i] = self.big_loops[8]
            # big_loop.append(dot_loop)
            i -= 1
        # [print(loop) for loop in big_loop]
        return big_loop

    def blank(self):
        self.latch_on()
        self.clear()
        self.latch_off()

    def latch_on(self):
        # print("Latching.")
        self.latch_g(0)

    def latch_off(self):
        # print("Latching.")
        self.latch_g(1)

    def clear(self):
        # print("Clearing.")
        self.latch_on()
        self.sr_clr(0)
        self.sr_clr(1)
        self.latch_off()

    def shift_clk(self):
        # print("Shifting.")
        if self.blink_on_shift:
            self.onboard_led(1)
        self.sr_clk(1)
        self.sr_clk(0)
        if self.blink_on_shift:
            self.onboard_led(0)

    def set_registers(self):
        # print("Setting registers.")
        self.r_clk(1)
        self.r_clk(0)

    def send_to_registers(self, bits):
        bit_list = list(bits)
        bit_list = bit_list[::-1]
        self.ser_send(0)
        for bit in bit_list:
            self.ser_send(bit)
            self.sr_clk.on()
            self.sr_clk.off()
        self.ser_send(0)

    def display(self, char_list: list, digit_count=0):
        if digit_count == 0:
            digit_count = self.digit_count
        if len(char_list) > digit_count:
            raise ValueError("Too many entries in list to display.")
        for chars in char_list:
            char = chars[0]
            color = chars[1]
            # bitshift 1 left by (7-n) places.
            # if number bitwise AND'ed to that is 1
            # i.e. where n=3 and number=4 : shift 1 left 4 bits (0001 0000), then b'AND 0000 0011 == 0, return 0 (else)
            # this ends up with a list of int(1)'s and int(0)'s
            self.ser_send(0)
            num = [1 if char & (1 << (7-n)) else 0 for n in range(8)]
            # print('sending bits: {0} in {1}'.format(num, color))
            if color == 'green':
                self.send_to_registers(bits=num)
                for i in range(8):
                    self.shift_clk()
            elif color == 'red':
                for i in range(8):
                    self.shift_clk()
                self.send_to_registers(bits=num)
            elif color == 'amber':
                self.send_to_registers(bits=num)
                self.send_to_registers(bits=num)
            else:
                raise ValueError("Color must be one of: red, green, amber.")
        self.ser_send(0)
        self.set_registers()
        self.latch_on()

