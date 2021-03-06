class Doctor
	attr_reader :name

	@@all = []

	def initialize(name)
	 	@name = name
	 	@@all << self
	end 

	def new_appointment(patient, date)
		Appointment.new(date, patient, self)
	end

	def appointments
		Appointment.all.select do |app|
			app.doctor == self
		end
	end

	def patients
		Appointment.all.map do |app|
			app.doctor == self ? app.patient : nil
		end
	end

	def self.all
		@@all
	end
end