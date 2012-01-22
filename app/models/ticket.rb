class Ticket < ActiveRecord::Base
	# Relations
	belongs_to :status
	belongs_to :project
	has_one :user

	# Validation
	validates :name, :presence => true, :length => { :maximum => 30 }
	validates :start_date, :presence => true
	validates :end_date, :presence => true
	validates :description, :length => { :maximum => 255 }
	validate :validate_star_date_before_end_date
	# ?? validates_presence_of :users
	# ?? validates_associated :users, :on => :create

	# Custom date-validation method
	def validate_star_date_before_end_date
		if end_date && start_date
			errors.add(:start_date, "must be earlier than the end date") if start_date > end_date
		end
	end


end
