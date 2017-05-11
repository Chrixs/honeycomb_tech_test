require 'spec_helper'

describe Discounts do

  subject { described_class.new }
  let(:cumulative_discounts) { CumulativeDiscounts.new }
  let(:order) { Order.new(material, subject, cumulative_discounts) }
  let(:material) { Material.new "WNP/SWCL001/010" }
  let(:express_delivery) { Delivery.new(:express, 20.00) }
  let(:standard_delivery) { Delivery.new(:standard, 10.00) }
  let(:sky) { Broadcaster.new(:sky) }
  let(:viacom) { Broadcaster.new(:viacom) }
  let(:disney) { Broadcaster.new(:disney) }

  before (:each) do
    order.add sky, express_delivery
    order.add viacom, standard_delivery
  end

  it "should reduce by 10 percent" do
    order.add disney, standard_delivery
    order.total_after_discounts
    expect(order.total).to eq 36.00
  end

end
