# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fakturio_session',
  :secret      => '364f8bed113d6ac8334c60eb76e7603dae10230b8dc1b153dccf8a8060828f836f683058a54af62b8b99a9fed7cacb66c84eceb271451f3e943ff7a99a11a75b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
