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

	describe "POST '/posts'" do

		before(:each) do
			@post = double(Post)
			Post.stub(:create){@post}
			@params={:post=>{:title=>"title",:body=>"body"}}
    	end

		it "should create a new post" do
			Post.should_receive(:create).with("title"=>"title", "body"=>"body")
			post 'create', @params
		end
    
		it "should redirect to the listing posts page" do
			post 'create', @params
			response.should redirect_to(posts_path)
		end

  	end

	describe "DELETE '/posts/:id'" do

		before(:each) do
			@post = double(Post)
			Post.stub(:find){@post}
			@post.stub(:destroy)
			@params={:id=>"1"}
		end

		it "should delete the post" do
			@post.should_receive(:destroy)
			delete 'destroy', @params
		end

		it "should redirect the user to the listing posts page" do
			delete 'destroy', @params
			response.should redirect_to(posts_path)
		end		

	end
end
