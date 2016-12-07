require('rspec')
require('pry')
require('word')


describe(Word) do
  before() do
    Word.clear()
  end

describe(".all") do
  it("starts off with no words") do
    expect(Word.all()).to(eq([]))
  end
end

describe('#name') do
    it("returns the name of the word") do
      test_word = Word.new('pony')
       expect(test_word.name()).to(eq('pony'))
    end
  end

  describe("#id") do
    it("sets a word's ID when you save it") do
      word = Word.new("plant")
      word.save()
      expect(word.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      test_word = Word.new("plant")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".find") do
   it("returns a word by its id number") do
     test_word = Word.new("Vegetable")
     test_word.save()
     test_word2 = Word.new("Fruit")
     test_word2.save()
     expect(Word.find(test_word.id())).to(eq(test_word))
   end
 end
end
