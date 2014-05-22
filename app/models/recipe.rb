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
