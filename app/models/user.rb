class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable,
         :validatable, :omniauthable, omniauth_providers: %i[aronnax]

  # associations
  has_one :profile
  has_many :task_sets, dependent: :destroy
  has_many :assigned_task_sets, class_name: 'TaskSet', foreign_key: :assignee_id, dependent: :nullify
  has_many :tasks, dependent: :destroy
  has_many :assigned_tasks, class_name: 'Task', foreign_key: :assignee_id, dependent: :nullify

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def update_aronnax_credentials(auth)
    update(
      aronnax_access_token: auth.credentials.token,
      aronnax_refresh_token: auth.credentials.refresh_token
    )
  end

  def nickname
    email.split('@').first
  end
end
