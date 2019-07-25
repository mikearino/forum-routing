require('rspec')
require('board')
require('pry')


describe '#Board' do
  before(:each) do
    Board.clear()
  end
  describe('#==') do
    it("is the same board if it has the same attributes as another board") do
      board1 = Board.new({:name => "Gregs fishing whatever doinks gang"})
      board2= Board.new({:name => "Gregs fishing whatever doinks gang"})
      expect(board1).to(eq(board2))
    end
  end

  describe('#save') do
    it("saves ") do
      board = Board.new({:name => "Gregs fishing whatever doinks gang"}) # nil added as second argument
      board.save()
      board2 = Board.new({:name => "Doinks' fishing whatever doinks gang"}) # nil added as second argument
      board2.save()
      expect(Board.all).to(eq([board, board2]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      board = Board.new({:name => "Gregs fishing whatever doinks gang."}) # nil added as second argument
      board.save()
      board2 = Board.new({:name => "Doinks' fishing whatever doinks gang."}) # nil added as second argument
      board2.save()
      expect(Board.find(board.id)).to(eq(board))
    end
  end

  describe('.clear') do
    it("clears all boards") do
      board = Board.new({:name => "Gregs fishing whatever doinks gang"}) # nil added as second argument
      board.save()
      board2 = Board.new({:name => "Doinks' fishing whatever doinks gang"}) # nil added as second argument
      board2.save()
      Board.clear()
      expect(Board.all).to(eq([]))
    end
  end

  describe('#delete') do
    it("deletes an board by id") do
      board = Board.new({:name => "Gregs fishing whatever doinks gang"}) # nil added as second argument
      board.save()
      board2 = Board.new({:name => "Doinks' fishing whatever doinks gang"}) # nil added as second argument
      board2.save()
      board.delete()
      expect(Board.all).to(eq([board2]))
    end
  end

  # describe('.search') do
  #   it('finds an album by name')do
  #   board = Board.new({:name => "Gregs fishing whatever doinks gang"}) # nil added as second argument
  #   board.save()
  #   board2 = Board.new({:name => "Doinks' fishing whatever doinks gang"}) # nil added as second argument
  #   board2.save()
  #   board.delete()
  #   search = Board.search("Doinks' fishing whatever doinks gang")
  #   expect(search).to(eq(board2))
  #   end
  # end

  describe('#update') do
    it("updates a board by id") do
      board = Board.new({:name => "Gregs fishing whatever doinks gang"}) # nil added as second argument
      board.save()
      board.update("Fish Guts")
      expect(board.name).to(eq("Fish Guts"))
    end
  end
end
