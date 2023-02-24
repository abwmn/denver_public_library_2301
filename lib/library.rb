class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @authors = []
    @books = []
  end

  def add_author(author)
    author.books.each do |book|
      @books << book
    end
    @authors << author
  end

  def publication_time_frame_for(author)
    books = @books.find_all{|book| book.author == author}
    book_dates = []
    books.each do |book|
      book_dates << book.publication_year.to_i
    end
    time_frame = {start: book_dates.min.to_s, end: book_dates.max.to_s} 
  end
end
