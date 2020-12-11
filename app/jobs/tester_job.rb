class TesterJob < ApplicationJob
  queue_as :default

  def perform(params)
    Tester.create(params)
  end
end
