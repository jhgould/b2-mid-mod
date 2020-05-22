require 'rails_helper'

RSpec.describe Movie do
  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :creation_year}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end


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
    MovieActor.create!(movie_id: @cars.id, actor_id: @owen.id)
    MovieActor.create!(movie_id: @cars.id, actor_id: @larry.id)
    MovieActor.create!(movie_id: @LOR.id, actor_id: @gimly.id)
    MovieActor.create!(movie_id: @LOR.id, actor_id: @aragorn.id)
    MovieActor.create!(movie_id: @LOR.id, actor_id: @frodo.id)
  end
  it "tests movie actor order" do

    expect(@cars.order_actors_by_age).to eq([@owen, @larry])

  end


end
