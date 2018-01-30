## data frame
  - 欄位排序，依另一欄的值來作為排序依據
  ``` R
  x$name <- factor(x$name, levels=x$name[order(x$val)])
  ```

## ggplot

### histogram

  - stat_bin 與 stat_count 的差別
    - stat_bin 用在連續性資料的count
    - stat_count 用在非連續性資料的count