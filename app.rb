require('sinatra')
require('sinatra/reloader')
require('./lib/board')
require('./lib/message')
require('pry')
also_reload('lib/**/*.rb')

get ('/') do
  @sub_boards = Board.all
  erb :boards
end

get ('/boards') do
  erb :boards
end

post ('/boards') do
  name = params[:board_name]
  board = Board.new({:name => name})
  board.save()
  @sub_boards = Board.all()
  erb :boards
end

get ('/boards/new') do
  erb :new_board
end

get ('/boards/:id') do
  @sub_boards = Board.find(params[:id].to_i())
  erb(:sub_board)
end

get ('/sub_board') do
  erb :sub_board
end

get ('/sub_board/thread') do
  erb :thread
end
