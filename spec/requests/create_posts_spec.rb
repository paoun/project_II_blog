require 'spec_helper'

describe "CreatePosts" do

  describe "GET /posts/new" do

    it "should generate a form for post adding" do
			visit posts_path
			page.should have_link('New post' , :href => new_post_path)
		end

		it "should render a form to create new posts" do
			visit posts_path
			click_link('New post')
			page.should have_content('New post')
		end

  end

	describe "POST /posts" do

		it "should create the post and render the listing posts" do
			visit new_post_path
			fill_in('Title', :with => 'My title')
			fill_in('Body', :with => 'Body')
			click_button('Create')
			current_path.should == posts_path
			page.should have_content('My title')
		end

	end

end
