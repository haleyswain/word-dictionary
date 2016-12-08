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

describe('#word') do
  it('returns the word inputted by the user') do
    test_word = Word.new(:word => "pony")
    test_word.save()
    expect(test_word.word()).to(eq("pony"))
  end
end

  describe("#id") do
    it("sets a word's ID when you save it") do
      word = Word.new(:word => "plant")
      word.save()
      expect(word.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      test_word = Word.new(:word => "plant")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".find") do
   it("returns a word by its id number") do
     test_word = Word.new(:word => "Vegetable")
     test_word.save()
     test_word2 = Word.new(:word => "Fruit")
     test_word2.save()
     expect(Word.find(test_word.id())).to(eq(test_word))
   end
 end
end
