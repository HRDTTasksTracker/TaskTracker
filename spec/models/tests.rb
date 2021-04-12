require 'rails_helper'

RSpec.describe User, type: :model do

  # Tests Assume that Database is reset from the begining - if not reset some tests in the begining will fail
  # To reset database enter "rails db:reset" into the command console
  # Confirm also that server is running
  # For faster tests just comment out the sleep functions - sleeps just for easier to demo

  context 'Connection tests' do
    it 'ensures website loads without error' do
      # checks if website loads without error, if error usually a database connection issue with rails
      visit("http://localhost:3000/")
      sleep(2)
      expect(page).to have_content('Welcome')
    end
  end

  # check valid and non valid input for users
  context 'Admin User' do
    it 'Checks if New User page loads and accepts valid input' do
      visit("http://localhost:3000/")
      click_button('Sign Up')
      visit("http://localhost:3000/users/new?")
      expect(page).to have_content('Create Account')
      sleep(2)
      
      # fill in fields with valid input
      fill_in 'user_full_name', :with => 'Admin'
      fill_in 'user_email', :with => 'admin@gmail.com'
      fill_in 'user_discord_username', :with => 'adminDiscord'
      fill_in 'user_phone', :with => '1234567890'
      fill_in 'user_username', :with => 'adminUsername'
      fill_in 'user_password', :with => 'Password'
      sleep(2)

      click_button('Create Account')
      sleep(2)
      expect(page).to have_content('Tasks')
    end
  end

  # check valid and non valid input for users
  context 'New User - should give whitelist error' do
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
    it 'Checks if user can log in with info - uses admin' do
      visit("http://localhost:3000/")
      click_button('Login')
      expect(page).to have_content('Login')
      sleep(2)

      # fill in fields with valid input
      fill_in 'username', :with => 'adminUsername'
      fill_in 'password', :with => 'Password'
      sleep(2)

      click_button('Login')
      sleep(2)
      expect(page).to have_content('Tasks')

    end
  end

  context 'Create Tasks Tests' do
    it 'checks if basic function for making a tasks are avaialable' do
      visit("http://localhost:3000/")
      click_button('Login')
      expect(page).to have_content('Login')
      sleep(2)

      # fill in fields with valid input
      fill_in 'username', :with => 'adminUsername'
      fill_in 'password', :with => 'Password'
      sleep(2)

      click_button('Login')
      sleep(2)

      visit("http://localhost:3000/tasks/new")
      sleep(2)

      # fill in fields with valid input
      fill_in 'task_task_name', :with => 'Task_01'
      fill_in 'task_claimed_by', :with => 'Admin'
      fill_in 'task_task_description', :with => 'description for task'
      fill_in 'task_tag', :with => 'TagName'
      sleep(2)

      click_button('Create Task')
      sleep(2)
      
    end
  end

  context 'Create Role Tests' do
    it 'ensures role creation' do
      visit("http://localhost:3000/roles")
      sleep(2)
      visit("http://localhost:3000/roles/new")
      sleep(2)

      #fill in fields
      fill_in 'role_role_name', :with => 'newRole'
      sleep(2)
      click_button('Create Role')
      sleep(2)
      visit("http://localhost:3000/roles")
      sleep(2)
    end
  end

  context 'whitelist security check' do
    it 'ensures that whitelist is usable' do
      visit ("http://localhost:3000/valid_emails/new")
    end
  end

end
