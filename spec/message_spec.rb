require('rspec')
require('message')
require('pry')
require('board')

describe '#Message' do

  before(:each) do
    Board.clear()
    Message.clear()
    @board = Board.new({:name => "Gregs fishing whatever doinks gang"})
    Board.save(@board)
  end

  describe('#==') do
    it("is the same message if it has the same attributes as another message") do
      message = Message.new({:title => 'Jengus pole', :body => 'today was the best chungus of life ever had', :timestamp => "today", :board_id => @board.id})
      message2 = Message.new({:title => 'Jengus pole', :body => 'today was the best chungus of life ever had', :timestamp => "today", :board_id => @board.id})
      expect(message).to(eq(message2))
    end
  end

  describe('.all') do
    it("returns a list of all messages") do
      message = Message.new({:title => 'Schwarma gas in the spaghetti house', :body => 'Mondays youre lookin at it.', :timestamp => "today", :board_id => @board.id})
      message.save()
      message2 = Message.new({:title => 'Jengus pole', :body => 'today was the best chungus of life ever had', :timestamp => "today", :board_id => @board.id})
      message2.save()
      expect(Message.all).to(eq([message, message2]))
    end
  end

  describe('.clear') do
    it("clears all messages") do
      message = Message.new({:title => 'Schwarma gas in the spaghetti house', :body => 'Mondays youre lookin at it.', :timestamp => "today", :board_id => @board.id})
      message.save()
      message2 = Message.new({:title => 'Jengus pole', :body => 'today was the best chungus of life ever had', :timestamp => "today", :board_id => @board.id})
      message2.save()
      Message.clear()
      expect(Message.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a message") do
      message = Message.new({:title => 'Schwarma gas in the spaghetti house', :body => 'Mondays youre lookin at it.', :timestamp => "today", :board_id => @board.id})
      message.save()
      expect(Message.all).to(eq([message]))
    end
  end

  describe('.find') do
    it("finds a message by id") do
      message = Message.new({:title => 'Schwarma gas in the spaghetti house', :body => 'Mondays youre lookin at it.', :timestamp => "today", :board_id => @board.id})
      message.save()
      message2 = Message.new({:title => 'Jengus pole', :body => 'today was the best chungus of life ever had', :timestamp => "today", :board_id => @board.id})
      message2.save()
      expect(Message.find(message.id)).to(eq(message))
    end
  end

  describe('.find_by_board') do
    it("finds messages for a board") do
      board2 = Board.new({:name => "Fish juice"})
      Board.save(board2)
      message = Message.new({:title => 'Schwarma gas in the spaghetti house', :body => 'Mondays youre lookin at it.', :timestamp => "today", :board_id => @board.id})
      message.save()
      message2 = Message.new({:title => 'Jengus pole', :body => 'today was the best chungus of life ever had', :timestamp => "today", :board_id => board2.id})
      message2.save()
      expect(Message.find_by_board(board2.id)).to(eq([message2]))
    end
  end

  describe('#messages') do
    it("returns a board's messages") do
      board = Board.new({:name => "Gregs fishing whatever doinks gang"})
      Board.save(board)
      message = Message.new({:title => 'Schwarma gas in the spaghetti house', :body => 'Mondays youre lookin at it.', :timestamp => "today", :board_id => board.id})
      message.save()
      message2 = Message.new({:title => 'Jengus pole', :body => 'today was the best chungus of life ever had', :timestamp => "today", :board_id => board.id})
      message2.save()
      expect(board.messages).to(eq([message, message2]))
    end
  end

  describe('#board') do
    it("finds the board a message belongs to") do
      message = Message.new({:title => 'Schwarma gas in the spaghetti house', :body => 'Mondays youre lookin at it.', :timestamp => "today", :board_id => @board.id})
      message.save()
      expect(message.board()).to(eq(@board))
    end
  end

  describe('#update') do
    it("updates an message by id") do
      message = Message.new({:title => 'Schwarma gas in the spaghetti house', :body => 'Mondays youre lookin at it.', :timestamp => "today", :board_id => @board.id})
      message.save()
      message.update("I got ate by a dangus", @board.id)
      expect(message.title).to(eq("I got ate by a dangus"))
    end
  end

  describe('#delete') do
    it("deletes an message by id") do
      message = Message.new({:title => 'Schwarma gas in the spaghetti house', :body => 'Mondays youre lookin at it.', :timestamp => "today", :board_id => @board.id})
      message.save()
      message2 = Message.new({:title => 'Jengus pole', :body => 'today was the best chungus of life ever had', :timestamp => "today", :board_id => @board.id})
      message2.save()
      message.delete()
      expect(Message.all).to(eq([message2]))
    end
  end
end
