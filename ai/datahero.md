---
title: data hero
tags: ai
notebook: ai
---

# 闆題，現有資料，解決方案
    - 沒有解決方案就只是研究(紙上談兵)
# 家暴
    - 回頭客
    - 再次受暴預測模型
        * 隨機森林
            * 驗證模型是否有效
                * 平均準確率、召回率(recall rate)、f值、精確率
                * 準確率 - 100題裡面有4% 是叉叉，那全答圈圈就至少會得到96% 的準確率
                * 評量指標的實務
                    |           | 真實結果 1     |    真實結果 0 |
                    | 預測結果 1 |               |  Type I error |
                    | 預測結果 0 | Type II error |               |


                    - recall rate 特別在意type ii error
                         - 不能容忍預測不到家暴回頭客的情形
                    - precision 在意 type i error
                        - 不喜歡狼來了的概念，尤其在資源有限的情況下 (高雄發火災偵測器的案例)
# 定義問題(目標)
    - 收斂問題
        - Customer + data journey map
        - 可用資料科學解決的問題 (input to output)
        - 可以具體行動的問題 (input to impact)
        - ex. 如何合理分配大量傷患
            - 一開始的思維，最短時間 => 送最近的
            - 但，「合理」的分配是什麼？
                - 了解急轉診的流程
        - 對齊動機
            - 由上到下、甲乙方、關鍵人，找亮點
                - ex 降低風險、簡化行政
# 資料盤點
    - 筆數多？欄位多？
        - 多欄位才有分析的可能
    - 根本沒資料
        - 
    - 資料很髒
        - 
    - 探索性資料分析
        - 理解資料，檢驗品質的最佳解法
# 資料儀表板
    - 資料素養提昇
    - 資料共享
    - 資料信心提昇
# 實作
[農地重金屬污染潛勢分析實作 by R](https://dspim.github.io/farmland-pollution-in-practice/analysis.html)
