class AdminController < ApplicationController
  
  def initialize
    create_roles
  end

  def create_student
  	get_categories
    render :layout => "admin_layout"
  end

  def post_student_data
  	create_user "Student", params
  	redirect_to admin_create_student_path
  end

  def create_faculty
  	get_categories
    render :layout => "admin_layout"
  end

  def post_faculty_data
  	create_user "Faculty", params
  	redirect_to admin_create_faculty_path
  end

  def student_list
  	role = Role.where(role: "Student").first
  	@students = role.users.length > 0 ? role.users : []
  	render :layout => "admin_layout"
  end

  def faculty_list
  	role = Role.where(role: "Faculty").first
  	@faculties = role.users.length > 0 ? role.users : []
	render :layout => "admin_layout"
  end

  private

  	def get_categories
  		video_class = VideoClass.first
    	@categories = !video_class.nil? ? video_class.categories : []
  	end

  	def create_roles
  		Role.create({role: "Admin"}) if Role.where(role: "Admin").length == 0
  		Role.create({role: "Faculty"}) if Role.where(role: "Faculty").length == 0
  		Role.create({role: "Student"}) if Role.where(role: "Student").length == 0
  	end

  	def create_user(role, postdata)
		role_obj = Role.where(role: role).first
	    begin
	      User.transaction do
	      	user_obj = role_obj.users.create!(name: postdata[:name], user_alias: postdata[:email] + postdata[:phone], email: postdata[:email], phone: postdata[:phone], date_of_birth: postdata[:dob], sex: postdata[:sex], address: postdata[:address], city: postdata[:city], country: postdata[:country], specialization: postdata[:specilization])
	      	postdata[:category]["cat_to_assign"].each do |cat_id|
	      		UserCategoryMapping.create!(user_id: user_obj.id, category_id: cat_id.to_i)
	      	end
	      	LoginDetail.create!(user_id: user_obj.id, user_login_id: postdata[:email], password: postdata[:password], role_id: role_obj.id)
	      end
	      flash[:create_user_message] = "User created successfully."
	    rescue => e
	    	raise e.message.inspect
	    	flash[:create_user_message] = "Failed to create user, please try again."
	    end

  	end
end
