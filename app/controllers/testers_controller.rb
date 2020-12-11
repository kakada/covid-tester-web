class TestersController < ApplicationController
  def index
    @testers = Tester.all

    respond_to do |format|
      format.html
      format.csv { send_data @testers.to_csv, filename: "testers-#{Time.now}.csv" }
    end
  end
end
