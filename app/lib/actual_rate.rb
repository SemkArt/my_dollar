class ActualRate

  def last
    Rates::Forced.actual.last || Rates::Original.last
  end

  def broadcast
    ActionCable
      .server
      .broadcast('rates_channel', {
        value: last&.value
      })
  end

end
