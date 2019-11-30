class User < ApplicationRecord

    has_many :posts
    has_many :items
    scope :adult, -> { where("age >= ?", 20) }
    scope :over_age, -> (age){ where("age >= ?", age)}
    scope :equal_one, -> { where("id = ?", 1) }
    scope :check_name, ->(username) { where("name = ?", username)}
    scope :name_about, ->(username) { where("name LIKE ?", "%#{username}%")}

  #  scope :find_from_post, -> { joins(:posts).where("id = ?", 1)}

end
