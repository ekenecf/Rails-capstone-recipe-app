require 'rails_helper'

RSpec.feature 'Login Page' do
  feature 'shows login' do
    background do
      visit new_user_session_path
      @user1 = User.create(name: 'example', email: 'example@gmail.com', password: 'example')
      within 'form' do
        fill_in 'Email', with: @user1.email
        fill_in 'Password', with: @user1.password
      end
      click_button 'Log in'
    end

    scenario 'shows my recipe link after user login' do
      expect(page).to have_content('You have to confirm your email address before continuing')
    end
  end
end
