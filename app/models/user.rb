class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :birthday, presence: true

  validates :password, format: {with:/[a-z\d]{6,}/i, message:'半角英数を含む６文字以上を入力してください'}

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end
  

  with_options presence: true, format: { with: /\A[ァ-ヴ一]+\z/u, message: '全角カタカナを使用してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end

end
