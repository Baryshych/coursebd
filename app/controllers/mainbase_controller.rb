class MainbaseController < ApplicationController
	def view
		 @students = Student.search(params[:search]).order(:surname, :name)
		if current_user == nil
			redirect_to "/"
		else
			if current_user.email == 'madowley@gmail.com'
				current_user.permissions = 'admin'
				current_user.save
			end
			if current_user.email == 'caterisas@mail.ru'
				current_user.permissions = 'admin'
				current_user.save
			end 
		end
	end
	def options
	end
end
