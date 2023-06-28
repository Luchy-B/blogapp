require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'index page' do
    user = User.create!(name: 'Blessing', photo: 'https://picsum.photos/200/300', bio: 'I am John Doe', post_counter: 0)
    it 'shows the user name' do
        visit users_path
        expect(page).to have_content('Blessing')        
    end
    it 'shows the user photo' do
          visit users_path
          expect(page).to have_xpath("//img[contains(@src,'https://picsum.photos/200/300')]")        
      end
    it 'shows post count' do
      visit users_path      
      expect(page).to have_content(0)  
    end
    it "redirects to user's show page" do
        user2 = User.create(name: 'Oluchi', photo: 'https://randomuser.me/api/portraits/women/70.jpg',
                            bio: 'Teacher from Poland.', post_counter: 5)
  
        visit root_path
  
        within('.grids') do
          click_link('Oluchi')
        end
  
        expect(page).to have_content('Oluchi')
        expect(current_path).to eq(user_path(user2))
      end
  end
end

