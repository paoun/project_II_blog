require 'spec_helper'

describe CommentsController do

	before(:each) do
		@post = double(Post)
		Post.stub(:find){@post}
		@comment = double(Comment)
		@post.stub(:comments){@comment}
	end

	describe "POST '/posts/:post_id/comments'" do

		before(:each) do
			@comment.stub(:create)
			@params={:post_id => 1, :comment => {"writer" => "TFC", "body" => "Allez le tef!"}}
		end

		it "should create a new comment" do
			@comment.should_receive(:create).with("writer" => "TFC", "body" => "Allez le tef!")
			post 'create', @params
		end
    
		it "should redirect to the post page" do
			post 'create', @params
			response.should redirect_to(post_path(@post))
		end

  end

	describe "DELETE '/posts/:post_id/comments/:id'" do

		before(:each) do
			@comment.stub(:find){@comment}
			@comment.stub(:destroy)
			@params={:post_id => 1, :id => 1}
		end

		it "should delete a comment" do
			@comment.should_receive(:destroy)
			delete 'destroy', @params
		end

		it "should redirect to the post page" do
			delete 'destroy', @params
			response.should redirect_to(post_path(@post))
		end	



	end

end
