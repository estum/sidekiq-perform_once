# Sidekiq::PerformOnce

Perform [sidekiq](https://github.com/mperham/sidekiq) jobs with the same arguments only once.

Adds perform methods for sidekiq workers: `perform_once`, `perform_once_in` and `perform_once_at` (use them like `perform_async`, `perform_in` and `perform_at`).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sidekiq_perform_once'
```

And then execute:

```
$ bundle
```

Include `Sidekiq::PerformOnce` into your sidekiq workers:

```ruby
class CustomWorker
  include Sidekiq::Worker, Sidekiq::PerformOnce
  
  #...
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
