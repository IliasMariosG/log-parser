# Log Parser

## Set up

### Create a Gemfile

```shell
bundle init
```

* Check ruby version

```shell
ruby -v
```

* Open Gemfile

Add ruby version after the `git_source` line, e.g. `ruby '2.7.0'`

* Run bundle to install any potentially missing dependencies (automatically generates a Gemfile.lock)

```shell
bundle
```

### Create RSpec conventional files

```shell
rspec --init
cd spec/
touch log_parser_spec.rb
```

### Add SimpleCov

* Open Gemfile and add

```ruby
gem 'simplecov'
```

* Run `bundle install`

### Add Rubocop

* Open Gemfile and add

```ruby
gem 'rubocop'
```

* Run `bundle install`
