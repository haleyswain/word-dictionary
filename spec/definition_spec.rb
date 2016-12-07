require('rspec')
require('definition')


describe ('Definition') do
  before() do
    Definition.clear()
    @test_definition = Definition.new(:definition => "it is a plant")
    @test_definition.save()
  end

describe(".clear") do
   it("empties the array of saved definitions") do
     Definition.clear()
     expect(Definition.all()).to(eq([]))
   end
 end

  describe('#definition') do
    it('returns the definition of the word') do
      expect(@test_definition.definition()).to(eq('it is a plant'))
    end
  end

  describe(".all") do
    it("returns all saved definitions") do
      expect(Definition.all()).to(eq([@test_definition]))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      test_word = Word.new("it is a plant")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".find") do
    it("returns the definitions id") do
      expect(Definition.find(@test_definition.word_id())).to(eq(@test_definition))
    end
  end


  describe("#word_id") do
    it("returns the id of the definition") do
      expect(@test_definition.word_id()).to(eq(1))
    end
  end
end
