#installed python cv2 and openpyxl libraries
import shutil
import os
import cv2
import csv
import numpy as np

def fileSearcher():
   path = raw_input("Enter a directory to be parsed: ")
   data_type = []
   average = []
   deviation = []
   minVal = []
   maxVal = []
   folder_values = []
   image_values = []

   for root, dirs, files in os.walk(path):
      print(root)      
      for file_ in files:
          im = cv2.imread(os.path.join(root, file_), -1) #read image as is
          for y in range(300, 330):
             for x in range(230, 260):
                pixel =  im[x, y] 
                if pixel>30000:
                   image_values.append(pixel)  
          if len(image_values) == 0: 
             os.remove(os.path.join(root, file_))
          elif len(image_values) > 150 and "121" not in os.path.join(root, file_):
             if not os.path.exists("false_alarms"):
                os.makedirs("false_alarms")
             shutil.copy(os.path.join(root, file_), "false_alarms/")
             os.remove(os.path.join(root, file_))
          else:  
             data = np.asarray(image_values)
             avg = np.mean(data)
             folder_values.append(avg) 
          avg = 0
          image_values = []
      if len(folder_values) > 0 and not "image" in root:
         data_type.append(root)
         data = np.asarray(folder_values)
         average.append(np.mean(data))
         deviation.append(np.std(data))
         minVal.append(np.amin(data))
         maxVal.append(np.amax(data))
         folder_values = []

   writeData(data_type, average, deviation, minVal, maxVal)

def writeData(data_type, average, deviation, minVal, maxVal):
   csv = open("photo_data", "w")
   columnTitleRow = "folder, average, deviation, minValue, maxValue\n"
   csv.write(columnTitleRow)
   for i in range(len(average)):
      if "15us" in data_type[i]:
         csv.write(data_type[i]+", "+str(average[i])+", "+str(deviation[i])+", "+str(minVal[i])+", "+str(maxVal[i])+", "+"\n")
       
   for i in range(len(average)):
     if "30us" in data_type[i]:
        csv.write(data_type[i]+", "+str(average[i])+", "+str(deviation[i])+", "+str(minVal[i])+", "+str(maxVal[i])+", "+"\n")
   for i in range(len(average)):
      if "60us" in data_type[i]:
         csv.write(data_type[i]+", "+str(average[i])+", "+str(deviation[i])+", "+str(minVal[i])+", "+str(maxVal[i])+", "+"\n")
   for i in range(len(average)):
      if "120us" in data_type[i]:
         csv.write(data_type[i]+", "+str(average[i])+", "+str(deviation[i])+", "+str(minVal[i])+", "+str(maxVal[i])+", "+"\n")

fileSearcher()
