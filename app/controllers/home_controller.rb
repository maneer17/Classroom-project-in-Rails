class HomeController < ApplicationController
  before_action :redirect_signed_in_user, only: :index

  def index
  end

  private

  def redirect_signed_in_user
    if current_teacher
      redirect_to teacher_courses_path
    elsif current_student
      redirect_to student_courses_path
    end
  end
end
