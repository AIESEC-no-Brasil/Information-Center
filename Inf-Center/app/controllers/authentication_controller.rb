require 'rubygems'
require 'mechanize'
require 'dropbox_sdk'

# Class that control the Authenticatiom system and its views
class AuthenticationController < ApplicationController

  APP_KEY = '1g9mnjegs1l7j3m'
  APP_SECRET = 'glhnoqva181wmpa'

  def login

  end

#Method that controls the welcome view
# @param email [String] receives the params from the form on login
# @param senha [String] receives the params from the form on login
  def welcome(email = params[:my_email], senha = params[:my_password])
    @email = email #Just for test
    url = 'https://auth.aiesec.org/users/sign_in' #Store the url for authenticate at EXPA
    agent = Mechanize.new #Initialize an instance to start to work with mechanize
    page = agent.get(url)
    aiesec_form = page.form() #Selects the form on the page by its name. However this form doens't have a name
    aiesec_form.field_with(:name => 'user[email]').value = email #Set the email field with the args of this function
    aiesec_form.field_with(:name => 'user[password]').value = senha #Set the password field with the seccond arg of this function
    page = agent.submit(aiesec_form, aiesec_form.buttons.first) #submit the form

    if page.code.to_s == '200' #Verify if the page's code is 200, which means its all right
      cj = agent.cookie_jar  #Store the cookie at cj variable
      if cj.jar['experience.aiesec.org'] == nil  #Verify if inside the cookie exist an experience.aiesec.org
        redirect_to(:action => "error") #If its nil redirect to the error page
      else
        @token = cj.jar['experience.aiesec.org']['/']["aiesec_token"].value # Stores the cookie into an instance variable @token if the value of the cookie is not nil.
      end
    end




  end

  def error

  end


# Method that creates arrays of files and directories to list on the view files
  def files
    #Initialize a client for dropbox.
    #@param access_token given by dropbox
    @client = DropboxClient.new("siZpe-o98xoAAAAAAAAAl9HJEsrdDz0EPFebqJHr-oZryn0TL2aNhcGVSQvEjm71")
    #Store the metadata with the content of root in the variable @root_metadata
    @root_metadata = @client.metadata('/')['contents']

    #Creates the variables to store the arrays
    @files = Array.new
    @directories = Array.new

    #iterates the contents of roots to store them in the variables above
    #if the content is  not a folder stores it on @files, else in the @directories
    @root_metadata.each do |hash|
      if hash["is_dir"] == false then
        @files << hash["path"]
      else
        @directories << hash["path"]
      end
    end
  end

  #This is the action wich do the properly navigation into the dropbox, very similar to the other above
  #@param content is received by the form of the view. Contain the name of the directory to get in.
  def navigate(content = params[:parent_id])

    #Initialize a client for dropbox.
    #@param access_token given by dropbox
    @client = DropboxClient.new("siZpe-o98xoAAAAAAAAAl9HJEsrdDz0EPFebqJHr-oZryn0TL2aNhcGVSQvEjm71")
    #defines the directory
    @root = content

    #store the hash of contents on the directory
    @metadata = @client.metadata("#{@root}")['contents']

    #Creates the variables to store the arrays
    @files = Array.new
    @directories = Array.new

    #iterates the contents of roots to store them in the variables above
    #if the content is  not a folder stores it on @files, else in the @directories
    @metadata.each do |hash|
      if hash["is_dir"] == false then
        @files << hash["path"]
      else
        @directories << hash["path"]
      end

    end

  end

end
