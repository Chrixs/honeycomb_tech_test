class Order

  attr_accessor :material, :items

  def initialize(material)
    self.material = material
    self.items = []
  end

  def add(broadcaster, delivery)
   items << [broadcaster, delivery]
  end

  def total
    total = 0
    items.each do |x|
      total += x[1].price
    end
    return total
  end

end
