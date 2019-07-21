module Api
  class ApplicationController < ActionController::API
    rescue_from ActiveHash::RecordNotFound do
      head :not_found
    end
  end
end
