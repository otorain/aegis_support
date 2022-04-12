# Aeg*i*sSupport
Aegis Support is a collection of utility classes and library extensions that were found useful for the Rails framework

## Usage

### AegisSupport::SecureNumber
A module with `has_secure_number` method for generate unique numbers，

```ruby
# Schema: Order(order_no:string)
class Order < ActiveRecord::Base
  include AegisSupport::SecureNumber
  
  # replace `order_no` with your column
  has_secure_number :order_no
end

order = Order.new
order.save

order.order_no # 15103771760966048900
```

The generate algorithm is: 
```ruby
SecureRandom.random_number(4.gigabytes ** 2).to_s.rjust(20, "0")
```

Thus it will generate a random numeric string of 20 characters long, so collisions are highly unlikely.
like the `has_secure_token` in ActiveRecord, it's still possible generate a race condition in the database 
in the same way that `validates_uniqueness_of` can. You're encouraged to add a unique index in the database 
to deal with this even more unlikely scenario

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
