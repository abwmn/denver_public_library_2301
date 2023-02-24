require './lib/book'
require './lib/author'

RSpec.describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  it 'exists' do
    expect(@charlotte_bronte).to be_a(Author)
  end

  it 'has a name' do
    expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
  end

  it 'can write and store books' do
    expect(@charlotte_bronte.books).to eq([])
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    expect(jane_eyre).to be_a(Book)
    expect(jane_eyre.title).to eq("Jane Eyre")
    expect(jane_eyre.publication_year).to eq("1847")
    expect(@charlotte_bronte.books).to eq([jane_eyre])
    villette = @charlotte_bronte.write("Villette", "1853")
    expect(villette.publication_year).to eq("1853")
    expect(@charlotte_bronte.books).to eq([jane_eyre, villette])
  end
end