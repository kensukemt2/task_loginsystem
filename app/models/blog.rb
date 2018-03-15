class Blog < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true, length: {maximum: 140, message: "１４０文字以内で入力してください"}
end
