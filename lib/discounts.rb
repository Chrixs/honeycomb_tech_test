require 'pry'

class Discounts

  attr_accessor :count, :discounts_total

  def initialize
    self.count = 0
    self.discounts_total = 0
  end

  def five_off_express_deliveries(order)
    order.discounts_total -= 5*self.count
    order.total += order.discounts_total
  end

  def two_express_deliveries?(order)
    order.items.each do |x|
      if x[1].name == :express
        self.count += 1
      end
    end
    if self.count >= 2
      five_off_express_deliveries(order)
    end
  end

end
