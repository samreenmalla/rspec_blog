class Post < ApplicationRecord

	validates :content, presence: true, length: { minimum: 50 }
	validates :name, presence: true
	validates :title, presence: true

end
