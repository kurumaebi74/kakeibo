class Post < ApplicationRecord
    validates :content, {presence: true}
    validates :value, numericality: { only_integer: true , presence: true}
end
