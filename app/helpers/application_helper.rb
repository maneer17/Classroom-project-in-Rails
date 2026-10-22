module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  def classroom_course
    return unless current_teacher || current_student

    in_course = params[:course_id].present? || (controller_name == "courses" && %w[show edit].include?(action_name))
    return unless in_course

    Course.find_by(id: params[:course_id].presence || params[:id])
  end

  def course_section
    case controller_name
    when "posts", "comments" then :board
    when "assignments", "submissions" then :homework
    else :overview
    end
  end
end
