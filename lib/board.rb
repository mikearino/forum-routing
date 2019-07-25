class Board
  attr_reader :id
  attr_accessor :name

  @@sub_boards = {}
  @@total_rows = 0

  def initialize(attributes)
    @@total_rows += 1
    @name = attributes.fetch(:name)
    @id = @@total_rows
  end

  def ==(board_to_compare)
    self.name() == board_to_compare.name()
  end

  def self.all()
    @@sub_boards.values()
  end

  def self.find(id)
    @@sub_boards[id]
  end

  def self.search(board_name)
    search_array = []
    @@sub_boards.each_value do |board|
      if board.name.match?(board_name)
        search_array.push(board)
      end
    end
    return search_array
  end

  def self.clear
    @@sub_boards = {}
    @@total_rows = 0
  end

  def messages
    Message.find_by_board(self.id)
  end

  def self.save (board)
    @@sub_boards[board.id] = board
  end

  def update(name)
    self.name = name
    @@sub_boards[self.id] = Board.new({:name => self.name, :id => self.id})
  end

  def delete
    @@sub_boards.delete(self.id)
  end

end
