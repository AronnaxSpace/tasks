class ExpireTaskPerformancesJob < ApplicationJob
  queue_as :default

  def perform
    TaskPerformance.pending.past.find_each(&:expire!)
  end
end
