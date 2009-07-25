# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Traceable_session',
  :secret      => '689a842eeaa06758e697697650126b4e98eef97a95efbe69267c08c94c23a5f9a87d73454273d49ca43ea4fbdb6acec7aef638f2f1256c1db15fecfaf20e06a7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
