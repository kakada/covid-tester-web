class TestersController < ApplicationController
  def index
    @testers = Tester.all.order(visited_at: :desc)

    respond_to do |format|
      format.html
      format.csv { send_data @testers.to_csv, filename: "testers-#{Time.now}.csv" }
    end
  end
end
