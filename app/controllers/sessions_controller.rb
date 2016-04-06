require 'net/http'

class SessionsController < ApplicationController
  
  def new

  end


  def getPosition(current_user)
    
    if current_user['current_office']['id'] == current_user['person']['home_mc']['id']
      return 'MC'
    elsif current_user['current_position']['team']['team_type']==  'eb'
      return 'EB'
    else
      return'OTHER'
    end

  end

  private :getPosition

  #Method that controls the welcome view
  # @param email [String] receives the params from the form on login
  # @param senha [String] receives the params from the form on login
  def create(email = params[:my_email], senha = params[:my_password])
        
        expa = EXPA::Client.new()
        expa.auth(email, senha)
        if expa.get_token==nil
          flash[:warning] = "E-mail ou senha inválida"
          return redirect_to  "/authentication/login"    
        end
        session[:token] = expa.get_token
        #request the expa's current user data
        @request = "https://gis-api.aiesec.org:443/v1/current_person.json?access_token=#{session[:token]}"
        resp = Net::HTTP.get_response(URI.parse(@request))
        data = resp.body
        @current_person = JSON.parse(data)
        #Find the user on system
        if @current_person['person']['home_mc']['id']!= 1606
          flash[:warning] = "BAZICON is only available for members of AIESEC in Brazil"
          return redirect_to  "/authentication/login"    
        end
        @user = User.find_by_email(params[:my_email])

        #create sessions if the user exist, else create a user automaticaly 
        if @user
          reset_session
          session[:user_id] = @user.id
          session[:position] = getPosition(@current_person)
          session[:committee] = @user.xp_committee_id 
          User.cache_photo(session[:user_id])
          redirect_to authentication_welcome_path
          #@user.photo_url = @current_person["person"]["profile_photo_url"]
        else
          
          @user = User.new(:name => @current_person['person']['full_name'], :email => email )
          @user.photo_url = @current_person['person']["profile_photo_url"]
          @user.postion = getPosition(@current_person)
          if @user.postion=="MC"
            @user.xp_committee_id = @current_person['person']['home_mc']['id']
          else 
            @user.xp_committee_id = @current_person['person']['home_lc']['id']
          end
          @user.save
          session[:user_id] = @user.id
          session[:position] = getPosition(@current_person)
          session[:committee] = @user.xp_committee_id 
          User.cache_photo(session[:user_id])
          redirect_to  authentication_welcome_path
        
        end
    

  end

  #Destroy the session
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


end
