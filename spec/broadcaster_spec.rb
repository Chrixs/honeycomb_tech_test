require 'spec_helper'

describe Broadcaster do

  subject { described_class.new("Viacom") }

  it "should have a name attribute" do
    expect(subject.name).to eq("Viacom")
  end

end
