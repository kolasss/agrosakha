class MyAuthFailure < Devise::FailureApp

  # add different cases here for diff scopes.
  def redirect_url 
    if warden_options[:scope] == :user 
      root_path 
    # elsif warden_options[:scope] == :admin 
    #   admin_root_path 
    end 
  end 

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end  
end