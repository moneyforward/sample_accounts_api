module Api
  class AccountsController < ::Api::ApplicationController
    before_action :set_user, only: [:index]
    before_action :set_account, only: [:show]

    def index
      @accounts = Account.where(user_id: @user.id)
      render json: @accounts
    end

    def show
      render json: @account
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_account
      @account = Account.find(params[:id])
    end
  end
end
