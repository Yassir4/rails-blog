# Rails Blog


## Running

 clone the repo
```
git clone https://github.com/Yassir4/rails-blog.git
```
setup
```
$ docker-compose run --rm -u root web bash -c "mkdir -p /bundle/vendor && chown railsuser /bundle/vendor"
$ docker-compose run --rm web bundle install
$ docker-compose run --rm web bundle exec rake db:setup
```

Run:
```
$ docker-compose up web
```

And go to localhost:3000.