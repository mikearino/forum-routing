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
  Board.save(board)
  @sub_boards = Board.all()
  erb :boards
end

get ('/boards/new') do
  erb :new_board
end

get ('/boards/:id') do
  @thread = Board.find(params[:id].to_i)
  erb(:sub_board)
end

get ('/sub_board') do
  erb :sub_board
end

get ('/sub_board/thread') do
  erb :thread
end

#Post a new song. After the song is added, Sinatra will route to the view for the album the song belongs to.
post('/boards/:id/threads') do
  @thread = Board.find(params[:id].to_i())
  message = Message.new({:title => params[:thread_title], :body => params[:thread_body], :timestamp => params[:thread_time], :board_id => params[:id].to_i()})
  message.save()
  erb(:sub_board)
end
