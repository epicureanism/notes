---
title: AI 筆記
tags: ai
notebook: ai
---

- vision 
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

- voice
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

- Text
  * Attention for machine translation (why attention 是今年顯學？)
  * summarization
    - extractive - 畫重點
    - abstractive - 寫心得
- Robotics
  * how to teach your robot
    - hand by hand (learning from demostration)
    - pybullet

- Deep Learning
  - [手把手教你深度學習](https://www.slideshare.net/tw_dsconf/ss-70083878)
  - Neural Network 的層級深度
  - NN 
    - input x weight = bias 
    - ![Neural Network](https://visualstudiomagazine.com/articles/2015/09/01/~/media/ECG/visualstudiomagazine/Images/2015/09/0915vsm_McCaffreyFig1.ashx) 
    - 無限weight 組，所以要找出「最佳weight組」
      - 最佳化Total loss 
      - Gradient Descent - 水往低處流
        - ![Gradient Descent](http://ml-cheatsheet.readthedocs.io/en/latest/_images/gradient_descent_demystified.png)
      - Mini-batch
        - 一個 epoch - 看完所有資料一次
        - 假設有1000筆資料
          - 差成100筆x10次，相當於一次epoch 會更新10次
        - 解決 batch loss 而非 total loss
      - Momentum (動量)
        - 讓子彈再飛一會兒，它可能會再往下掉
        - 動量是物體的質量和速度的乘積。例如，一輛快速移動的重型卡車擁有很大的動量。
    - First DNN by Keras
      - 0123456789
      - [實作筆記](https://github.com/epicureanism/notes/blob/master/ai/keras/readme.md)
    - Validation Dataset
      - 一定要分被訓練的資料及testing (驗證用)的資料
      - 利用 model.fit 
      - overfitting 的問題
        - training result 有進步，但validation result 反而變差
    - good result on training data -> good result on testing data 
      - if no good on testing data, then
        - regularization - weight 值不要太大，因為weight 影響很大
        - early stopping - 避免 overfitting，見好就收(提早停止訓練)
        - Dropout
        - Batch Normalization 
      

- Reinforcement Learning
 - Q learning - we can learn Q and use that to do a

- TensorFlow
  - eager execution
    - define-by-run interface
    - https://research.googleblog.com/2017/10/eager-execution-imperative-define-by.html
  - tensor2tensor
    - sequence2sequence 的一個不錯的入口

- [ai next?](https://www.bnext.com.tw/article/47109/ai-blue-ocean-strategy-taiwan)
  - ai-x
    - 與各領域的結合
    - 是紅海市場
      - ai for 無人車、ai for 醫療，競爭者眾
    - 贏者全拿
    - 要進入的話，商業模式很重要
  - ai-next
    - 「次世代的人工智慧技術」，目的是要解決當前這波人工智慧技術所不能解決之問題。
      - 例如機器學習需要依賴大量標注資料的問題、訓練模型參數調校困難的問題、資料為本的方法對於推論與邏輯判斷較弱的問題、「資料」與「知識」如何整合的問題、找出更好的非凸性質最佳化（non-convex optimization）方法、指導式學習缺乏創造力的問題等等族繁不及備載。
    - 知名機器視覺專家李飛飛曾言，「我們處在的年代，不是AI的起點，也不是AI的終點，應該是AI啟蒙階段的終點」。我的詮釋是：如果把電腦的智慧看成有「啟蒙期，發展期，成熟期」目前我們正在啟蒙時代的末期，進入發展期的前端。
    - 使用啟蒙期的AI去從事AI+X的應用，就如同將正在就讀小學的孩子送上戰場一樣，碰到簡單的任務也許勉強可以勝任，碰到困難的任務就等於瞎子摸象，成功是運氣而失敗大家會稱讚他有勇氣。
  - ai-then
    - 漏洞、更像人類、道德、社會責任、透明度
  - 戰略佈局
    - 佈局資料蒐集與分析
      - 如果已經引進資料分析但是還沒有到智慧型的預測，可以往AI+X的應用著手評估適合度，尋找最恰當的AI solution引進。在這裡碰到的問題往往不是solution不夠多，而是如何能夠找到最適合CP值最高的方式
    - 如果一個新創公司希望佈局AI技術，除非有「秘密武器」（如大量資料，很強的領域知識（domain knowledge），或別人還未開發出的技術），否則在AI+X的戰國時代生存困難重重
    - 在這個AI百花爭鳴的年代，大公司如Google，Facebook，Microsoft，IBM紛紛推出AI的library、平台，這些非常容易使用的套件使得AI（尤其是深度學習）的使用門檻大幅降低，卻也表示單單是應用深度學習套件或其他方法在某個應用上，已成為成功的必要條件卻非充分條件。
    - AI技術與理論的理解與深耕、對於新技術新方法掌握的速度，並且能發展出獨特的「秘密武器」，才是未來能夠勝出的重要關鍵。
- Ref
  - [人工智慧、機器學習到推薦系統的應用-台大資電林守德](https://www.slideshare.net/tw_dsconf/dsc-x-taai-2016)