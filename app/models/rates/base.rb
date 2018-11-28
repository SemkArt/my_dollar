module Rates
  class Base < ApplicationRecord
    self.table_name = 'rates'
    validates :value, presence: true
  end
end
