class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validate :check_category
    validate :check_title

    def check_category
        if category!='Fiction' and category!='Non-Fiction'
            errors.add(:category, 'is not included in the list')
        end
    end

    def check_title
        if title =='True Facts'
            errors.add(:title, 'title is clickbait')
        end
    end


end
