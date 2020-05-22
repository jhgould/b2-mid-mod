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
    MovieActor.create!(movie_id: @cars.id, actor_id: @larry.id)
    MovieActor.create!(movie_id: @cars.id, actor_id: @owen.id)
    MovieActor.create!(movie_id: @LOR.id, actor_id: @gimly.id)
    MovieActor.create!(movie_id: @LOR.id, actor_id: @aragorn.id)
    MovieActor.create!(movie_id: @LOR.id, actor_id: @frodo.id)
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

  it "user can add actors to movies" do
    visit "/movies/#{@cars.id}"

    fill_in "Name", with: "#{@paul.name}"
    click_on "Submit"

    expect(current_path).to eq("/movies/#{@cars.id}")
    expect(page).to have_content(@cars.title)
    expect(page).to have_content(@owen.name)
    expect(page).to have_content(@larry.name)
    expect(page).to have_content(@paul.name)

    visit "/movies/#{@LOR.id}"

    fill_in "Name", with: "#{@paul.name}"
    click_on "Submit"

    expect(current_path).to eq("/movies/#{@LOR.id}")
    expect(page).to have_content(@LOR.title)
    expect(page).to have_content(@aragorn.name)
    expect(page).to have_content(@frodo.name)
    expect(page).to have_content(@gimly.name)
    expect(page).to have_content(@paul.name)
  end

end
