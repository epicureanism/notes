# 前置作業
- Install new-git
gitlab 9.1.3
- Setup Azure
https://docs.gitlab.com/ce/integration/azure.html
  - issue 1: SSL certificate
    - modify external url in gitlab.rb
    - domain name mush match
  - issue 2: error of MissingSetting "servers"
    - 
  - issue 3: error of user blocked
- 記錄舊gitlab 版本號及還原計畫相關文件備妥。

# 備份、移轉作業
- 舊gitlab 資料庫備份至0filer
- 舊gitlab repo 備份至新主機，亦直接作為新主機的repo
- 舊gitlab 版本昇級至與新主機相同
- 舊gitlab 資料庫備份至新主機，並還原
- 新主機web功能測試、git版控測試
    - 測通，all done
    - fail，6/11中午前設停損點，執行舊主機還原計畫。