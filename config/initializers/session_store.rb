# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_vote_session',
  :secret      => '8970e00a25f48979220e1298b0b77f76fba922ed7fe3c31fa6b33b9d1af118e213303f73eb4ed8f1af0fa904ba1d8433d2d20aa94ef3f767396e3642fece4ec9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
