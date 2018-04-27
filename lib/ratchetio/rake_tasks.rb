require 'ratchetio'

namespace :ratchetio do
  desc "Verify your gem installation by sending a test exception to Ratchet.io"
  task :test => [:environment] do
    Rails.logger = defined?(ActiveSupport::TaggedLogging) ?
      ActiveSupport::TaggedLogging.new(Logger.new(STDOUT)) :
      Logger.new(STDOUT)

    Rails.logger.level = Logger::DEBUG
    Ratchetio.configure do |config|
      config.logger = Rails.logger
    end

    require './app/controllers/application_controller'

    class RatchetioTestingException < RuntimeError; end

    unless Ratchetio.configuration.access_token
      puts "Ratchet.io needs an access token configured. Check the README for instructions."
      exit
    end

    unless defined?(ApplicationController)
      puts "No ApplicationController found"
      exit
    end

    puts "Setting up the controller"
    class ApplicationController
      prepend_before_filter :test_ratchetio
      def test_ratchetio
        puts "Raising Ratchetio TestingException to simulate app failure"
        raise RatchetioTestingException.new, 'Testing ratchetio with "rake ratchetio:test". If you can see this, it works.'
      end

      def verify
      end

      def logger
        nil
      end
    end

    class RatchetioTestController < ApplicationController; end

    Rails.application.routes_reloader.execute_if_updated
    Rails.application.routes.draw do
      # match 'verify' => 'application#vefiry', :as => 'verify'
      get 'verify' => 'application#vefiry', :as => 'verify'
    end

    puts "Processing..."
    env = Rack::MockRequest.env_for("/verify")

    Rails.application.call(env)
  end
end