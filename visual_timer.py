from time import sleep, mktime, localtime
from clock import Clock

TIMER_STRINGS = [
    # start_time, color, run_countdown
    "06:30:00:green:False", # morning green clock
    "08:00:00:red:True", # morning countdown red
    "08:15:00:amber:True", # morning countdown amber
    "08:30:00:green:False", # morning countdown green
    "19:00:00:green:True", # evening double-countdown green 1
    "19:15:00:green:True", # evening double-countdown green 2
    "19:30:00:amber:True", # evening double-countdown amber 1
    "19:45:00:amber:True", # evening double-countdown amber 2
    "20:00:00:red:False", # evening red clock
]
CLOCK_UPDATE_INTERVAL = mktime((0, 0, 0, 1, 0, 0, 0, 0))


class VisualTimer():
    def __init__(self):
        self.clock = Clock()
        self.update_timers()

    def update_timers(self):
        self.clock.update_time_from_web()
        self.current_time = localtime()
        now = localtime()
        year = now[0]
        month = now[1]
        mday = now[2]
        wkday = now[6]
        yrday = now[7]
        self.clock.digits.write_string(string='Timers.', color='green', hold_display=0.5)

        t = 0
        self.timers = []
        for timer_string in TIMER_STRINGS:
            timer = timer_string.split(':')
            timer_list = []
            timer_list.append(localtime(mktime((year, month, mday, int(timer[0]), int(timer[1]), int(timer[2]), wkday, yrday))))
            timer_list.append(timer[3]) # color
            if timer[4] == 'False': # run_countdown
                timer_list.append(False)
            else:
                timer_list.append(True)
            self.timers.append(timer_list)
            self.clock.digits.clear()
            if t > 9:
                self.clock.digits.write_string(string="Timr.{0}".format(t), color='green', log_display=True, hold_display=0.25)
            else:
                self.clock.digits.write_string(string="Timer.{0}".format(t), color='green', log_display=True, hold_display=0.25)
            t = t + 1

    def display_timer(self, timer):
        this_timer = self.timers[timer]
        # print("Checking timer details: {0}".format(this_timer))
        # print("{0}".format(this_timer[-1]))
        if not this_timer[-1]: # if "run_countdown" isn't True, skip.
            print("Skipping countdown for timer: {0}".format(this_timer))
            self.clock.display_time(color=self.set_time_color())
        else:
            print("Running timer: {0}".format(this_timer))
            next_timer = self.timers[timer+1]
            # print("Added {0} dots to fill in display.".format(num_list))  
            time_left = int((mktime(next_timer[0]) - mktime(this_timer[0])) / 60)
            color = this_timer[1]
            while (mktime(localtime())) <= (mktime(next_timer[0]) - 10):
                current_time = localtime()
                print("Time left: {0:02d}".format(time_left))
                num_list = []
                whole_lines = int(time_left / 3)
                partial_lines = int(time_left % 3)
                whole_digits = self.clock.digits.digit_count - whole_lines
                if current_time[5] % 2:
                    [num_list.append(self.clock.digits.timer_lines[-1]+1) for j in range((whole_lines))]
                    num_list.append(self.clock.digits.timer_lines[partial_lines]+1)
                else:
                    [num_list.append(self.clock.digits.timer_lines[-1]) for j in range((whole_lines))]
                    num_list.append(self.clock.digits.timer_lines[partial_lines])
                [num_list.append(self.clock.digits.timer_lines[0]) for j in range((whole_digits-1))]
                print("Displaying: {0} - {1}".format(num_list, color))
                if current_time[5] % 2 and time_left <= 1:
                    self.clock.digits.blank()
                    sleep(0.9999)
                else:
                    self.clock.digits.write_shape(num_list, color, hold_display=0.9999)

                time_left = int(((mktime(next_timer[0])) - (mktime(localtime()))) / 60) + 1
            all_on_list = [255 for i in range(self.clock.digits.digit_count)]
            while (mktime(localtime())) <= (mktime(next_timer[0])):
                countdown = mktime(next_timer[0]) - mktime(localtime())
                print(countdown)
                if countdown < self.clock.digits.digit_count and countdown >= 0:
                    all_on_list[countdown] = 0
                self.clock.digits.write_shape(int_list=all_on_list, color=color, hold_display=0.5)
                self.clock.digits.blank()
                sleep(0.5)
            print("Next timer is: {0}".format(next_timer))
        
    def display_time_with_timers(self):
        self.current_time = localtime()
        run_timer = False
        timers_updated = False
        # print(len(self.timers))
        for i in range(len(self.timers)):
            # print(self.timers[i], ' - ', i)
            if self.timers[i][0][2] != self.current_time[2] and not timers_updated:
                self.update_timers()
                timers_updated = True
            if i >= len(self.timers)-1:
                next_timer = localtime()
            else:
                next_timer = self.timers[i+1][0]
            if self.current_time >= self.timers[i][0] and self.current_time < next_timer:
                run_timer = True
                break
        if run_timer:
            print("Timer running: {0}".format(self.timers[i]))
            self.display_timer(timer=i)
        else:
            self.clock.display_time(color=self.set_time_color())

    def set_time_color(self):
        if self.current_time[3] >=12:
            color = 'red'
        else:
            color = 'green'
        return color


if __name__ == '__main__':
    tmr = VisualTimer()
    print("Displaying the time.")
    while True:
        tmr.display_time_with_timers()
        sleep(1)
