class DashboardController < ApplicationController

  def index
    @rate = ActualRate.new.last
  end

end
