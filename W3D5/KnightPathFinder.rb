require_relative "./skeleton/lib/00_tree_node.rb"

class KnightPathFinder 

  attr_reader :start_pos 

  def initialize(start_pos)
    @start_pos = start_pos 
    @considered_positions = [start_pos]
    build_move_tree
  end

  def build_move_tree
    self.root_node = PolyTreeNode.new(start_pos)

  end

  def self.valid_moves(pos) [0, 0]
    results = []
    valids = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

    valids.each do |ele|
      current_pos = @start_pos
      current_pos[0], current_pos[1] = pos[0] + current_pos[0], pos[1] + current_pos[1]
      #valid includes pos
      #use current_pos + pos, if its still within the board
      if valids.include?(pos) && current_pos[0] < 8 && current_pos[1] < 8
        results << current_pos
      end
    end

    result


  end

  def new_move_positions(pos)
    valids = valid_moves(pos)
    new_pos = []

    valids.each do |possible|
      unless @considered_positions.include?(pos) 
        @considered_positions << possible
        new_pos << possible
      end
    end

    new_pos
  end





end 