# Sidekiq::PerformOnce

Perform [sidekiq](https://github.com/mperham/sidekiq) jobs with the same arguments only once.

Adds perform methods for sidekiq workers: `perform_once`, `perform_once_in` and `perform_once_at` (use them like `perform_async`, `perform_in` and `perform_at`).

## Installation

Add this line to your application's Gemfile:
````ruby
gem 'sidekiq_perform_once'
````
And then execute:
````
$ bundle
````
Include `Sidekiq::PerformOnce` into your sidekiq workers:
````ruby
class CustomWorker
  include Sidekiq::Worker, Sidekiq::PerformOnce
  
  #...
end

## 

If you want to change default options, you can override them somewhere in your coffee/js:
````coffee
$.bootstrapGrowl.defaults = $.extend on, $.bootstrapGrowl.defaults,
  # Box width (number or css-like string, etc. "auto")
  width:       250
  
  # Auto-dismiss timeout. Set it to 0 if you want to disable auto-dismiss
  delay:       4000
  
  # Spacing between boxes in stack
  spacing:     10
  
  # Appends boxes to a specific container
  target:      'body'
  
  # Show close button
  dismiss:     true
  
  # Default class suffix for alert boxes.
  type:        null
  
  # Use the following mapping (Flash key => Bootstrap Alert)
  type_mapping:
    warning: null
    error  : 'error'
    notice : 'info'
    success: 'success'
  
  # Horizontal aligning (left, right or center)
  align:       'right'
  
  # Margin from the closest side
  alignAmount: 20
  
  # Offset from window bounds
  offset:      
    from:      'top'
    amount:    20
````

Insert the following if you want to close alert boxes by clicking on themselves. 
Also it doesn't steel focus from toggled elements like dropdowns and works fine with touch devices, 
so I advise to use it:
````coffee
jQuery ->
  # ...
  $(document).on 'click.alert.data-api', '[data-dismiss="alert"]', (e) -> 
    e.stopPropagation()
  
  $(document).on 'touchstart click', ".bootstrap-growl", (e) -> 
    e.stopPropagation()
    $('[data-dismiss="alert"]', @).click()
    off
````

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
