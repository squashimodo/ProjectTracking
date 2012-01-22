class Project < ActiveRecord::Base
	# Relationer
	has_and_belongs_to_many :users
	has_many :tickets



	# Validering
	validates :name, :presence => true, :length => { :maximum => 30 }
	validates :start_date, :presence => true
	validates :end_date, :presence => true
	validates :description, :length => { :maximum => 255 }
	validate :validate_star_date_before_end_date
	validates_presence_of :users
	validates_associated :users, :on => :create
	
	#custom validering
	def validate_star_date_before_end_date
		if end_date && start_date
			errors.add(:start_date, "must be earlier than the end date") if start_date > end_date
		end
	end

	def percent_done
		self.tickets.where(:done => true).length.to_f / self.tickets.length.to_f
	end

end
