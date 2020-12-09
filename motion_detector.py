#Python program for detecting movements from live video stream
#import the necessary packages
from imutils.video import VideoStream
from collections import deque
import argparse
import datetime
import imutils
import time
import cv2
from Adafruit_MotorHAT import Adafruit_MotorHAT, Adafruit_DCMotor, Adafruit_StepperMotor
import atexit



# create a default object, no changes to I2C address or frequency
mh = Adafruit_MotorHAT()

# recommended for auto-disabling motors on shutdown!
def turnOffMotors():
    mh.getMotor(1).run(Adafruit_MotorHAT.RELEASE)
    mh.getMotor(2).run(Adafruit_MotorHAT.RELEASE)
    mh.getMotor(3).run(Adafruit_MotorHAT.RELEASE)
    mh.getMotor(4).run(Adafruit_MotorHAT.RELEASE)

atexit.register(turnOffMotors)


myStepper = mh.getStepper(200,1)  # 200 steps/rev, motor port #1
myStepper2 = mh.getStepper(200,2)  # 200 steps/rev, motor port #2
myStepper.setSpeed(100)             # 100 RPM
myStepper2.setSpeed(100)             # 100 RPM


# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-v", "--video",
        help="path to the (optional) video file")
ap.add_argument("-b", "--buffer", type=int, default=32,
        help="max buffer size")
args = vars(ap.parse_args())


# initialize the list of tracked points, the frame counter,
# and the coordinate deltas
pts = deque(maxlen=args["buffer"])
counter = 0
(dX, dY) = (0, 0)
direction = ""

#construct argument parser, then parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-v", "--video", help="path to video file")
ap.add_argument("-a", "--min-area", type=int, default=500, help="minimum area size")
args = vars(ap.parse_args())

#if the video argument is None, then read from the webcam
if args.get("video", None) is None:
    vs = VideoStream(src=0).start()
    time.sleep(2.0)
#otherwise, read from the video file
else:
    vs = cv2.VideoCapture(args["video"])

#initialize the first frame in the Video Stream
firstFrame = None

#loop over the frames of the video
while True:
    #grab the current frame and initialize the occupied/unoccupied text
    frame = vs.read()
    frame = frame if args.get("video", None) is None else frame[1]
    text = "Unoccupied"


    #if the frame has not been detected, it signals the end of the video stream
    if frame is None:
        break

    #resize the frame, then convert it to grayscale, and blur it
    frame = imutils.resize(frame, width=500)
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    gray = cv2.GaussianBlur(gray, (21, 21), 0)

    # centroid
    c = max(255,200)
    M = cv2.moments(c)
    center = (int(M["m10"] / M["m00"]), int(M["m01"] / M["m00"]))



    #if the first frame is None, then initialize it
    if firstFrame is None:
        firstFrame = gray
        continue

    #calculate the absolute difference between the current frame and first frame
    frameDelta = cv2.absdiff(firstFrame, gray)
    thresh = cv2.threshold(frameDelta, 25, 255, cv2.THRESH_BINARY)[1]

    #dilate the threshold image to fill in the holes, afterwards figure out
    #the contours on thresholded image
    thresh = cv2.dilate(thresh, None, iterations=2)
    cnts=cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    cnts=imutils.grab_contours(cnts)

      #loop over the contours
    for c in cnts:
        #ignore if the contour is drastically small
        if cv2.contourArea(c) < args["min_area"]:
            continue
        #calculated the bounding box for the contour, place it on the frame, and update the text
        (x,y,w,h) = cv2.boundingRect(c)
        cv2.rectangle(frame, (x,y), (x + w, y + h), (0, 255, 0), 2)
        text="Occupied"
                          
        if dX < 250:
           myStepper2.step(50, Adafruit_MotorHAT.FORWARD, Adafruit_MotorHAT.SINGLE)
           myStepper2.step(50, Adafruit_MotorHAT.BACKWARD, Adafruit_MotorHAT.SINGLE)
        elif dX > 250:
           myStepper2.step(50, Adafruit_MotorHAT.BACKWARD, Adafruit_MotorHAT.SINGLE)
           myStepper2.step(50, Adafruit_MotorHAT.FORWARD, Adafruit_MotorHAT.SINGLE)
        elif dY < 150:   
           myStepper.step(50, Adafruit_MotorHAT.BACKWARD, Adafruit_MotorHAT.SINGLE)
        elif dY > 150:
           myStepper.step(50, Adafruit_MotorHAT.FORWARD, Adafruit_MotorHAT.SINGLE)

 #draw the text and timestamp onto the frame
    cv2.putText(frame, "Room Status: {}".format(text), (10, 20),
    cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 2)
    cv2.putText(frame, datetime.datetime.now(). strftime("%A %d %B %Y %I:%M:%S%p")
    (10, frame.shape[0] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.35, (0, 0, 255), 1)

    #display the frame, and have the option to record if the user presses a key
    cv2.imshow("Security Feed", frame)
    cv2.imshow("Thresh", thresh)
    cv2.imshow("Frame Delta", frameDelta)
    key = cv2.waitKey(1) & 0xFF

    #if the q is pressed, then break from the loop
    if key == ord("q"):
        break
                          
#cleanup the camera, and close out from any running tasks
vs.stop() if args.get("video", None) is None else vs.release()
cv2.destroyAllWindows()

#Type python motion_detector.py --video videos/example_01.mp4 for executing locally saved videos
#Type python motion_detector.py for executing raw video footage captured by the webcam


                          
