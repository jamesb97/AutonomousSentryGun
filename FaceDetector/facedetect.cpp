//CPP Program for detecting a face from webcam.
#include "C:/tools/opencv/build/include/opencv2/objdetect.hpp"
#include "C:/tools/opencv/build/include/opencv2/highgui.hpp"
#include "C:/tools/opencv/build/include/opencv2/imgproc.hpp"
#include <iostream>

using namespace std;
using namespace cv;

//Function for detecting faces.
void detectAndDraw(Mat& img, CascadeClassifier& cascade, CascadeClassifier& nestedCascade, double scale);
string cascadeName, nestedCascadeName;

//Main function
int main(int argc, const char** argv) {
    //Video Capture class for playing video in which faces are detected.
    VideoCapture capture;
    Mat frame, image;
    
    //Predefined trained XML classifiers with facial features.
    CascadeClassifier cascade, nestedCascade;
    double scale=1;
    
    //Load the classifiers from "opencv/data/harrcascades" directory.
    nestedCascade.load("C:/tools/opencv/sources/data/haarcascades/haarcascade_eye_tree_eyeglasses.xml");
    //Change the path upon execution.
    cascade.load("C:/tools/opencv/sources/data/haarcascades/haarcascade_frontalcatface.xml");
    //Start the video.. 0 for Webcam and 1 for External Webcam.
    capture.open(0);
    if(capture.isOpened()){
        //Capture the frames from the video and detect the faces.
        cout << "Face Detection has Started..." << endl;
        while(1){
            capture >> frame;
            if(frame.empty())
                break;
            Mat frame1 = frame.clone();
            detectAndDraw(frame1, cascade, nestedCascade, scale);
            char c = (char)waitKey(10);
            //Press q to exit from the window.
            if(c == 27 || c == 'q' || c == 'Q')
                break;
        }
    }
    else
        cout << "Could not open the camera";
    return 0;
}
void detectAndDraw(Mat& img, CascadeClassifier& cascade, CascadeClassifier& nestedCascade, double scale){
    vector<Rect> faces, faces2;
    Mat gray, smallImg;
    cvtColor(img, gray, COLOR_BGR2GRAY); // Convert to Grayscale
    double fx = 1/scale;
    
    //Resize the Grayscale Image
    resize(gray, smallImg, Size(), fx, fx, INTER_LINEAR);
    equalizeHist(smallImg, smallImg);
    
    //Detect different face sizes by applying cascade classifier.
    cascade.detectMultiScale(smallImg, faces, 1.1, 2, 0 | CASCADE_SCALE_IMAGE, Size(30, 30));
    
    //Draw a circle around the faces.
    for(size_t i = 0; i < faces.size(); i++){
        Rect r = faces[i];
        Mat smallImgROI;
        vector<Rect> nestedObjects;
        Point center;
        Scalar color = Scalar(255, 0, 0); //Color for the Drawing tool.
        int radius;
        double aspect_ratio = (double)r.width/r.height;
        if(0.75 < aspect_ratio && aspect_ratio < 1.3){
            center.x = cvRound((r.x + r.width*0.5)*scale);
            center.y = cvRound((r.y + r.height)*0.25*scale);
            circle(img, center, radius, color, 3, 8, 0);
        }
        else
            rectangle(img, cvPoint(cvRound(r.x*scale), cvRound(r.y*scale)), cvPoint(cvRound((r.x + r.width-1)*scale), cvRound((r.y + r.height-1)*scale)), color, 3, 8, 0);
        if(nestedCascade.empty())
            continue;
        smallImgROI = smallImg(r);
        //Detection of eyes int the input image.
        nestedCascade.detectMultiScale(smallImgROI, nestedObjects, 1.1, 2, 0 | CASCADE_SCALE_IMAGE, Size(30, 30));
        //Draw circles around eyes
        for(size_t j = 0; j < nestedObjects.size(); j++){
            Rect nr = nestedObjects[j];
            center.x = cvRound((r.x + nr.x + nr.width*0.5)*scale);
            center.y = cvRound((r.y + nr.y + nr.height*0.5)*scale);
            radius = cvRound((nr.width + nr.height)*0.25*scale);
            circle(img, center, radius, color, 3,8,0);
        }
    }
    //Show the Processed Image with the detected faces.
    imshow("Face Detection", img);
}