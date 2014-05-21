module Api
  class ApiController < ApplicationController
    before_action :ensure_signed_in
  end
end
