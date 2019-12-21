class Category < ApplicationRecord
    validates :content, {presence: true}
    validates :budget, numericality: { only_integer: true }
end
