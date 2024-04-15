import gc
from TPIC6B595_ShiftRegister import ShiftRegisterDriver
import time
gc.collect()


class Demo():
    def __init__(self):
        sr_clk = 15  # D8
        r_clk = 13  # D7
        g = 12  # D6
        sr_clr = 14  # D5
        # ser_send = 2 # D4
        ser_send = 0  # D3
        out_en = 4
        self.digit_count = 6
        self.driver = ShiftRegisterDriver(digits_in_chain=self.digit_count,
                                          sr_clk=sr_clk,
                                          r_clk=r_clk,
                                          latch=g,
                                          sr_clr=sr_clr,
                                          sr_data=ser_send,
                                          out_enable=out_en)
        self.driver.blank()

    def run_demo(self):
        # self.demo_numbers()
        # self.demo_color_loop()
        self.demo_all_on_colors()
        # self.demo_expanding_loop()
        # self.demo_outer_loop()
        # self.demo_counting()
        self.demo_letters()
        self.demo_timer_lines()

    def demo_numbers(self):
        print("running numbers")
        for r in range(10):
            print(r)
            for color in 'red', 'green', 'amber':
                self.driver.clear()
                number_list = [(self.driver.numbers.get(r), color)
                               for j in range(self.digit_count)]
                self.driver.display(char_list=number_list)
                time.sleep(1)

    def demo_color_loop(self):
        for r in range(2):
            print("running color loop:", r)
            for color in 'red', 'amber', 'green':
                print(color)
                for loop in self.driver.loops:
                    self.driver.blank()
                    number_list = [(loop, color)
                                   for i in range(self.digit_count)]
                    self.driver.display(char_list=number_list)
                    time.sleep(0.1)

    def demo_all_on_colors(self):
        for r in range(2):
            print("running all-on color test:", r)
            for color in 'red', 'amber', 'green':
                self.driver.blank()
                print(color)
                number_list = [(255, color) for i in range(self.digit_count)]
                self.driver.display(char_list=number_list)
                time.sleep(1)

    def demo_outer_loop(self):
        for r in range(2):
            print("running big loop:", r)
            big_loop = self.driver.get_big_loop()
            for color in 'red', 'amber', 'green':
                print(color)
                for loop in big_loop:
                    self.driver.blank()
                    number_list = [(loop[i], color)
                                   for i in range(self.digit_count-1, -1, -1)]
                    self.driver.display(char_list=number_list)
                    time.sleep(0.01)

    def demo_expanding_loop(self):
        for r in range(2):
            print("running expanding loop:", r)
            for color in 'red', 'amber', 'green':
                print(color)
                for s in range(1, self.digit_count+1):
                    big_loop = self.driver.get_big_loop(digit_count=s)
                    for loop in big_loop:
                        self.driver.blank()
                        number_list = [(loop[i], color)
                                       for i in range(s-1, -1, -1)]
                        self.driver.display(char_list=number_list)
                        time.sleep(0.01)

    def demo_counting(self):
        for r in range(2):
            print("running counting loop:", r)
            for color in 'red', 'amber', 'green':
                print(color)
                for num in range(100):
                    self.driver.blank()
                    # print(num)
                    self.driver.write_string(
                        string=("....{0:02d}.".format(num)), color=color)
                    time.sleep(0.05)
        self.driver.write_string(string="...100.".format(num), color=color)
        time.sleep(2)

    def demo_letters(self):
        print("running letters")
        for color in 'red', 'amber', 'green':
            print(color)
            for i in "abcdefghijklmnopqrstuvwxyz":
                self.driver.blank()
                if self.driver.letters.get(i.upper()):
                    write_string = i.upper() + i
                elif self.driver.letters.get(i):
                    write_string = i + '.'
                else:
                    write_string = '..'
                print(write_string)
                self.driver.write_string(
                    string=("....{0}".format(write_string)), color=color)
                time.sleep(1)

    def demo_timer_lines(self):
        print("running timer lines")
        for color in 'red', 'amber', 'green':
            print(color)
            time_left = 18
            while time_left >= 0:
                int_list = []
                whole_lines = int(time_left / 3)
                partial_lines = int(time_left % 3)
                whole_digits = self.driver.digit_count - whole_lines
                [int_list.append(self.driver.timer_lines[-1]) for j in range((whole_lines))]
                if whole_digits:
                    int_list.append(self.driver.timer_lines[partial_lines])
                    [int_list.append(self.driver.timer_lines[0]) for j in range((whole_digits-1))]

                print(time_left, ':', int_list)
                self.driver.write_shape(int_list=int_list, color=color)
                time_left -= 1
                time.sleep(2)
                self.driver.blank()
