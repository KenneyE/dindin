class StaticPagesController < ApplicationController
  before_action :ensure_signed_in, only: :home

  def home
    @background = true 
  end

  def about
  end
end
