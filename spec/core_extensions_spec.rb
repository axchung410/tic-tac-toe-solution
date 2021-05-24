require "rspec"
require "spec_helper"

RSpec.describe Array do
  context "#all_empty" do
    it "returns true if all elements of the Array are empty" do
      expect(["","",""].all_empty?).to be_true
    end

    it "returns false if not all elements of the Array are empty" do
      expect(["","bob","",1].all_empty?).to be_false
    end

    it "returns true for an empty array" do
      expect([]).all_empty?).to be_true
    end
  end
end
