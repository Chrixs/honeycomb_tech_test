class Delivery
  attr_accessor :name, :price

  def initialize(name, price)
    self.name = name
    self.price = price.to_f.round(2)
  end
end
