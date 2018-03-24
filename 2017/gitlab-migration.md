# Lessson learned
## 官方文件一定會有風險
  - 寫過文件都知道，文件總是把世界想得很美好，任何細節不一定會補充到文件上，沒寫到，是正常；有寫到，是功德。
  - 官方文件+stakeoverflow+官方論壇，才是真實
## 測試機很重要
 - 不要輕易在production 環境上異動，尤其是重要的主機。
 - 架一比一環境的測試機所花的時間，絕對比還原搞雜的主機要省時的多。
 - 測試機上實驗完的成果才值得書寫過程。
## 有用的指令可以省時間
 - rsync, disown

# 前置作業
- Install new-git
    - sudo gitlab-rake gitlab:env:info
        - gitlab 9.1.3
- Setup Azure
https://docs.gitlab.com/ce/integration/azure.html
  - issue 1: SSL certificate ([REF](https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/doc/settings/nginx.md))
    - modify external url in gitlab.rb
    - domain name mush match
    - commands
        - sudo mkdir -p /etc/gitlab/ssl
        - sudo chmod 700 /etc/gitlab/ssl
        - sudo cp gitlab.example.com.key gitlab.example.com.crt /etc/gitlab/ssl/
        - sudo gitlab-ctl reconfigure

  - issue 2: error of MissingSetting "servers"
    - 
  - issue 3: error of user blocked
  - issue 4: letsencrypt renew
    - 憑證每90天會過期
    - 使用letsencrypt 指令搭配 crontab 定期更新 [REF](https://about.gitlab.com/2016/04/11/tutorial-securing-your-gitlab-pages-with-tls-and-letsencrypt/)

- 記錄舊gitlab 版本號及還原計畫相關文件備妥。
    - sudo gitlab-rake gitlab:env:info
        - 7.3.2
    - [備份、還原文件](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/doc/raketasks/backup_restore.md)
    
    
# 備份、移轉作業
- 舊gitlab 資料庫備份至0filer
    - cd ~
    - sudo gitlab-rake gitlab:backup:create SKIP=repositories
    - scp /var/opt/gitlab/backups/xxx_20xx_0x_xx.tar xx@new.git.domain:~/gitlab_db_7.3.2.tar
- 舊gitlab repo 備份至新主機，亦直接作為新主機的repo
    - rsync -avhr --ignore-existing /var/opt/gitlab/ gitadmin@git.gis.tw:/home/gitadmin/backups/all-in-var
- 舊gitlab 版本昇級至與新主機相同
    - [參考網址](https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/doc/update/README.md#updating-from-gitlab-66-and-higher-to-the-latest-version)
    - curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
    - 直接昇到9.x 版會有錯誤，試著先昇到7.14 ([REF](https://gitlab.com/gitlab-org/gitlab-ce/issues/29752)) ([AddMissingUniqueIndices Error](https://github.com/gitlabhq/gitlabhq/issues/9966))
        - sudo apt-get install gitlab-ce=7.14.3-ce.1
    - 昇到7.14 也fail [undefined method counter_cache_column](https://gitlab.com/gitlab-org/gitlab-ce/issues/29752)
    - 因為ubuntu 版本與gitlab 版本有相依性，並不是任一版本的omnibus gitlab 都可在不同os 上執行。
    - 試著在另一個新vm revert 備份回7.3.2 [REF](https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/doc/update/README.md#reverting-to-gitlab-66x-or-later)
        - 安裝 gitlab omnibus 7.3.2
            - sudo dpkg -i /media/psf/Home/Downloads/gitlab_7.3.2-omnibus-1_amd64.deb
        - restore 備份 (先把備份檔copy 到gitlab 的預設備份目錄)
            - cp gitlab_db_7.3.2.tar /var/opt/gitlab/backups/1234_gitlab_backup.tar 
            - sudo gitlab-ctl stop unicorn
            - sudo gitlab-ctl stop sidekiq
            - sudo gitlab-rake gitlab:backup:restore BACKUP=1234 
        - upgrade to 7.10 (ubuntu 12.04) 
            - [download](https://about.gitlab.com/downloads/archives/)
            - sudo dpkg -i gitlab-ce_7.10.4-omnibus-1_amd64.deb
                - 遇到openssh server 的相依性問題
                    - sudo apt-get update
                    - sudo apt-get install -f
                    - sudo rm -rf /var/lib/apt/lists/*
                    - sudo apt-get update
            - 備份 7.10
                - sudo gitlab-rake gitlab:backup:create
                - 1497190727_gitlab_backup.tar
        - 在centos 裝gitlab 7.10 ( 不要裝在 ubuntu 12.04了，因為omnibus 連7.14 都升不上去)
            - [download](https://about.gitlab.com/downloads/archives/)
            - use rpm install              
            - restore the 1497190727_gitlab_backup.tar
            - Upgrading from manually downloaded Omnibus package
                - curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
                - sudo yum install gitlab-ce
                    - 完成後，已更新至 9.2.5版

- 舊gitlab 資料庫備份至新主機，並還原  
    - 備份
        - sudo gitlab-rake gitlab:backup:create
        - scp /var/opt/gitlab/backups/xxx_20xx_0x_xx.tar xx@new.git.domain:/var/opt/gitlab/backups
        
    - 還原
        - sudo gitlab-ctl stop unicorn
        - sudo gitlab-ctl stop sidekiq
        - sudo gitlab-rake gitlab:backup:restore BACKUP=xxx_20xx_0x_xx
        - sudo gitlab-ctl start
        - sudo gitlab-rake gitlab:check SANITIZE=true

- 新主機web功能測試、git版控測試
    - 測通
        - 測 AD登入
            - 
        - 定期備份指令設定及測試
    - fail，6/11中午前設停損點，執行舊主機還原計畫。

# Appedix
  ## removing gitlab
    - sudo gitlab-ctl uninstall
    - sudo rm -rf /opt/gitlab 
    - sudo rm -rf /var/opt/gitlab/
    - sudo rm -rf /etc/gitlab/
    - sudo dpkg -r gitlab-ce
    - sudo dpkg --purge gitlab-ce
## install
    - sudo dpkg -i xxx.deb
    - sudo gitlab-ctl reconfigure
## restore
    - sudo cp backups/1497190727_gitlab_backup.tar /var/opt/gitlab/backups
    - sudo chmod 777 /var/opt/gitlab/backups/1497190727_gitlab_backup.tar
    - sudo gitlab-ctl stop unicorn
    - sudo gitlab-ctl stop sidekiq
    - sudo gitlab-rake gitlab:backup:restore BACKUP=1497190727
    - sudo gitlab-ctl start
    - sudo gitlab-rake gitlab:check SANITIZE=true
### restore repo ([REF](https://docs.gitlab.com/ce/raketasks/import.html))
    - sudo chmod -R ug+rwX,o-rwx /var/opt/gitlab/git-data/repositories
    - sudo chmod -R ug-s /var/opt/gitlab/git-data/repositories
    - sudo chown git:git /var/opt/gitlab/git-data/repositories
    - sudo gitlab-rake gitlab:import:repos
    - sudo gitlab-rake cache:clear
## Connect to database ([REF](http://docs.gitlab.com/omnibus/settings/database.html#connecting-to-the-bundled-postgresql-database))

### to application database
    - sudo gitlab-psql -d gitlabhq_production 
    - 顯示所有使用者
        - \l 
    - 顯示port
        - show port;

### to postgres database
    - sudo gitlab-psql -d postgres

    - 建立自訂的管理者帳號
        - create user ricky with password '####';
        - GRANT ALL PRIVILEGES ON DATABASE gitlabhq_production to ricky;
        - GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ricky;
        - modify gitlab.rb
            - postgresql['listen_address'] = '*'
            - postgresql['md5_auth_cidr_addresses'] = ["192.168.0.0/16","::1/128","127.0.0.1/32"]
            - postgresql['trust_auth_cidr_addresses'] = ["192.168.0.0/16","::1/128","127.0.0.1/32"]
## omnuauth of azure 
``` js
gitlab_rails['omniauth_enabled'] = true
gitlab_rails['omniauth_allow_single_sign_on'] = true
gitlab_rails['omniauth_block_auto_created_users'] = false
gitlab_rails['omniauth_auto_link_ldap_user'] = false
gitlab_rails['omniauth_providers'] = [
  {         
    "name" => "azure_oauth2",
    "args" => { 
      "client_id" => "xx",
      "client_secret" => "yy",
      "tenant_id" => "zz"
    }         
  }
]
```