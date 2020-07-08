
class Board
    attr_accessor :rows, :columns, :squares
    def initialize
        rows = []
        columns = []
        @squares = []
        i = 0
        8.times do
            rows << i
            columns << i
            i += 1
        end
        columns.each do |column|
            rows.each do |row|
                square = [column,row]
                @squares << square
            end
        end
        return @squares
    end
end
