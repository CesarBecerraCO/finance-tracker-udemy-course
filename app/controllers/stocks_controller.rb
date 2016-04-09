class StocksController < ApplicationController
  def search
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      @stock ||= Stock.new_from_lookup(params[:stock])
    end
    
    if @stock
      #Just for testing:
      #render json: @stock
      # Try:
      #     https://udemyrubycourse-cesbecer.c9users.io/search_stocks?stock=AAPL
      #     https://udemyrubycourse-cesbecer.c9users.io/search_stocks?stock=GOOG
      
      #For using in the view
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end
  end
end
