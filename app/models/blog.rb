class Blog < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true, length: {maximum: 140, message: "１４０文字以内で入力してください"}
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favorite_useers, through: :favorites, source: :User
end
