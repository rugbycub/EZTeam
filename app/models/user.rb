class User < ActiveRecord::Base
  has_many :clubs, :through => :teams
  has_many :users_teams
  has_many :teams, through: :users_teams
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_many :users_events
  has_many :events, through: :users_events
  has_and_belongs_to_many :roles
   acts_as_messageable

def mailboxer_email(message)
    if self.email.nil?
        email = self.first_name + " " + self.last_name
    else
        self.email
    end
end
  

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end


  def password_required?
    super && provider.blank?
  end

def make_admin(team)
  self.add_role :team_admin, team
end


end
