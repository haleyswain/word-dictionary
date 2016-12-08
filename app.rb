require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/definition")
require('./lib/word')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/') do
  word_input = params.fetch('word_input')
  add_word = Word.new(:word => word_input)
  add_word.save()
  @words = Word.all()
  erb(:index)
end

get('/list/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:list)
end


post('/definition_form') do
  @word = Word.find(params.fetch("word_id").to_i())
  add_definition = params.fetch("add_definition")
  new_definition = Definition.new(:definition => add_definition)

  @word.add_definition(new_definition)
  erb(:list)
end
