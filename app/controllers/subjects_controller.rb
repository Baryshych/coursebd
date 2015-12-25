class SubjectsController < ApplicationController
    
    def new
    end
    
    def create
        @subject = Subject.new(subject_params)
        @subject.save
        redirect_to "/subjects" and return
    end
    
    def edit
        @subject = Subject.find(params[:id])
        @subject.edit
    end
    
    def destroy
  		@subject = Subject.find(params[:id])
  		@subject.destroy
  		redirect_to "/subjects" and return
    end
    
    def index
         @subject = Subject.all
    end
    
    private
    
    def subject_params
        params.require(:subject).permit(:name, :credit, :number_of_hours, :lecturers_ids => [])
    end
    
end
