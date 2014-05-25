# == Schema Information
#
# Table name: recipes
#
#  id                    :integer          not null, primary key
#  title                 :string(255)      not null
#  atrribution           :string(255)
#  ingredients           :string(255)      not null
#  large_image_url       :string(255)
#  small_image_url       :string(255)      not null
#  source_recipe_url     :string(255)
#  source_site_url       :string(255)
#  source_display_name   :string(255)      not null
#  yummly_id             :string(255)      not null
#  total_time            :string(255)
#  total_time_in_seconds :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#

class Recipe < ActiveRecord::Base
end
