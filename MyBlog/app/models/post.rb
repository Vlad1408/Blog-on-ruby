class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_rich_text :body
  has_many :comments, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings
  validates :title, :summary, :body, :all_tags, presence:true
  belongs_to :category

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags=names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
  
end
