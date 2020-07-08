require_relative 'board.rb'
class Knight
    attr_accessor :board
    MOVES = [[2,1],[2,-1],[1,2],[1,-2],[-2,1],[-2,-1],[-1,2],[-1,-2]]
    def initialize(start,destination)
        @start = Move.new(start,nil)
        @destination = destination
        board = Board.new
        @board = board.squares
        @queue = []
        move_tree(@start,@destination)
    end

    def move_tree(start,destination)
        current = @start
        path = nil
        while path.nil? 
            MOVES.each do |move|
                position = [current.position[0]+ move[0],current.position[1] + move[1]]
                if @board.include? position
                    new_move = Move.new(position,current)
                    current.children << new_move
                    @queue << new_move
                    if position == @destination
                        path = full_path(new_move)
                    end 
                end
            end
            current = @queue.shift
        end 
    end

    def full_path(move)
        path = []
        current = move
        until current.parent.nil?
            path.unshift(current.position)
            current = current.parent
        end
        puts "Your knight reached its destination in #{path.length} moves through this path: "
        p @start.position
        while !path.empty? 
            p path.shift
        end
        path  
    end

end

class Move
    attr_accessor :position, :parent, :children
    def initialize(position,parent)
        @position = position
        @parent = parent
        @children = []
    end
end 

def knight_moves(start, destination)
    Knight.new(start,destination,)
end

knight_moves([1,3],[7,3])



        