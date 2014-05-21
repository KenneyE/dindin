# == Schema Information
#
# Table name: recipes
#
#  id                :integer          not null, primary key
#  title             :string(255)      not null
#  body              :text             not null
#  created_at        :datetime
#  updated_at        :datetime
#  author_id         :integer          not null
#  short_description :text             not null
#

class Recipe < ActiveRecord::Base
  validates :title, :short_description, :body, :author, presence: true

  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :ingredient_uses

  has_many :ingredients, through: :ingredient_uses
end
