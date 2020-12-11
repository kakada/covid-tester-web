class TestersController < ApplicationController
  def index
    @testers = Tester.all
  end
end
