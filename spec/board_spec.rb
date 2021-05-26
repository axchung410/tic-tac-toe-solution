#spec/board_spec.rb
require "rspec"
require "spec_helper"

module TicTacToe
  RSpec.describe Board do

    context "#initialize" do
      it "initializes the board with a grid" do
        expect { Board.new(grid: "grid") }.to_not raise_error
      end

      it "sets the grid with three rows by default" do
        board = Board.new
        expect(board.grid).to have(3).things
      end

      it "creates three things in each row by default" do
        board = Board.new
        board.grid.each do |row|
          expect(row).to have(3).things
        end
      end
    end

    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "grid")
        expect(board.grid).to eq "grid"
      end
    end

    context "#get_cell" do
      it "returns the cell based on the (x,y) coordinate" do
        grid = [["","",""],["","","bob"],["mary","john","nana"]]
        board = Board.new(grid: grid)
        expect(board.get_cell(2,1)).to eq "bob"
      end
    end

    context "#set_cell" do
      it "updates the value of a cell at (x,y) coordinate" do
        Cat = Struct.new(:value)
        grid = [[Cat.new("cool"),"",""],["","",""],["","",""]]
        board = Board.new(grid: grid)
        board.set_cell(0,0,"meow")
        expect(board.get_cell(0,0).value).to eq "meow"
      end
    end

    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new("X") }
    let(:y_cell) { TestCell.new("Y") }
    let(:empty) { TestCell.new }
    
    context "#game_over" do
      it "returns :winner if winner? is true" do
        board = Board.new
        allow(board).to receive(:winner?).and_return(true)
        #board.stub(:winner?) {true} # would work with RSpec 2.x
        expect(board.game_over).to eq :winner
      end

      it "returns :draw if winner? is false and draw? is true" do
        board = Board.new
        allow(board).to receive(:winner?).and_return(false)
        allow(board).to receive(:draw?).and_return(true)
        #board.stub(:draw?) {true} # this would also work with RSpec 2.x
        expect(board.game_over).to eq :draw
      end

      it "returns false if winner? is false and draw? is false" do
        board = Board.new
        allow(board).to receive(:winner?).and_return(false)
        allow(board).to receive(:draw?).and_return(false)
        #board.stub(:winner?) {false} # these would work work RSpec 2.x
        #board.stub(:draw?) {false}
        expect(board.game_over).to be false
      end

      it "returns :winner when row has objects with value that are all the same" do
        grid = [
          [x_cell, x_cell, x_cell],
          [y_cell, x_cell, y_cell],
          [x_cell, y_cell, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when column has objects with value that are all the same" do
        grid = [
          [x_cell, y_cell, x_cell],
          [y_cell, y_cell, x_cell],
          [empty, y_cell, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when diagonals has objects with value that are all the same" do
        grid = [
          [x_cell, y_cell, empty],
          [y_cell, x_cell, y_cell],
          [empty, y_cell, x_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :draw when entire board has taken with no winner" do
        grid = [
          [x_cell, y_cell, x_cell],
          [y_cell, x_cell, x_cell],
          [y_cell, x_cell, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :draw
      end

      it "returns false when no :draw or :winner" do
        grid = [
          [x_cell, y_cell, empty],
          [y_cell, x_cell, empty],
          [x_cell, x_cell, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to be_falsey
      end
    end

  end
end
