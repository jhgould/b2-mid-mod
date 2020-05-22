RSpec.describe "Movies show page", type: :feature do
  before :each do
    @studio1 = Studio.create!(name: "Warners", location: "Hollywood")
    @studio2 = Studio.create!(name: "Disney", location: "LA")
    @cars = @studio1.movies.create!(title: "Cars", creation_year: 2000, genre: "family")
    @LOR = @studio1.movies.create!(title: "Lord if the Rings", creation_year: 2005, genre: "action")
    @FAF = @studio2.movies.create!(title: "Fast and Furious", creation_year: 2020, genre: "action")
    @gimly = Actor.create!(name: "Gimly", age: 150)
    @frodo = Actor.create!(name: "Frodo", age: 50)
    @aragorn = Actor.create!(name: "Aragorn", age: 30)
    @owen = Actor.create!(name: "Ownen Wilson", age: 50)
    @larry = Actor.create!(name: "Larry", age: 55)
    @paul = Actor.create!(name: "Paul Walker", age: 30)
    
  end

  it "Visit movies show page and see all info including actors" do
    visit "/movies/#{@cars.id}"

    expect(page).to have_content(@cars.title)
    expect(page).to have_content(@owen.name)
    expect(page).to have_content(@larry.name)

    visit "/movies/#{@LOR.id}"

    expect(page).to have_content(@LOR.title)
    expect(page).to have_content(@aragorn.name)
    expect(page).to have_content(@frodo.name)
    expect(page).to have_content(@gimly.name)
  end
end



# Story 2
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
