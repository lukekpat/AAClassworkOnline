# Kevin and Luke - PolyTreeNode 

class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        # Set the parent property 
        # Add the Node to its parent's array of children UNLESS setting parent to nil.
        
        # We should also REMOVE it from the OLD parent's children array (unless OLD parent is nil)

        self.parent.children.delete(self) unless self.parent.nil?

        @parent = parent 
        @parent.children << self unless parent.nil?
    end

    def add_child(child_node)
        child_node.parent = self 
    end

    def remove_child(child_node)
        children.delete(child_node)
    end
end