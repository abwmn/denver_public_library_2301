class Book
  attr_reader :title, :author, :publication_year

  def initialize(details)
    @title = details[:title]
    @author = "#{details[:author_first_name]} #{details[:author_last_name]}"
    # @publication_date = details[:publication_date]
    @publication_year = details[:publication_date].slice(-4,4)
  end
end
