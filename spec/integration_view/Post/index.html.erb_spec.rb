require 'rails_helper'

RSpec.describe 'Post Index Page', type: :feature do
  describe 'Viewing Post Index page' do
    before(:each) do
      @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.',
                           post_counter: 0)
      @first_post = Post.create(author: @user1, title: 'post1', text: 'This is my first post', likes_counter: 0,
                                comments_counter: 0)
      @comment1 = Comment.create(post: @first_post, author: @user1, text: 'Hi Tom!, Nice comment')

      visit "/users/#{@user1.id}/posts"
    end

    it 'should show user name' do
      expect(page).to have_content(@user1.name)
    end

    it 'should show user photo' do
      expect(page.html).to include(@user1.photo)
    end

    it 'should show post_counter of clicked user' do
      expect(page.html).to have_content(@user1.post_counter)
    end

    it 'should show all posts ' do
      expect(page).to have_current_path("/users/#{@user1.id}/posts")
    end

    it 'should show post text ' do
      expect(page).to have_content(@first_post.text)
    end

    it 'should show comment text ' do
      expect(page).to have_content(@first_post.text)
    end

    it 'should show comments counter' do
      expect(page).to have_content(@first_post.comments_counter)
    end

    it 'should show pagination' do
      expect(page).to have_content('Pagination')
    end

    it 'should show likes counter' do
      expect(page).to have_content(@first_post.likes_counter)
    end

    it "When I click on a user, I am redirected to that user's show page." do
      user2 = User.create(name: 'Lilly', post_counter: 2, photo: 'https://randomuser.me/api/portraits/women/70.jpg',
                          bio: 'Teacher from Poland.')
      visit root_path(user2)
      click_on 'Lilly'
      expect(page).to have_current_path("/users/#{user2.id}")
    end
  end
end
