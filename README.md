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

## Run

* This is a command line app and it has to be run from the command line. This is possible via the addition of the following block of code in the `log_parser.rb` file

```ruby
if $PROGRAM_NAME == __FILE__
  LogParser.new(ARGV[0]).read_file
end
```

* In the terminal

```shell
$ ruby lib/log_parser.rb webserver_sample_copy.log
"webserver_sample_copy.log"
```

* Screenshot

![Screenshot 2020-10-27 at 12 48 09 AM](https://user-images.githubusercontent.com/57366310/97237381-a81c9480-17ef-11eb-99e1-222d2a8d65c6.png)

* improve without the need for command `ruby`

![Screenshot 2020-10-27 at 12 21 23 PM](https://user-images.githubusercontent.com/57366310/97289426-d5009400-184f-11eb-91f1-e598f523cb70.png)

* Return a list of webpages with most page views ordered from most pages views to less page views

![Screenshot 2020-10-27 at 3 23 22 PM](https://user-images.githubusercontent.com/57366310/97307482-6da30e00-1868-11eb-9ed3-bc88cedea0df.png)
