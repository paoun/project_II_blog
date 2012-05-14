require 'spec_helper'

describe "ListingComments" do

  describe "GET /listing_comments" do

		before(:each) do
			@post = Post.create(:title => "title1", :body => "body1")
			@comment1 = @post.comments.create(:writer => "TFC", :body => "Allez le tef!")
			@comment2 = @post.comments.create(:writer => "ST", :body => "Allez le Stade!")
		end

    it "generates a listing of comments" do
			visit post_path(@post)
			page.should have_content @comment1.writer
			page.should have_content @comment1.body
			page.should have_content @comment2.writer
			page.should have_content @comment2.body
		end

  end

end
