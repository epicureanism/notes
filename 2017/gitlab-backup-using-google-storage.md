```
$vim /etc/gitlab/gitlab.rb
```
```
gitlab_rails['backup_upload_connection'] = {
      'provider' => 'Google',
      'google_storage_access_key_id' => ENV['GOOGLE_STORAGE_ACCESS_KEY_ID'],
      'google_storage_secret_access_key' => ENV['GOOGLE_STORAGE_SECRET_ACCESS_KEY']
}

gitlab_rails['backup_upload_remote_directory'] = 'gcs-bucket-name'
```