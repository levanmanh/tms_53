class Admin::SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "create_subject_success"
      redirect_to admin_subjects_path
    else
      flash[:danger] = t "error_subject"
      render :new
    end
  end

  private
  def subject_params
    params.require(:subject).permit :title, :description
  end
end
