require "rspec"
require "spec_helper"

RSpec.describe Array do
  context "#all_empty" do
    it "returns true if all elements of the Array are empty" do
      expect(["","",""].all_empty?).to be_truthy
    end

    it "returns false if not all elements of the Array are empty" do
      expect(["","bob","",1].all_empty?).to be_falsey
    end

    it "returns true for an empty array" do
      expect([].all_empty?).to be_truthy
    end
  end

  context "#all_same" do
    it "returns true if all elements of the Array are the same" do
      expect(["A","A","A"].all_same?).to be_truthy
    end

    it "returns false if some of the Array elements are not the same" do
      expect(["", 1, "", "A"].all_same?).to be_falsey
    end

    it "returns true for an empty array" do
      expect([].all_same?).to be_truthy
    end
  end

  context "#any_empty" do
    it "returns true if any element of the array is empty" do
      expect(["","A","bob"].any_empty?).to be_truthy
    end

    it "returns false if none of the elements are empty" do
      expect(["1","A","BOB"].any_empty?).to be_falsey
    end
  end

  context "#none_empty" do
    it "returns true if none of the elements are empty" do
      expect(["1","A",4].none_empty?).to be_truthy
    end

    it "returns false if any of the elements is empty" do
      expect(["","A","bob"].none_empty?).to be_falsey
    end
  end
end
