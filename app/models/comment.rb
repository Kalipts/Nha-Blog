class Comment < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :articles, optional: true
    
end
