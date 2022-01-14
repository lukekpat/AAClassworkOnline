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
        raise "not a child" if child_node.parent.nil?
        child_node.parent = nil
    end

    def dfs(target_value)
        return nil if self.nil?
        return self if self.value == target_value

        self.children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end

        nil
    end

    def bfs(target_value)
        list = [self]

        until list.empty?
            current = list.pop
            return current if current.value == target_value

            current.children.each do |child|
                list.unshift(child)
            end
        end
    end
end