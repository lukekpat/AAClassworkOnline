require_relative "./skeleton/lib/00_tree_node.rb"

class KnightPathFinder 

  attr_reader :start_pos 

  def initialize(start_pos)
    @start_pos = start_pos 
    
    build_move_tree
  end

  def build_move_tree
    self.root_node = PolyTreeNode.new(start_pos)






end 