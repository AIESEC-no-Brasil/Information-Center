require 'test_helper'
require 'csv'

class LoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @users = CSV.read('test/integration/users.csv')
  end

  test "unsucessful login" do
    get "/authentication/login"
    assert_response :success
    post '/sessions/create',  :my_email => 'fulano@aiesec.net', :my_password => '12345'
    assert_equal "E-mail ou senha inválida", flash[:warning]
      #test if user after login was redirected to login page after 
    assert_redirected_to  authentication_login_path
    #test if session was not created 
    assert_equal nil, session[:user_id]
  end

  test "sucessful login" do
    
    get "/authentication/login"
    assert_response :success
    post '/sessions/create', :my_email =>@users[0][0],:my_password =>@users[0][1]
    assert_equal nil, flash[:warning]
     #test if user after login was redirected to the welcome path
    assert_redirected_to  authentication_welcome_path
     #test if session was created 
    assert_not_equal nil, session[:user_id]
    
  
  end

  test "logout" do 
    
    get "/authentication/login"
    post '/sessions/create', :my_email =>@users[0][0],:my_password =>@users[0][1]    
    get '/logout/'
    assert_equal nil, session[:user_id]
  
  end
  

    

end
