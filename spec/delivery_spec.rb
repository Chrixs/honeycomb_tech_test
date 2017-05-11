require 'spec_helper'

describe Delivery do

    name = :express
    price = 20
    subject { described_class.new(name, price) }

    it "should have a name attribute" do
      expect(subject.name).to eq(:express)
    end

    it "should have a price attribute" do
      expect(subject.price).to eq(20.00)
    end

    it "price attribute should be a float" do
      expect(subject.price).to be_a(Float)
    end

end
