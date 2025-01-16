# frozen_string_literal: true

require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = {
    url: 'redis://127.0.0.1:6379',
    namespace: ENV.fetch("SIDEKIQ_NAMESPACE") { 'tasks' }
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: 'redis://127.0.0.1:6379',
    namespace: ENV.fetch("SIDEKIQ_NAMESPACE") { 'tasks' }
  }
end
