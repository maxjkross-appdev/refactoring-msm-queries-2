# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  actor_id   :integer
#  movie_id   :integer
#
class Character < ApplicationRecord
  def movie
    key = self.movie_id

    matching_set = Movie.where({ :id => key })

    the_one = matching_set.at(0)

    return the_one
  end

  belongs_to(:actor, {
    :class_name => "Character",
    :foreign_key => "actor_id"
  })

  belongs_to(:movie, {
    :class_name => "Movie",  #was "movie" before
    :foreign_key => "movie_id"  #was movie_id before
  })


end
