class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_secure_password
  has_many :photos, :order => 'photos.created_at DESC'
  has_many :albums, :order => 'albums.created_at DESC'
  before_save :encrypt_password
  before_create { generate_token(:auth_token) }
  before_create :downcase_username

  EMAIL_REGEXP = /^.+@.+\..+$/
  USERNAME_REGEXP = /^[a-zA-Z0-9_-]{3,16}$/

  validates_presence_of :username
  validates :username, :format =>  { :with => USERNAME_REGEXP }
  validates :username, :length => { :minimum => 3, :maximum => 16}
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :password, :length => { :minimum => 6 }
  validates_presence_of :email
  validates_uniqueness_of :username, :email
  validates :email, :format => { :with => EMAIL_REGEXP }

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_digest = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)

    if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def downcase_username
    self.username = self.username.downcase if self.username.present?
  end
end