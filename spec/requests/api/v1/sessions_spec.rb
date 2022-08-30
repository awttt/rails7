require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "回话" do
    it "登录（创建会话）" do
      User.create email: 'anwenteng@foxmail.com'
      post '/api/v1/session', params: {email: 'anwenteng@foxmail.com',code:'123456'}
      expect(response).to have_http_status(200)
      json  = JSON.parse response.body
      expect(json['jwt']).to be_a(String)
    end
  end
end