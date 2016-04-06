require 'test_helper'
require 'csv'

class UserRoleTest < ActionDispatch::IntegrationTest
 
	
	def setup
    	@users = CSV.read('test/integration/users.csv')
  	end


	test "EB login" do
    
    get "/authentication/login"
    assert_response :success
    post '/sessions/create', :my_email =>@users[0][0],:my_password => @users[0][1]
    #test if user after login w>as redirected to the welcome path
    assert_redirected_to  authentication_welcome_path
    assert_equal "EB", session[:position]
    
     #test if session was created 
    
   	end

   	test "MC login" do
    
    get "/authentication/login"
    assert_response :success
    post '/sessions/create', :my_email =>@users[1][0],:my_password => @users[1][1]
    #test if user after login w>as redirected to the welcome path
    assert_redirected_to  authentication_welcome_path
    assert_equal "MC", session[:position]
    
     #test if session was created 
    
   	end

   	#test "EB adding private file" do
    
    #get "/authentication/login"
    #assert_response :success
    #post '/sessions/create', :my_email =>@users[1][0],:my_password => @users[1][1]
    #test if user after login w>as redirected to the welcome path
   # assert_redirected_to  authentication_welcome_path
    #file = File.open("test/integration/test_file.csv")
    #post "/authentication/upload", :file =>file , :show=>false
    #get "/authentication/files"
    #@archives
     #test if session was created 
    
   	#end



end
