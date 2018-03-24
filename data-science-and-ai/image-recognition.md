# image recognition

## object detection

## object recognition

- https://docs.opencv.org/2.4/doc/user_guide/ug_traincascade.html
  - training data preparation
    - negative samples
    - positive samples
    - in: images
    - out: vec (vectors)    
  - classifier training
    - opencv_traincascade or opencv_haartraining
    - in: vec with positive samples
    - out: cascade.xml
    - (store back to knowledge base?)
  - validate classifier
    - validated: do nothing
    - invalid: retraining

  - 使用image-net
    - https://pjreddie.com/darknet/imagenet/
    - image-net labels
      - https://gist.github.com/yrevar/942d3a0ac09ec9e5eb3a