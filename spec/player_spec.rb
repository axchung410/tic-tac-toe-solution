# spec/player_spec.rb
require "rspec"
require "spec_helper"

module TicTacToe
  RSpec.describe Player do
    context "#initialize" do

      it "raises an exception when initialized with {}" do
        expect { Player.new({}) }.to raise_error
      end
     
      it "does not raise an error when initialized with a valid input hash" do
        input = { color: "X", name: "Bob" }
        expect { Player.new(input) }.to_not raise_error
      end

    end

    context "#color" do
      it "returns the color" do
        input = { color: "X", name: "Bob" }
        player = Player.new(input)
        expect(player.color).to eq "X"
      end
    end

    context "#name" do
      it "returns the name" do
        input = { color: "X", name: "Bob" }
        player = Player.new(input)
        expect(player.name).to eq "Bob"
      end
    end 
        
  end
end
