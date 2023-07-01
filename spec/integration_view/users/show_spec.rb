require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'show page' do
    user = User.create(name: 'Blessing', photo: 'https://picsum.photos/200/300', bio: 'Teacher from Mexico',
                       post_counter: 0)

    @first_post = Post.create(author: user, title: 'post1', text: 'This is my first post', likes_counter: 0,
                              comments_counter: 0)
    @second_post = Post.create(author: user, title: 'post2', text: 'This is my second post', likes_counter: 0,
                               comments_counter: 0)
    @third_post = Post.create(author: user, title: 'post3', text: 'This is my third post', likes_counter: 0,
                              comments_counter: 0)
    @fourth_post = Post.create(author: user, title: 'post4', text: 'This is my fourth post', likes_counter: 0,
                               comments_counter: 0)

    it 'shows the user' do
      visit user_path(user.id)
      expect(page).to have_content(user.name)
    end
    it 'shows the image' do
      visit user_path(user.id)
      expect(page).to have_xpath("//img[contains(@src,'https://picsum.photos/200/300')]")
    end

    it 'shows the post count' do
      visit user_path(user)
      expect(page).to have_content(user.post_counter)
    end

    it 'shows the bio' do
      visit user_path(user)
      expect(page).to have_content(user.bio)
    end

    it 'should show last three posts only' do
      visit user_path(user.id)
      page.has_content?(user.posts)
    end

    it "Button to view all of user's posts." do
      visit user_path(user.id)
      page.has_button?('See all posts')
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      visit user_path(user.id)
      click_on 'See all posts'
      expect(page).to have_current_path("/users/#{user.id}/posts")
    end
  end
end
