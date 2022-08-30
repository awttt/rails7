class Api::V1::MesController < ApplicationController
  def show
    header = request.headers['Authorization']
    p header
    jwt = header.split(' ')[1]
    payload = JWT.decode jwt, Rails.application.credentials.hmac_secret,true,{algorithm:'HS256'}
    user_id = payload[0]['user_id']
    user = User.find user_id
    return head 404 if user.nil?
    render json: { resource: user }
  end
end
