class AuthController < ApplicationController
  def create
    render json: { group: user_group }
  end

  private

  def user_group
    if (params.require(:user) == 'admin')
      'financial'
    else
      'common'
    end
  end
end
