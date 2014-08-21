require "active_support/concern"

module Sidekiq
  module PerformOnce
    extend ActiveSupport::Concern
    
    module ClassMethods
      def perform_once(*args)
        Base.new(self, *args).keep_one_job_or_perform!
      end
            
      def perform_once_in(delay, *args)
        Delayed.new(self, delay.to_i, *args).keep_one_job_or_perform!
      end
      
      alias_method :perform_once_now, :perform_once
      alias_method :perform_once_at,  :perform_once_in
    end
  end
end