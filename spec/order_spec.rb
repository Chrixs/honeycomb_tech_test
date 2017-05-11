require 'spec_helper'
require "pry"

describe Order do

  let(:discounts) { Discounts.new }
  let(:material) { Material.new "WNP/SWCL001/010" }
  subject { described_class.new material, discounts, discounts }
  let(:express_delivery) { Delivery.new(:express, 20.00) }
  let(:standard_delivery) { Delivery.new(:standard, 10.00) }
  let(:sky) { Broadcaster.new(:sky) }
  let(:viacom) { Broadcaster.new(:viacom) }

  it "should have a material with an id attribute" do
    expect(subject.material.id).to eq("WNP/SWCL001/010")
  end

  it "should be able to add a broadcaster" do
    subject.add(:Sky, :express_delivery)
    expect(subject.items[0][0]).to eq :Sky
  end

  it "should output a total" do
    subject.add sky, express_delivery
    subject.add viacom, standard_delivery
    expect(subject.total_before_discounts).to eq 30.00
  end

end
