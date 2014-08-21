module Sidekiq
  module PerformOnce
    class Delayed < Base
      def initialize(worker, delay, *args)
        @worker, @delay, @args = worker, delay, args
      end
      
      private
      def get_queue
        Sidekiq::ScheduledSet.new
      end
      
      def kept_job
        jobs.max_by(&:enqueued_at)
      end
      
      def perform!
        @worker.perform_in(@delay, *@args)
      end
    end
  end
end