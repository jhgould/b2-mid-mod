class Movie < ApplicationRecord
  belongs_to :studio

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def order_actors_by_age
    actors.order(:age)
  end

end
