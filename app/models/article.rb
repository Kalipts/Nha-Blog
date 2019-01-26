class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :taggings
    has_many :tags, through: :taggings
    belongs_to :user, optional: true

    def all_tags=(names)
        self.tags = names.split(",").map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
    end

    def all_tags
        self.tags.map(&:name)
    end
end
