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

## Summary &  To improve

* Given more time
    
I would split the file into two separate classes, one responsible for parsing and one for printing the requirements

Another sorting and possible taking leverage of the `uniq` method would allow me to satisfy the unique page views requirement
  
* Planning

I had planned my solution based on the most common `ruby log_parser` command. It proved challenging to get the `./parser.rb webserver.log` command working, something that occupied much time. Also, through my research I was not able to find a method to test the following block of code:

  ```ruby
  if $PROGRAM_NAME == __FILE__
    LogParser.new(ARGV[0]).read_file
  end
  ```
  which eventually became:

  ```ruby
  if $PROGRAM_NAME == __FILE__
    LogParser.new(ARGV[0]).format_message([['/help_page/1', 4], ['/about', 1], ['/index', 1],\
                                           ['/about/2', 1], ['/home', 1], ['/contact', 1]])
  end
  ```
  It would be lovely to learn how to test system method and become more familiar with file handling problems. It seems that there are various approaches that someone can use, such as `File`, `CSV` or the `StringIO` to name a few

* Linting and formatting with rubocop

It was taken care of while I was solving the problem and was not left for the very last moment. Someone could argue that this takes time from solving the actual prolem, however, I'm on the camp that sees quality as an asset, rather than a cost

* TDD and bulding up

Ideally I would prefer to commit and push also failing tests so that someone could see how my TDD process was gradually building up (e.g. writing a test for a class that was not defined in the main ruby file, etc). However, I created one test for a file that contained one line, then for two and then for 8 rows. Accordingly, I was adjusting my tests, specifically the expected output and the input where it was neccessary. Now, in the conditional

`LogParser.new(ARGV[0]).format_message(argument_here)`

as long as the file of interest is passed in as an argument, the command line app works for any number of rows.

* Finally,

given the description of the exercise and my understanding of it,

a) I thought it would be best if I tested the entire given `.log` file. Again, the command line app requirement was time consuming until I figure out the concept and implement my solution

b) I decided not to test cases where the file didn't exist, or if it was empty, but this is something that can be implemented

Thank you , I had fun.