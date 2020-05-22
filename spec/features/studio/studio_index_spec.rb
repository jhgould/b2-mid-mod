require 'rails_helper'

RSpec.describe "Studio index page", type: :feature do
  before :each do
    @studio1 = Studio.create!(name: "Warners", location: "Hollywood")
    @studio2 = Studio.create!(name: "Disney", location: "LA")
    @cars = @studio1.movies.create!(title: "Cars", creation_year: 2000, genre: "family")
    @LOR = @studio1.movies.create!(title: "Lord if the Rings", creation_year: 2005, genre: "action")
    @FAF = @studio2.movies.create!(title: "Fast and Furious", creation_year: 2020, genre: "action")
  end

  it "Visit studio index page see a list of all movies" do
    visit "/studios"

    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@cars.title)
    expect(page).to have_content(@LOR.title)

    expect(page).to have_content(@studio2.name)
    expect(page).to have_content(@FAF.title)
  end
end
