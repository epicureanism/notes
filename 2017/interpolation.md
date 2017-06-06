This is the lesson learned from [Jerry Wu](mailto:jerry@gis.tw)

# What's interpolation? 何謂空間內插?
以已知點的已知值來預測某定點的未知值

# 常見的內插理論
1. IDW (距離反比權重法 Inverse Distance Weighted) 
簡單好用
1. Kriging (克利金法)  
參數需設定正確
1. Spline (雲形曲線法)
適合大範圍

# 操作 tip
 - for arcgis
enviroment 設定processing extent (將計算結果延展至layer的四角坐標), raster analysis (指定layer作為計算結果的遮罩)

# 不同理論應用的優劣分析
可用correlation 來分析理論值與參考點位值的相關係數是否正相關

# References
http://www.qgistutorials.com/en/docs/interpolating_point_data.html
