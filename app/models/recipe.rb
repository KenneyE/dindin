# == Schema Information
#
# Table name: recipes
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  body               :text             not null
#  short_description  :text             not null
#  author_id          :integer          not null
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Recipe < ActiveRecord::Base
  validates :title, :short_description, :body, :author, presence: true

  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :ingredient_uses

  has_many :ingredients, through: :ingredient_uses

  has_attached_file :image, styles: { big: '400x400>', thumb: '175x175>'}
  validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/gif image/png)

  def self.find_with_all_ingredients(ids)
    return Recipe.find_by_sql([<<-SQL, { ids: ids, num: ids.length }])
      SELECT
        recipes.*
      FROM
        recipes JOIN ingredient_uses
        ON
          recipes.id = ingredient_uses.recipe_id
        JOIN ingredients
        ON
          ingredients.id = ingredient_uses.ingredient_id
      WHERE
        ingredients.id IN (:ids)
      GROUP BY
        recipes.id
      HAVING
        COUNT(ingredients.id) = :num;
    SQL
  end
end
