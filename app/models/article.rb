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

    def self.find_with_tag(tag)
        sql = "
                select * from articles 
                inner join taggings t on articles.id = t.article_id 
                inner join tags t2 on t.tag_id = t2.id
                where t2.name = '#{tag}'
            "
        self.find_by_sql(sql)
    end

    def self.tag_counts 
        Tag.select("tags.*, count(taggings.tag_id) as count").
        joins(:taggings).group("taggings.tag_id")
    end
    
    def all_tags
        self.tags.map(&:name)
    end
end
