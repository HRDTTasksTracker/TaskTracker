require 'rails_helper'

RSpec.describe User, type: :model do

  # For faster tests just comment out the sleep functions - sleeps just for easier to demo
  # tests meant to be ran when database is reset and remigrated. Tests begining and after procedures
  # if test without reset database, some eariler tests for new user will fail.

  context 'Connection tests' do
    it 'ensures website loads without error' do
      # checks if website loads without error, if error usually a database connection issue with rails
      visit("http://localhost:3000/")
      sleep(2)
      expect(page).to have_content('Welcome')
    end
  end

  # check valid and non valid input for users
  context 'New User' do
    it 'Checks if New User page loads and accepts valid input' do
      visit("http://localhost:3000/")
      click_button('Sign Up')
      visit("http://localhost:3000/users/new?")
      expect(page).to have_content('Create Account')
      sleep(2)
      
      # fill in fields with valid input
      fill_in 'user_full_name', :with => 'John Doe'
      fill_in 'user_email', :with => 'JohnDoe@gmail.com'
      fill_in 'user_discord_username', :with => 'JohnDoeDiscord'
      fill_in 'user_phone', :with => '1234567890'
      fill_in 'user_username', :with => 'JohnDoeUsername'
      fill_in 'user_password', :with => 'JohnDoePassword'
      sleep(2)

      click_button('Create Account')
      sleep(2)
      expect(page).to have_content('Tasks')
    end
  end

  # check valid and non valid input for users
  context 'New User 2nd time - should give whitelist error' do
    it 'Checks if New User page loads and accepts valid input' do
      visit("http://localhost:3000/")
      click_button('Sign Up')
      visit("http://localhost:3000/users/new?")
      expect(page).to have_content('Create Account')
      sleep(2)
      
      # fill in fields with valid input
      fill_in 'user_full_name', :with => 'John Doe'
      fill_in 'user_email', :with => 'JohnDoe@gmail.com'
      fill_in 'user_discord_username', :with => 'JohnDoeDiscord'
      fill_in 'user_phone', :with => '1234567890'
      fill_in 'user_username', :with => 'JohnDoeUsername'
      fill_in 'user_password', :with => 'JohnDoePassword'
      sleep(2)

      click_button('Create Account')
      sleep(2)
      expect(page).to have_content('Error: Email is not on whitelist.')
    end
  end

  context 'Login User Tests' do
    it 'ensures firstname pressence' do
    end
  end

  context 'validation tests' do
    it 'ensures firstname pressence' do
    end
  end

  context 'scope tests' do
  end

end
