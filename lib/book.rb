class Book
  attr_reader :title, :author, :publication_date, :publication_year
  attr_accessor :checked_out, :times_checked_out

  def initialize(details)
    @title = details[:title]
    if details[:author_first_name]
      @author = "#{details[:author_first_name]} #{details[:author_last_name]}"
    else
      @author = details[:author_name]
    end
    @publication_year = details[:publication_date].slice(-4,4)
    @checked_out = false
    @times_checked_out = 0
  end
end
