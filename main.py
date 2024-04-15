import gc
gc.enable()
from time import ticks_ms, ticks_diff
start_ticks = ticks_ms()
free = gc.mem_free() / 1024
allocated = gc.mem_alloc() / 1024
total = free + allocated
percent = '{0:.2f}%'.format(allocated/total*100)
print(' ______________________________________ ')
print('|                                      |')
print('|----------- Main starting. -----------|')
print('|---- Memory: {0:.2f}/{1:.2f}k ({2}) ----|'.format(allocated, total, percent))
print('|--------------------------------------|')

# from demos import Demo
from time import sleep
import visual_timer

ready_ticks = ticks_ms()
startup_ms = ticks_diff(ready_ticks, start_ticks) / 1000

free = gc.mem_free() / 1024
allocated = gc.mem_alloc() / 1024
total = free + allocated
percent = '{0:.2f}%'.format(allocated/total*100)
print('|------- Main ready! (in {0:.2f}s) -------|'.format(startup_ms))
if allocated >= 10.0:
    print('|---- Memory: {0:.1f}/{1:.2f}k ({2}) ----|'.format(allocated, total, percent))
else:
    print('|---- Memory: {0:.2f}/{1:.2f}k ({2}) ----|'.format(allocated, total, percent))
print('|______________________________________|')


# if __name__ == '__main__':
#     demo = Demo()
#     try:
#         while True:
#             try:
#                 demo.run_demo()
#                 print("restarting loop.")
#             except KeyboardInterrupt:
#                 print("Stopping loop.")
#                 break
#     except KeyboardInterrupt:
#         print("Clearing display.")
#     finally:
#         demo.driver.latch_off()
#         demo.driver.clear()
if __name__ == '__main__':
    tmr = visual_timer.VisualTimer()
    tmr.clock.update_time_from_web()
    print("Displaying the time.")
    while True:
        tmr.display_time_with_timers() #color=tmr.set_time_color())
        sleep(0.98)
