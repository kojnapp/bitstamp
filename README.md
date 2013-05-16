# Bitstamp Ruby API

Feel free to fork, modify & redistribute under the MIT license.

## Installation

Add this line to your application's Gemfile:

    gem 'kojn'
    
## Setup

```ruby
Bitstamp.setup do |config|
  config.key = YOUR_BITSTAMP_USERNAME
  config.secret = YOUR_BITSTAMP_PASSWORD
end
```

If you fail to set your `key` or `secret` a `MissingConfigExecption`
will be raised.

## Bitstamp ticker

The bitstamp ticker. Returns `last`, `high`, `low`, `volume`, `bid` and `ask`

```ruby
Bitstamp.ticker
```

## Fetch your open order

Returns an array with your open orders.

```ruby
Bitstamp.orders.all
```

## Create a sell order

Returns an `Order` object.

```ruby
Bitstamp.orders.sell(amount: 1.0, price: 111)
```

## Create a buy order

Returns an `Order` object.

```ruby
Bitstamp.orders.buy(amount: 1.0, price: 111)
```

To be continued!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b
my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


