# README


## Setup

- Ruby version: 2.7.4
- Rails version: 7.0.4

```
  bundle install
```

### Run services
```
  docker-compose build
  docker-compose up -d
```

### Setup database
```
  rails db:create db:migrate
```

### Run application
```
  rails s
```

### Create a user
```
  rails c
```

``` ruby
  User.create(email: "your-user@email", password: "a-strong-password", password_confirmation: "a-strong-password")
```
