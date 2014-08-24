# Description

Performing [sidekiq](https://github.com/mperham/sidekiq) workers with the same arguments only once. It is useful when you don't want to enqueue several jobs with the same arguments. But you should be careful with frequent jobs!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sidekiq-perform_once'
```

## Usage

Include `Sidekiq::PerformOnce` into your workers:

```ruby
class CustomWorker
  include Sidekiq::Worker, Sidekiq::PerformOnce
  #...
end
```

For immediatly performing use `perform_once(*args)` method (alias `perform_once_now`).  
For scheduled performing use `perform_once_in(delay, *args)` (alias `perform_once_at(time, *args)`).

For example, we have `CategoryIconWorker` which updates category icon from its last item every time it added, but we want to update it only once per 3 minutes. So we can add `after_commit on: :create` callback with the following code:

```ruby
CategoryIconWorker.perform_once_in(3.minutes, category_id)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
