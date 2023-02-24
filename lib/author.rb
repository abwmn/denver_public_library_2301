class Author
  attr_reader :name, :books
  def initialize(name)
    @name = "#{name[:first_name]} #{name[:last_name]}"
    @books = []
  end

  def write(title, date)
    @books << book = Book.new({title: title, publication_date: date, author_name: @name})
    book
  end
end
