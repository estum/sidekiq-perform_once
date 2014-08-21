require "active_support/core_ext/array/wrap"

module Sidekiq
  module PerformOnce
    class Base
      def initialize(worker, *args)
        @worker, @args = worker, args
      end
      
      def jobs
        @jobs ||= Array.wrap(get_queue.select {|j| j.klass == @worker.name && j.args == @args })
      end
      
      def keep_one_job_or_perform!
        case jobs
        when (lambda &:one?)   then jobs.first.try(:jid)
        when (lambda &:many?)  then keep_one_job!
        when (lambda &:empty?) then perform!
        end
      end
      
      private
      def get_queue
        Sidekiq::Queue.new(@worker.send(:get_sidekiq_options).try(:fetch, "queue"))
      end
      
      def kept_job
        jobs.first
      end
      
      def perform!
        @worker.perform_async(*@args)
      end
      
      def keep_one_job!
        kept_jid = kept_job.try(:jid)
        return if kept_jid.nil?
        jobs.each {|j| j.delete if j.jid != kept_jid }
        return kept_jid
      end
    end
  end
end