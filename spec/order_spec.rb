require 'spec_helper'
require "pry"

describe Order do

  subject { described_class.new material }
  let(:material) { Material.new "WNP/SWCL001/010" }
  let(:express_delivery) { Delivery.new(:express, 20.00) }
  let(:standard_delivery) { Delivery.new(:standard, 10.00) }
  let(:sky) { Broadcaster.new(:Sky) }
  let(:viacom) { Broadcaster.new(:Viacom) }

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
    expect(subject.total).to eq 30.00
  end

end
