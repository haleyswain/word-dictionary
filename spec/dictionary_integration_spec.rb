require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('the word path', {:type => :feature}) do
  it('gathers the user word input in the index page, and displays it in the list of words, as well as the page with its specific definition') do
    visit('/')
    fill_in('word_input', :with => "horse")
    click_button('Add Word')
    expect(page).to have_content("horse")
  end
end

describe('the word and definition path', {:type => :feature}) do
  it ('gathers the user definition input in the list page and adds it to the list of definitions for a specific word') do
    visit('/')
    fill_in('word_input', :with => 'orange')
    click_button('Add Word')
    click_on('orange')
    fill_in('add_definition', :with => "a kind of fruit")
    click_button('Add a Definition')
    expect(page).to have_content('a kind of fruit')
  end
end
