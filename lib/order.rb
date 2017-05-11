class Order

  COLUMNS = {
    broadcaster: 20,
    delivery: 8,
    price: 8
  }.freeze

  attr_accessor :material, :items, :total, :discounts, :discounts_total, :cumulative_discounts

  def initialize(material, discounts, cumulative_discounts)
    self.material = material
    self.items = []
    self.total = 0
    self.discounts_total = 0
    self.discounts = discounts
    self.cumulative_discounts = cumulative_discounts
  end

  def add(broadcaster, delivery)
    items << [broadcaster, delivery]
  end

  def total_before_discounts
    items.each do |x|
      self.total += x[1].price
    end
    self.total
  end

  def total_after_discounts
    total_before_discounts
    calculate_discounts(self.discounts, self.cumulative_discounts)
    self.total
  end

  def output
    [].tap do |result|
      result << "Order for #{material.id}:"

      result << COLUMNS.map { |name, width| name.to_s.ljust(width) }.join(' | ')
      result << output_separator

      items.each_with_index do |(broadcaster, delivery), index|
        result << [
          broadcaster.name.ljust(COLUMNS[:broadcaster]),
          delivery.name.to_s.ljust(COLUMNS[:delivery]),
          ("$#{delivery.price}").ljust(COLUMNS[:price])
        ].join(' | ')
      end

      result << output_separator
      result << "Total: $#{total_after_discounts}"
    end.join("\n")
  end

  private

  def output_separator
    @output_separator ||= COLUMNS.map { |_, width| '-' * width }.join(' | ')
  end

  def calculate_discounts(discounts, cumulative_discounts)
    discounts.two_express_deliveries?(self)
    cumulative_discounts.over_thirty?(self)
  end
end
