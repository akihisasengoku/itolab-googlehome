# itolab-googlehome

#### Usage
```
docker-compose up --build -d
docker-compose stop
docker-compose run web rake db:migrate
docker-compose run web rake db:seed
docker-compose up
```


#### A server is already running.
Dockerの立ち上げに失敗
```
rm -rf tmp/pids/server.pid
```
(プロジェクトのルートディレクトリー)