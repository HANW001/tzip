import wave 
import pygame

#import getCurrentTime
#import threading

from tkinter import *
from tkinter import ttk

file_path = 'C:/Users/kjh/Desktop/yolact/alarm.wav'

file_wav = wave.open(file_path)




frequency = file_wav.getframerate()
pygame.mixer.init(frequency=frequency)
pygame.mixer.music.load(file_path)

def alarm_On():    
    # 알람음을 재생합니다.
    pygame.mixer.music.play()



def alarm_Off():
    # 알람음을 중지합니다.
    pygame.mixer.music.stop()
