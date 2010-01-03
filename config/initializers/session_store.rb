# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cottemp_session',
  :secret      => '89918f2a919c6ec5892d2f2949a3e220c58447b50e537b2b5be796a327f51f691331190af38e7441c78c8c26aa7ffd4c002767c6c2c47513b368ea745e15808e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
