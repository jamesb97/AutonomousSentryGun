# 2020 Senior Capstone Project
Senior Project
## Fully Autonomous Programmable Sentry Gun
The Autonomous Sentry Gun has the capability of detecting a target from a range using multiple sensors. The input from the camera will center on the target by calculating the yaw of the gun, whereas the input from the ultrasonic range finder calculates the output pitch to find the correct trajectory the bullet will need to take. Components in the project build include an electric airsoft gun, webcam with integrated video plus audio, raspberry pi three, 5 volt relay, two stepper motors, DC boost converter, motor shield driver, ultrasonic range finder. Both stepper motors are integrated using Adafruit-Motor-HAT-Python-Library. The webcam takes auditory inputs to confirm an activation code for the target. The webcam is capable of detecting the object in it's field of view using motion detection and object recognition, implemented with OpenCV. If the activation code is correct, the sentry gun will show a green light signaling to the user that it is disarmed. If the activation code is incorrect, the sentry gun will show a red light, which will fire at the target. Our audio recognition software was implemented with Steven Hickson's PiAUISuite, which uses Google's text-to-speech. This project is designed for anyone who wants autonomous protection, without having to manually control the gun.

### To get started, clone this repository

```
git clone https://github.com/jamesb97/AutonomousSentryGun.git
```

#### To test our motion detection and object recognition, enter

```
python motion_detector.py
```

#### Make sure to have OpenCV Python installed, for more info go to

```
https://pypi.org/project/opencv-python/
```

#### For testing our face recognition, enter

```
python face_detection.py
```

