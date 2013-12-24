require 'spec_helper'

describe UsersController do

  describe 'GET /index' do 
  	let!(:user) { create :user, :admin }
  	before(:each) { get :index }

    it "assigns @users" do expect(assigns(:users)).to be_present end
    it { should respond_with(200) }
    it { should render_template(:index) }  
 	end

 	describe 'GET /show' do
 		let!(:user) { create :user, :driver }
 		before(:each) { get :show, id: user.id }
 		it { should render_template(:show) }

 		it "assigns @user" do 
 			assigns(:user).should be_present
 			assigns(:user).should eq(user)
 		end
 	end

 	describe 'GET /new' do 
 		before(:each) { get :new }
 		it { should render_template(:new) }
 		it "assigns @user as new user" do 			
 			assigns(:user).should be_a_new_record
 		end
 	end

 	describe "POST /create" do
 		let(:user_params) { { address: 'jakarta', division_id: '1', email: 'test@kmkonline.co.id', level_id: '1', name: 'usertest', nik: 'KMK-0001', password: 'secret', status: '1', telp: '0928787', username: 'testuser' } }
 		
 		context "with valid params" do 			
 			before(:each) { post :create, user: user_params }
 		
 			it { should redirect_to user_path(assigns(:user)) }
 		end

 		context "with invalid params" do 			
 			before(:each) { post :create, user: user_params.except(:email) }
 		
 			it { should render_template(:new) }
 		end
 	end

 	describe "GET /edit" do
 		let!(:user) { create :user, :driver }
 		before(:each) { get :edit, id: user.id }
 		it { should render_template(:edit) }
 	end

 	describe "PUT /update" do
 		let!(:user) { create :user, :driver } #create user from factory
 		let(:user_params) { user.attributes.except("id", "updated_at", "created_at") } 		

 		context "edit with valid params" do
 			before(:each) { put :update, id: user.id, user: user_params }
 			it { should redirect_to user_path(assigns(:user)) }
 		end

 		context "edit with invalid params" do
 			before(:each) { put :update, id: user.id, user: user_params.merge("username" => "") } #change value username null
 			it { should render_template(:edit) }
 		end 		
 	end

 	describe "DELETE /destroy" do
 		let!(:user) { create :user, :driver } #create user from factory
 		before(:each) { delete :destroy, id: user.id }

 		it { should redirect_to users_path } #redirect to index
 	end

end
