class Blog < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true, length: {maximum: 140, message: "１４０文字以内で入力してください"}
    belongs_to :user#, optional: true
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    mount_uploader :image, ImageUploader
end
