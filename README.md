# Monthly

Helps you find out how many partial months (e.g. 1.3) there are between to dates. I use it for handling prorated, monthly billing cycles.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'monthly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monthly

## Usage

### Partial Months

If you have a monthly subscription of $1 per month, and a customer should pay for a period of 12.1.2015–4.3.2015, you can ask Monthly how many months that corresponds to:

```
from = Date.parse '12.1.2015'
to = Date.parse '3.2.2015'
days_per_month = 30 # common practice
Monthly.partial_months(from, to, days_per_month) # 0.7333333333333333
```

### Split period into months

```
from = Date.parse '1.1.2015'
to = Date.parse '3.2.2015'
Monthly.periods_by_month(from, to)
# Returns:
# {:from=>#<Date: 2015-01-01 ((2457024j,0s,0n),+0s,2299161j)>, :to=>#<Date: 2015-01-31 ((2457054j,0s,0n),+0s,2299161j)>}
# {:from=>#<Date: 2015-02-01 ((2457055j,0s,0n),+0s,2299161j)>, :to=>#<Date: 2015-02-03 ((2457057j,0s,0n),+0s,2299161j)>}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/2rp/monthly. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
