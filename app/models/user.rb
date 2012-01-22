class User < ActiveRecord::Base

	# Querys

	# Relationer
	has_and_belongs_to_many :projects
	has_one :role
	belongs_to :ticket

	# intern egenskap (hör inte till databasen)
	attr_accessor :pw
	attr_accessor :pw_confirmation

	
	# Validering
	validates :username,		:presence => true,
													:length => { :maximum => 25, :minimum => 4 },
													:uniqueness => true,
													:format => { :with => /^\w+$/ }

	validates :first_name,	:presence => true,
													:length => { :maximum => 25 }
													
	validates :last_name,		:presence => true,
													:length => { :maximum => 25 }
													
	
	validates_length_of :pw, :within => 8..255, :on => :create
	validates_confirmation_of :pw

	validates_presence_of :email
	validates_format_of :email, :with => /^(?!(?:(?:\x22?\x5C[\x00-\x7E]\x22?)|(?:\x22?[^\x5C\x22]\x22?)){255,})(?!(?:(?:\x22?\x5C[\x00-\x7E]\x22?)|(?:\x22?[^\x5C\x22]\x22?)){65,}@)(?:(?:[\x21\x23-\x27\x2A\x2B\x2D\x2F-\x39\x3D\x3F\x5E-\x7E]+)|(?:\x22(?:[\x01-\x08\x0B\x0C\x0E-\x1F\x21\x23-\x5B\x5D-\x7F]|(?:\x5C[\x00-\x7F]))*\x22))(?:\.(?:(?:[\x21\x23-\x27\x2A\x2B\x2D\x2F-\x39\x3D\x3F\x5E-\x7E]+)|(?:\x22(?:[\x01-\x08\x0B\x0C\x0E-\x1F\x21\x23-\x5B\x5D-\x7F]|(?:\x5C[\x00-\x7F]))*\x22)))*@(?:(?:(?!.*[^.]{64,})(?:(?:(?:xn--)?[a-z0-9]+(?:-[a-z0-9]+)*\.){1,126}){1,}(?:(?:[a-z][a-z0-9]*)|(?:(?:xn--)[a-z0-9]+))(?:-[a-z0-9]+)*)|(?:\[(?:(?:IPv6:(?:(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){7})|(?:(?!(?:.*[a-f0-9][:\]]){7,})(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){0,5})?::(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){0,5})?)))|(?:(?:IPv6:(?:(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){5}:)|(?:(?!(?:.*[a-f0-9]:){5,})(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){0,3})?::(?:[a-f0-9]{1,4}(?::[a-f0-9]{1,4}){0,3}:)?)))?(?:(?:25[0-5])|(?:2[0-4][0-9])|(?:1[0-9]{2})|(?:[1-9]?[0-9]))(?:\.(?:(?:25[0-5])|(?:2[0-4][0-9])|(?:1[0-9]{2})|(?:[1-9]?[0-9]))){3}))\]))$/i

	# Callbacks
	before_save :create_hashed_password
	after_save :clear_password

	# Skyddade variabler. Kan inte sättas av mass assignment/"params"/formulär
	attr_protected :password, :salt

	# Klassmetoder
	def self.authenticate(username="", password="")
		u = User.find_by_username(username)
		if u && u.password_match?(password)
			return u
		else
			return false	
		end
	end

	def password_match?(pw = "")
		password == User.hash_with_salt(pw, salt)
	end

	def self.make_salt(username = "")
		Digest::SHA1.hexdigest("Anvander #{username} med #{Time.now} for att salta")
	end

	def self.hash_with_salt(password="", salt = "")
		puts "kor hash_with_salt med #{password} och #{salt}"
		u = Digest::SHA1.hexdigest("Satter #{salt} pa anvandarens #{password}")
		puts u
		return u
	end

	#privata metoder
	private
	def create_hashed_password
		unless pw.blank?
			self.salt = User.make_salt(username) if self.salt.blank?
			self.password = User.hash_with_salt(pw, salt)
		end
	end

	def clear_password
		self.password = nil
	end
end
