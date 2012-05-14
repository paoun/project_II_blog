require 'spec_helper'
describe PostsController do
  	describe "GET 'index'" do
    	before(:each) do
      		@posts = [stub_model(Post,:title => "1"), stub_model(Post, :title => "2")]
      		Post.stub(:all){ @posts }
		end

    	it "assigns a list of posts" do
      		Post.should_receive(:all).and_return(@posts)
      		get 'index'
      		assigns(:posts).should eq @posts
      		response.should be_success
    	end

    	it "renders the template list" do
      		get 'index'
      		response.should render_template(:index)
    	end
  	end

	describe "GET 'new'" do

		it "should use new" do
			Post.should_receive(:new)
			get 'new'
			response.should be_success
		end

    	it "renders the template new" do
      		get 'new'
      		response.should render_template(:new)
    	end

	end

end

