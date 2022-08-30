require "jwt"

class Api::V1::SessionsController < ApplicationController
  def create
    #如果是测试环境 code 就永远为 123456
    if Rails.env.test?
      return render status: :unauthorized if params[:code] != "123456"
    else
      canSignin = ValidationCode.exists? email: params[:email], code: params[:code], used_at: nil
      return render status: :unauthorized unless canSignin
    end
    user = User.find_by_email params[:email]
    if user.nil?
      render status: 404, json: { errors: "用户不存在" }
    else
      payload = { user_id: user.id }
      token = JWT.encode payload, Rails.application.credentials.hmac_secret, "HS256"
      render status: 200, json: { jwt: token }
    end
  end
end

# 查看 email code 且used_at=nil 的记录
