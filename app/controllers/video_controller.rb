class VideoController < ApplicationController
  def initialize
    @opentok = OpenTok::OpenTok.new ENV["API_KEY"], ENV["API_SECRET"]
    create_class
  end

  def create_class
    VideoClass.create({ class_name: 'Singing' }) if !VideoClass.first
  end

  def get_categories_list
    video_class = VideoClass.first
    @categories = !video_class.nil? ? video_class.categories : []
    render :layout => "admin_layout"
  end

  def create_category
    begin
      session = @opentok.create_session :media_mode => :routed
      session_url = "video_call/#{session.session_id}"
      video_class = VideoClass.first
      video_class.categories.create({cat_name: params[:category_name], session_id: session.session_id, session_url: session_url})
      flash[:message] = "Created category successfully."
    rescue
      flash[:message] = "Failed to create category please try again."
    end
    redirect_to video_get_categories_list_url
  end

  def update_categories
    begin
        params["cat_data_to_change_status"].each do |key, value|
          Category.find(value["cat_id"]).update_attributes(active: value["active"])
        end
        Category.transaction do
          params["cat_to_remove"].each do |key, value|
            UserCategoryMapping.where(category_id: value["cat_id"].to_i).destroy_all
            Category.find(value["cat_id"]).destroy
          end
        end
      render :json => { message: "Updated categories successfully." }, :status => 200
    rescue Exception => e
      raise e.message.inspect
      render :json => { message: "Failed to update categories, please try again." }, :status => 500
    end
  end

  def generate_token
    token = @opentok.generate_token(
      params[:ost_session_id], {
        :role        => params[:role].to_sym,
        :expire_time => Time.now.to_i + (7 * 24 * 60 * 60),
        :data        => params[:data]
      }
    );
    tokenData = {token_id: token}
    render :json => tokenData
  end

  def video_call
    #render nothing: true
    render :layout => "application"
  end

  def login
    render :layout => "login_layout"
  end

  def record_session
    archive = @opentok.archives.create params[:ost_session_id]
    render :json => archive
  end

  def join_class
    render :layout => "application"
  end

end
