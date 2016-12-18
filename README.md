## Overview

Absence Alert is a [FLOSS][floss] tool that will help vulnerable populations and activists get the word out to their friends and family in case they are arrested or detained. When you sign up for an account, you enter a message to be sent to a list of email addresses. From that moment forward, you'll have to regularly (say, daily) disable that alert from being sent.

## Development

### Setup

Development is done in [Docker][docker], and the app is built with Rails (version 5) and Bootstrap. To get started you'll need Docker and [Docker Compose][docker-compose] installed and running on your system. 

To build, run:

```
docker-compose up
```

And to populate the database, open a terminal session in the app:

```
docker exec -it absencealert_app_1 bash
```

Within the session migrate the db:

```
rake db:migrate
```

The app should then be available at localhost:3000

### Adding gems

To persist additional gems in your Docker image, after updating the gemfile you will need to run:

 ```
 docker-compose build
 ```


### Possible additions:

* Configuration

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


[docker]:<https://www.docker.com/>
[docker-compose]:<https://docs.docker.com/compose/>
[floss]:<https://www.gnu.org/philosophy/floss-and-foss.en.html>
