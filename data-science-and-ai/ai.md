---
title: AI 筆記
tags: ai
notebook: 
---

* vision 
  * V1
    - compact coding
    - sparse coding (google 採用)
  * classification, detection, segmentation 
  * classification
    * ResNet - Deep Residual Learning
    * Learning the architecture: Zoph & Le'17 
      - 目前最好的model
    * scaling to Imagenet
  * Detection
    * 影像辨識幾乎都是CNN, 各種CNN 的變形而已 (by 台大林守德)
    * proposal boxes + CNN 
      * R-CNN: Regions with CNN features
        - input image
        - extract region proposals
        - compute CNN features
        - classify regions
      * fast CNN 
        - R-CNN 的改良，cnn 這步驟加入neural network
      * faster r-cnn (微軟)
        - 類似fast CNN ，但連region classification 也用neural network     
  * segmentation (大魔王)
    - regression at pixel level (output is multi-channel, ie. N channels)
    - each channel is the desired segmentation mask for a class
    - Mask R-CNN: extend detection to segmentation

* voice
  * speech recongnition
    * sound representation
      - waveform, spectrogram, mei spectrogram
    * acoustic model -> pronunciation model -> language model -> transcript
      * acoustic model 通常用neural network (LSTMs)
    * decoding with beam search - keep n-best hypothesis
    * RNN-T
    * Attention model 
    * Listen, Attend, and Spell (LAS)
    * CTC, RNN-T, LAS 
      - CTC 雖有缺點 (conditional dependence),但實務上運作還是良好
      - 
    * Neural Transducer
      - 類比、數位訊號的轉換
  * text to speech 
    - marytts 
      - MaryTTS is an open-source, multilingual Text-to-Speech Synthesis platform written in Java. 

* Text
  * Attention for machine translation (why attention 是今年顯學？)
  * summarization
    - extractive - 畫重點
    - abstractive - 寫心得
* Robotics
  * how to teach your robot
    - hand by hand (learning from demostration)
    - pybullet

* Reinforcement Learning
 - Q learning - we can learn Q and use that to do a

* TensorFlow
  - eager execution
    - define-by-run interface
    - https://research.googleblog.com/2017/10/eager-execution-imperative-define-by.html
  - tensor2tensor
    - sequence2sequence 的一個不錯的入口

# Ref
  - [人工智慧、機器學習到推薦系統的應用-台大資電林守德](https://www.slideshare.net/tw_dsconf/dsc-x-taai-2016)