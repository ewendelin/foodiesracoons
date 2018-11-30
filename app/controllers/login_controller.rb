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
    @user = User.find_or_create_by(openid: wechat_user.fetch("openid"))
    @user.email = "wechat@wechat.com"
    @user.password = "wechattttt"
    @user.save!

    @user.regenerate_access_token
    render json: {
      access_token: @user.access_token,
      userId: @user.id
    }
  end
end
