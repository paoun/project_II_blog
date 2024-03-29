require 'spec_helper'

describe "DeletingPosts" do

  describe "delete /posts" do

    before(:each) do
      @post1 = Post.create(:title => "Topic1", :body => "Hello world")
      @post2 = Post.create(:title => "Topic2", :body => "My name is Bond, James Bond!")
    end

		it "should have a link to delete a post" do
			visit posts_path
			page.should have_link('Delete', :href => post_path(@post1))
			page.should have_link('Delete', :href => post_path(@post2))
		end

		it "should delete a post" do
			visit posts_path
			click_link('Delete')
			page.should have_no_content(@post1.title)
			page.should have_content(@post2.title)
		end

		it "should redirect to the listing posts page" do
			visit posts_path
			click_link('Delete')
			current_path.should == posts_path
		end
    
  end

end
