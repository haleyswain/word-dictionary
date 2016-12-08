class Definition
attr_reader :definition, :word_id

  @@meanings = []

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @word_id = @@meanings.length().+(1)
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
