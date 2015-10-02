class MainbaseController < ApplicationController
	def view
		@students = Student.all
	end
end
