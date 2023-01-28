FactoryBot.define do
  factory :task_performance do
    task
    user { task.user }

    start_at { Time.current.yesterday.beginning_of_day }
    end_at { Time.current.tomorrow.end_of_day }
  end
end
