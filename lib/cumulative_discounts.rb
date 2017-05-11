class CumulativeDiscounts

  def initialize
  end

  def over_thirty?(order)
    if order.total > 30.00
      ten_percent_off(order)
    end
  end

  def ten_percent_off(order)
    order.total *= 0.9
  end

end
