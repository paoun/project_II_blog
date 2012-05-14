require 'spec_helper'

describe "posts/show.html.erb" do

	before(:each) do
		@post = stub_model(Post, :title => "title 1", :body => "body 1")
		@comment1 = @post.comments.create({:writer => "TFC", :body => "Allez le tef!"})
		@comment2 = @post.comments.create({:writer => "ST", :body => "Qui ne saute pas n'est pas TOULOU-SAIN"})
		assign(:post, @post)
	end
  
	it "displays the title and the body of a post" do
		render
		rendered.should =~ /title 1/
		rendered.should =~ /body 1/
	end

	it "displays the comments linked to the post" do
		render
		rendered.should =~ /TFC/
		rendered.should =~ /Allez le tef!/
		rendered.should =~ /ST/
		rendered.should =~ /Qui ne saute pas n'est pas TOULOU-SAIN/
	end

	it "has a link called 'Delete' for each comment" do
		render
		rendered.should have_link('Delete', :href => comment_path(@post, @comment1))
		rendered.should have_link('Delete', :href => comment_path(@post, @comment2))
	end

	it "has a link called 'Index'" do
		render
		rendered.should have_link('Index', :href => posts_path)
	end

end
