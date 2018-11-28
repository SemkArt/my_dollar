require 'net/http'
class GetRatesJob < ApplicationJob
  URL = 'https://www.cbr-xml-daily.ru/daily_json.js'.freeze
  queue_as :default

  def perform
    Rates::Original.create(value: usd_value)
    ActualRate.new.broadcast
  end

  private

  def usd_value
    json['Valute']['USD']['Value']
  end

  def json
    JSON.parse(response.body)
  end

  def response
    Net::HTTP.get_response(URI.parse(URL))
  end

end
