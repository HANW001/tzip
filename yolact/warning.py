import winsound as sd
import time

def beepsound():
    fr = 1000    # range : 37 ~ 32767
    du = 2000     # 1000 ms ==1second
    sd.Beep(fr, du) # winsound.Beep(frequency, duration)

start_time = 0
while True:
    time.sleep(1)
    start_time += 1  
    print(start_time)
    if start_time >= 3:
        beepsound()
        start_time = 0

#while 종료 컨트롤 c