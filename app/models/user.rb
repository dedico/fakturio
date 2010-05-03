require 'digest'

class User < ActiveRecord::Base
  has_many :companies
  attr_accessor :password
  attr_accessible :name, :email, :admin, :password, :password_confirmation


  validates_presence_of :name, :email
  validates_length_of :name, :maximum => 50
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of   :email, :with => /.+@.+[.].+/


  # Automatically create the virtual attribute 'password_confirmation'.
  validates_confirmation_of :password

  # Password validations.
  validates_presence_of :password
  validates_length_of   :password, :within => 6..40

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def remember_me!
    self.remember_token = encrypt("#{salt}--#{id}")
    save_without_validation
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  private
  def encrypt_password
    return if password.blank?
    self.salt = make_salt #if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}--")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

  # Return true if the password is required.
  # Password is required if either
  # (a) encrypted_password is blank, as for a new user, or
  # (b) password is blank, as for an existing user updating his information
  # but not resetting his password.
  def password_required?
    encrypted_password.blank? || !password.blank?
  end
end


# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  encrypted_password :string(255)
#  salt               :string(255)
#  remember_token     :string(255)
#  admin              :boolean         default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#

