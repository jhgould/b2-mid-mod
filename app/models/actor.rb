class Actor < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true


  has_many :movie_actors
  has_many :movies, through: :movie_actors
end
