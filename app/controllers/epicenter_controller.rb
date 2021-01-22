class EpicenterController < ApplicationController
	before_action :authenticate_user!, except: [:feed]

  def feed
  	@chirp = Chirp.new

    if user_signed_in?
	  	@following_chirps = []

	    Chirp.all.each do |chirp|
		      if current_user.following.include?(chirp.user_id) || current_user.id == chirp.user_id
		        @following_chirps.push(chirp)
		      end
	    end
	else
      redirect_to chirps_path
    end    
  end

  def show_user
  	@user = User.find(params[:id])
  end

  def now_following
  # Adding the user.id of the user you want to 
  # follow to your following array.
  # This makes sure it's saved in there as an integer
  current_user.following.push(params[:id].to_i)
  current_user.save

  redirect_to show_user_path(id: params[:id])
  end

  def all_users
  	@users = User.all
  end

  def unfollow
  current_user.following.delete(params[:id].to_i)
  current_user.save

  redirect_to show_user_path(id: params[:id]) 
  end
  
  def tag_chirps
	@tag = Tag.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
    @users = []

    User.all.each do |user|
      if @user.following.include?(user.id)
        @users.push(user)
      end
    end
  end

  def followers
    @user =  User.find(params[:id])
    @users = []

    User.all.each do |user|
      if user.following.include?(@user.id)
        @users.push(user)
      end
    end
  end


end
