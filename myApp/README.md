# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## Active Job

异步队列目前使用了active_job+sidekiq，本地需要安装redis，同时配置好`settings_ext.yml` 中：
启动redis: redis-server
启动：`bundle exec sidekiq -C config/sidekiq.yml`
