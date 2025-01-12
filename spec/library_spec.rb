require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  before(:each) do
    @library = Library.new("Aurora Springs")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @villette = @charlotte_bronte.write("Villette", "1853")
  end
  it 'exists' do
    expect(@library).to be_a(Library)
  end

  it 'has a name' do
    expect(@library.name).to eq("Aurora Springs")
  end

  it 'can add authors' do
    expect(@library.authors).to eq([])
    @library.add_author(@charlotte_bronte)
    expect(@library.authors).to eq([@charlotte_bronte])
  end

  it 'can add books' do
    expect(@library.authors).to eq([])
    expect(@library.books).to eq([])
    @library.add_author(@charlotte_bronte)
    expect(@library.books).to eq([@jane_eyre, @villette])
  end

  it 'can show publication time frame of author' do
    @library.add_author(@charlotte_bronte)
    expect(@library.publication_time_frame_for("Charlotte Bronte")).to eq({start: "1847", end: "1853"})
  end

  it 'can check out/return books and count times checked out' do
    @library.add_author(@charlotte_bronte)
    expect(@library.checked_out).to eq([])
    @library.check_out(@jane_eyre)
    expect(@library.checked_out).to eq([@jane_eyre])
    @library.return(@jane_eyre)
    expect(@library.checked_out).to eq([])
    @library.check_out(@jane_eyre)
    @library.check_out(@villette)
    expect(@library.checked_out).to eq([@jane_eyre, @villette])
    expect(@library.most_checked_out).to eq(@jane_eyre)
  end
end