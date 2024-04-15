from network import WLAN, STA_IF
from urequests import get
from time import sleep, ticks_ms, time, mktime
from machine import RTC, Pin, SPI, reset
from TPIC6B595_ShiftRegister import ShiftRegisterDriver as BigDigits


class Clock:
    def __init__(self, ssid="",  # wifi name
                 pw="",  # wifi password
                 url="http://worldtimeapi.org/api/timezone/America/Denver",  # see http://worldtimeapi.org/timezones
                 web_query_delay=600,  # seconds; how often to call time Api
                 retry_delay=5):  # seconds; how long to wait before retry when Api call fails
        # *_delay args are in seconds
        self.url = url
        self.web_query_delay = web_query_delay
        self.retry_delay = retry_delay

        sr_clk = 15 # D8
        r_clk = 13 # D7
        g = 12 # D6
        sr_clr = 14 # D5
        #ser_send = 2 # D4
        ser_send = 0 # D3
        self.digit_count = 6
        display = BigDigits(digits_in_chain=self.digit_count,
                                sr_clk=sr_clk,
                                r_clk=r_clk,
                                latch=g,
                                sr_clr=sr_clr,
                                sr_data=ser_send)
        # internal real time clock
        self.rtc = RTC()
        url = url
        retry_delay = retry_delay

        # initialization
        display.clear()
        print("Connecting to wifi...")
        display.write_string("Wifi...", 'red') #, log_display=True)

        # wifi connection
        wifi = WLAN(STA_IF)  # station mode
        wifi.active(True)
        wifi.connect(ssid, pw)
        # wait for connection
        while not wifi.isconnected():
            sleep(0.5)
        # wifi connected
        print("IP:", wifi.ifconfig()[0])
        display.write_string("Cncted.", 'green', hold_display=1)
        display.clear()
        display.write_string("Clock", 'green', hold_display=1)
        self.digits = display

        self.last_update_time = 0.0

    def update_time_from_web(self):
        # if current time in ms minus last_update_time is greater than the delay time
        # e.g. if web_query_delay time in milliseconds has passed, update the time
        if time() - self.last_update_time >= self.web_query_delay or self.last_update_time == 0.0:
            self.digits.write_string('Updtng.', 'amber', hold_display=1)
            try:
                # HTTP GET
                response = get(self.url)
            except OSError as ex:
                # if wifi connection is lost, reboot ESP8266
                print(str(type(ex).__name__), ':', ex, "\n", ex.__traceback__)
                reset()
            if response.status_code == 200:  # query success
                # print("JSON response:\n", response.text)
                # parse JSON
                parsed = response.json()
                datetime_str = str(parsed["datetime"])
                day_of_week = int(parsed['day_of_week'])
                print("RTC time is: {0}".format(datetime_str))
                new_time = (
                    int(datetime_str[0:4]), # year
                    int(datetime_str[5:7]), # month
                    int(datetime_str[8:10]), # day
                    day_of_week, # day of the week as a number
                    int(datetime_str[11:13]), # hour
                    int(datetime_str[14:16]), # minute
                    int(datetime_str[17:19]), # second
                    int(round(int(datetime_str[20:26]) / 10000)) # sub-second
                )
                # update internal RTC
                self.rtc.datetime(new_time)
                self.last_update_time = time()
                print("RTC updated:\n{0}".format(self.rtc.datetime()))

            else:  # query failed, retry retry_delay ms later
                self.last_update_time = (time() - self.web_query_delay + self.retry_delay)
        # else:
        #     print("Not updating time from internet.")
        #     print("{0} - {1} >= {2}".format(time(), self.last_update_time, self.web_query_delay))


    def display_time(self, color='red'):
        self.update_time_from_web()
        current_time = self.rtc.datetime()
        # generate formatted time strings from internal RTC
        # print("Current time: {0}".format(current_time))
        time_str = "{4:02d}.{5:02d}.{6:02d}".format(*current_time)
        # update digit display
        # print("Displaying: {0}".format(time_str))
        self.digits.write_string(time_str, color) #, log_display=True)
        return current_time