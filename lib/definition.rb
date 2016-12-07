class Definition
  @@meanings = []

  attr_reader(:definition, :word_id)

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @word_id = attributes.fetch(:word_id)
  end

  define_singleton_method(:all) do
    @@meanings
  end
end
