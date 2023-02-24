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

  def check_out(book)
    book.checked_out = true
    book.times_checked_out += 1
  end

  def return(book)
    book.checked_out = false
  end

  def checked_out
    @books.find_all{|book| book.checked_out}
  end

  def most_checked_out
    most_checkouts = 0
    @books.each do |book|
      most_checkouts = [most_checkouts, book.times_checked_out].max
    end
    @books.find{|book| book.times_checked_out == most_checkouts}
  end
end
