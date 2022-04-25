
# AegisSupport ![](https://img.shields.io/badge/language-ruby-red.svg) ![](https://img.shields.io/badge/gem-0.0.4-brightgreen.svg) 

Aegis Support is a collection of utility classes and library extensions that were found useful for the Rails framework

## Usage

### AegisSupport::SecureNumber
A module with `has_secure_number` method for generate unique numbers

```ruby
# Database Schema:
# 
# Order(
#   order_no: string,
#   order_no_with_prefix: string,
#   order_no_with_suffix: string,
#   order_no_with_specific_length: string
# )
class Order < ActiveRecord::Base
  include AegisSupport::SecureNumber
  
  # replace above column with what your want 
  has_secure_number :order_no
  has_secure_number :order_no_with_prefix, prefix: "PN_"
  has_secure_number :order_no_with_suffix, suffix: "_SN"
  has_secure_number :order_no_with_specific_length, length: 16
end

order = Order.new
order.save

order.order_no # 15103771760966048900
order.order_no_with_prefix # PN_93550490115056646751
order.order_no_with_suffix # 26931151941756843999_SN
order.order_no_with_specific_length # 9124679044244949
```

`SecureRandom.random_number` is used to generate the random numeric string. when the result's length is less than the 
specific(default is 20), some leading zeros will be added to the number to make its width equal to the length. `prefix` 
and `suffix` are not included in the calculation of length.

when the length is long enough, The collisions are highly unlikely. like the `has_secure_token` in ActiveRecord,
it's still possible generate a race condition in the database in the same way that `validates_uniqueness_of` can.
You're encouraged to add a unique index in the database to deal with this even more unlikely scenario

## Installation
Add this line to your application's Gemfile:

```ruby
gem "aegis_support"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install aegis_support
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
