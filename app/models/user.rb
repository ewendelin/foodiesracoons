class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  enum kind: [:admin, :manager]
  has_many :restaurants, dependent: :destroy
  has_many :claims, dependent: :destroy
  has_many :reviews

  has_secure_token :access_token

  # validate do |user|
  #   WechatValidator.new(user).validate
  # end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  def name
    "#{email}"
  end

# class WechatValidator
#   def initialize(user)
#     @user = user
#   end


  def validate()
    if @user.openid.nil?
      if @user.email.nil?
        @user.errors[:base] << "Email can't be blank"
        return false
      end
      if @user.password.nil?
        @user.errors[:base] << "Password can't be blank"
        return false
      end
    end
    return true
  end
end

