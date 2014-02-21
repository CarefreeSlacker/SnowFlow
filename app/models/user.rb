class User < ActiveRecord::Base

  #accessors
  #attr_accessible :name, :login, :email, :password #, :password_confirmation
  #propereties
  has_many :carts
  has_many :positions, through: :carts
  has_many :orders

  #Constants should be in the beginning, because of order of processing of the *.rb files
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #encrypting the password
  #has_secure_password validations: false


  #validations
  validates :name, presence: true
  validates :login, presence: true, uniqueness: { case_sentensive: false}
  validates :password, length: {minimum: 6 } , presence: true # have to comment because i couldn't log in because of that
  #validates :password_confirmation , presence: true# have to comment because i couldn't log in because of that
  validates :email, presence: true, format: {with: User::EmailRegex},
            uniqueness: { case_sentensive: false}
  validates :role, presence: true



  #callbacks
  #before_save {self.email = email.downcase}
  #before_create {self.email = email.downcase}


  def self.new_token
    SecureRandom::urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def admin?
    self.role == 'admin'
  end



  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_token)
    end

end
