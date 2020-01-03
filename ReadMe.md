# Advent of Code 2016
## Robert Haines

My (belated) attempt at doing [Advent of Code 2016](http://adventofcode.com/2016) in Ruby, with tests and all the trimmings.

### Usage

After cloning, and changing into the `aoc-2016` directory, run:

```shell
$ gem install bundler
$ bundle install
$ rake
```

This will set everything up and run all the tests.

To run the solution for a particular day:

```shell
$ ./aoc-2016 <day>
```

Or via `rake`:

```shell
$ rake run <day>
```

You can run multiple days like this:

```shell
$ rake run <day_1> <day_2> ... <day_n>
```

### Licence

[Public Domain](http://unlicense.org).
