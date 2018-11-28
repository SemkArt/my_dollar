module Admin
  class RatesController < Admin::BaseController

    def index
      @rates = Rates::Base.all
      @rate = Rates::Forced.new(forced_to: 1.hour.from_now)
    end

    def create
      @rate = Rates::Forced.new(create_params)
      if @rate.save
        ActualRate.new.broadcast
        redirect_to admin_root_path
      else
        render :index
      end
    end

    private

    def create_params
      params
        .require(:rates_forced)
        .permit(:value, :forced_to)
    end
  end
end
