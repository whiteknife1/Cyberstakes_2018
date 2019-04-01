import cv2
import numpy as np
import math

#def getResult(bullet, laser):
    #Read Images
bullet = cv2.imread("bullet6.png")
bullet_cropped=bullet[580:1690, 280:1870]

laser = cv2.imread("laser6.png")
laser_cropped=laser[580:1690, 280:1870]

previousImage = cv2.imread("bullet5.png")
previousImage_cropped = previousImage[580:1690, 280: 1870]
cv2.imwrite("previous.png", bullet)

	#Run Background Subtraction on both Images
bullet_threshold = cv2.subtract(previousImage_cropped, bullet_cropped)
#	bullet_threshold = cv2.inRange(bullet_threshold, (20, 20, 20), (255, 255, 255))

laser_threshold = cv2.subtract(laser_cropped, previousImage_cropped)
#	laser_threshold = cv2.inRange(laser_threshold, (20, 20, 20), (255, 255, 255))
cv2.imwrite("bullet.png", bullet_threshold)
cv2.imwrite("laser.png", laser_threshold)


'''
	#convert laser color from white to gray
	for i in range(laser_threshold.shape[0]):
	   for j in range(laser_threshold.shape[1]):
		  if laser_threshold[i][j] == 255:
			 laser_threshold[i][j] = 135
'''
'''
	result = cv2.add(bullet_threshold, laser_threshold)
	#cv2.imwrite("result.png", result)

	#find general centers of bullet and laser
	m = np.zeros((result.shape[0], result.shape[1]))
	n = np.zeros((result.shape[0], result.shape[1]))
	for i in range(result.shape[0]):
	   for j in range(result.shape[1]):
		  n[i][j] = (laser_threshold[(i, j)] == 135)
		  m[i][j] = (result[(i, j)] == 255)
	m = m/np.sum(np.sum(m))
	n = n/np.sum(np.sum(n))

	#marginalize distributions
	bullet_dx = np.sum(m, 1)
	bullet_dy = np.sum(m, 0)
	laser_dx = np.sum(n, 1)
	laser_dy = np.sum(n, 0)

	#expected values
	bullet_cx = int(np.sum(bullet_dx*np.arange(result.shape[0])))
	bullet_cy= int(np.sum(bullet_dy*np.arange(result.shape[1])))
	laser_cx = int(np.sum(laser_dx*np.arange(result.shape[0])))
	laser_cy = int(np.sum(laser_dy*np.arange(result.shape[1])))

	#draw distance between two centers
	result = cv2.cvtColor(result, cv2.COLOR_GRAY2RGB)
	cv2.line(result, (bullet_cy, bullet_cx), (laser_cy, laser_cx),(0, 0, 255), 1)
	x_distance = laser_cx-bullet_cx
	y_distance = laser_cy-bullet_cy
	distance = int(math.sqrt(x_distance**2+y_distance**2))

	result[bullet_cx, bullet_cy] = (5, 5, 5)
	result[laser_cx, laser_cy] = (5, 5, 5)

	#Write data on image
	#Write centers on image
	font = cv2.FONT_HERSHEY_SIMPLEX
	cv2.putText(result, "Bullet: "+str(bullet_cx)+", "+str(bullet_cy), (20, 30), font, 1, (0, 0, 255), 2)
	cv2.putText(result, "Laser: "+str(laser_cx)+", "+str(laser_cy), (20, 60), font, 1, (0, 0, 255), 2)
	cv2.putText(result, "X: "+str(x_distance)+" Y: "+str(y_distance)+" Distance: "+str(distance), (20, 90), font, 1, (0, 0, 255), 2)

	cv2.imwrite("result.png", result)'''
