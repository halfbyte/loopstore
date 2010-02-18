# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_loopstore_session',
  :secret      => 'c3146bcaa9802ccc9ab9877f38b7b07f60f77c9060d4cb7c9c87bb21be2c7fc7c712e7a83577dcb7985f94ecdd1825993abd8690446291cf70fa983dadaddbfc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
