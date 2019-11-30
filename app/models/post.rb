class Post < ApplicationRecord

  belongs_to :user

  scope :desc, -> { order("posts.created_at DESC") }
  scope :less_number, ->(number) { where("id < ?", number) }
  scope :equal_number, ->(number) { where("id = ?", number) }
  scope :equal_one, -> { where("id = ?", 1) }
  scope :equal_three, -> { where("id = ?", 3) }
  scope :find_three, -> { where("id = ?", 3) }
  scope :find_title, ->(title) { where("title = ?", title) }
  scope :finder_title, ->(title) { where("title LIKE ?", "%#{title}%") }
  #scope :created_before, ->(time) { where("created_at < ?", time) }

end
