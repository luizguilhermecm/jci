Clearance.configure do |config|
	config.cookie_expiration = lambda { 1.year.from_now.utc }
  	config.mailer_sender = 'canaldevoluntariosjci@gmail.com'
  	config.password_strategy = Clearance::PasswordStrategies::BCrypt
  	config.user_model = User
end
