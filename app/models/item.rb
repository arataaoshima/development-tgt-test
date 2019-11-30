class Item < ApplicationRecord

  belongs_to :user
  belongs_to :color

  scope :adult_owner, -> { joins(:user).merge(User.adult)}
  scope :search_by_age, ->{ joins(:user).merge(User.over_age(20))}
  scope :test_age, -> (search){ joins(:user).merge(User.over_age(search))}

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      #Item.where(['name LIKE ?', "%#{search}%"])
      Item.test_age(search)
    else
      Item.all #全て表示。
    end
  end

  #scope :higher_seller, -> { joins(:items).merge(Item.over_price(10000)) }
  #scope :adult_owner, -> { joins(:user).where(users: {"age >?", 19})}
  #scope :test_name, -> { joins(:user).where(users: {"name" : "Arata"}) }
  scope :owner, -> (search){where("user_id = ?",search)}
  #scope :owener_name, -> (name) {where()}
  #scope :desc_posts, -> { joins(:posts).merge(Post.desc) }
end
