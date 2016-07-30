module UsersHelper

  def gravatar_for(email)
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt:"Pofile Image", class: "gravatar")
  end

  def gravatar_img_url(email)
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    #image_tag(gravatar_url, alt:"Pofile Image", class: "gravatar")
  end

  ## these functions test for permissions for the User
  def admin_user
      redirect_back_or root_url unless current_user.admin?
  end
  def admin?
    return true if current_user && current_user.admin?
  end
  def winery_user
      logged_in_user
      redirect_back_or root_url unless current_user.winery_user?
  end
  def winery_user?
    return true if current_user && current_user.winery_user?
  end
  def root_user
      redirect_back_or root_url unless current_user.admin?
  end
  def root?
    return true if current_user && current_user.root?
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end



end
