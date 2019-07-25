class Message
  attr_reader :id
  attr_accessor :title, :body, :timestamp, :board_id

  @@messages = {}
  @@total_rows = 0

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @body = attributes.fetch(:body)
    @timestamp = attributes.fetch(:timestamp)
    @board_id = attributes.fetch(:board_id)
    @id = id || @@total_rows += 1
  end

  def ==(message_to_compare)
    (self.title() == message_to_compare.title()) && (self.board_id() == message_to_compare.board_id())
  end

  def self.all
    @@messages.values
  end

  def messages
    Message.find_by_board(self.id)
  end

  def board
    Board.find(self.board_id)
  end

  def save
    @@messages[self.id] = Message.new({:title => self.title, :body => self.body, :timestamp => self.timestamp, :board_id => self.board_id, :id => self.id})
  end

  def self.find(id)
    @@messages[id]
  end

  def self.find_by_board(board_id)
    messages = []
    @@messages.values.each do |message|
      if message.board_id == board_id
        messages.push(message)
      end
    end
    messages
  end

  def update(title, board_id)
    self.title = title
    self.board_id = board_id
    @@messages[self.id] = Message.new({:title => self.title, :body => self.body, :timestamp => self.timestamp, :board_id => self.board_id, :id => self.id})
  end

  def delete
    @@messages.delete(self.id)
  end

  def self.clear
    @@messages = {}
  end
end
