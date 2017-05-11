require 'spec_helper'

describe Material do

  id = "WNP/SWCL001/010"
  subject { described_class.new(id) }

  it "should have an id attribute" do
    expect(subject.id).to eq("WNP/SWCL001/010")
  end
end
