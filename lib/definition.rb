class Definition
  attr_reader(:definition_1)
  @@meanings = []

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @word_id = @@meanings.length().+(1)
  end

  define_method(:definition) do
    @definition
  end

  define_method(:save) do
    @@meanings.push(self)
  end

  define_singleton_method(:all) do
    @@meanings
  end

  define_singleton_method(:clear) do
    @@meanings = []
  end

  define_method(:word_id) do
    @word_id
  end

  define_singleton_method(:find) do |id|
    found_definition = nil
    @@meanings.each do |answer|
      if answer.word_id() == id
        found_definition = answer
      end
    end
    found_definition
  end
end
