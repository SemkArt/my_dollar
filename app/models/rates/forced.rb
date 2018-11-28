module Rates
  class Forced < Base
    validates :forced_to, presence: true
    scope :actual, -> { where("datetime('now') < rates.forced_to") }
  end
end
