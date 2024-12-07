class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  enum user_type: { admin: 0, merchant: 1, end_user: 2 }

  before_create :set_default_role
  before_create :set_jti

  private

  def set_default_role
    self.user_type ||= :end_user
  end

  def set_jti
    self.jti ||= SecureRandom.uuid
  end
end
