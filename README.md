# Professor

Download entire Coursera courses, no fuss.

### Getting started

A Dockerfile is provided for your convenience, or just run it locally.

#### Docker

```
$ git clone git@github.com:imjacobclark/professor.git && cd professor
$ docker build -t professor .
$ docker run -e COURSERA_USERNAME=some@email.com -e COURSERA_PASSWORD=yourp4ssword --name professor professor
```

#### Ruby

```
$ git clone git@github.com:imjacobclark/professor.git && cd professor
$ \curl -sSL https://get.rvm.io | bash -s stable
$ gem install bundler
$ bundle install
$ export COURSERA_USERNAME=some@email.com COURSERA_PASSWORD=yourp4ssword && ruby professor.rb
```

