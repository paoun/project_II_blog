require 'spec_helper'

describe "posts/index.html.erb" do


	describe "User not connected" do

		before(:each) do
			assign(:posts, [
				stub_model(Post, :id => "1", :title => "sujet 1"),
				stub_model(Post, :id => "2", :title => "sujet 2")
			])
	
		end

		it "has a link called 'New post'" do
			render
			rendered.should have_link('New post', :href => new_post_path)
		end

		it "has a link called 'Delete' for each post" do
			render
			rendered.should have_link('Delete', :href => post_path(1))
			rendered.should have_link('Delete', :href => post_path(2))
		end

	end
end
