#ifndef VISUALS_FACEDETECTOR_H
#define VISUALS_FACEDETECTOR_H
#include <C:/tools/opencv/build/include/opencv2/dnn.hpp>

class FaceDetector {
public: 
    explicit FaceDetector();
    //Detect faces in an image frame
    std::vector<cv::Rect>detect_face_rectangles(const cv::Mat &frame);
    
private:
    //Face Detection Network
    cv::dnn::Net network_;
    //Input Image Width
    const int input_image_width_;
    //Input Image Height
    const int input_image_height_;
    //Scale factor when creating an image blob.
    const double scale_factor_;
    //Mean normalization values network it was trained with.
    const cv::Scalar mean_values_;
    //Face Detection confidence threshold
    const float confidence_threshold_;
};

#endif //VISUAL_FACEDETECTOR_H