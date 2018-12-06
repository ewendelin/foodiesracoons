class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def wechat_params
    {
      appid: ENV["APP_ID"],
      secret: ENV["APP_SECRET"],
      js_code: params[:code],
      grant_type: "authorization_code"
    }
  end

  def wechat_user
    @wechat_response ||= RestClient.post(URL, wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end

  def login
    # p wechat_user
    # return
    # byebug
    u_params = { openid: wechat_user.fetch("openid")}
    u_params[:email] = u_params[:openid]+ "@wx.com"
    u_params[:password] = '123123'

    @user = User.find_or_create_by(u_params)
    render json: {
      access_token: @user.access_token,
      userId: @user.id
    }
  end
end
