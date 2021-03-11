# RSpec test for new.html.erb file
# - tests input for new users and fills out form and test form input and results
# - also used to show test template for other teammemebers

require '../spec_helper' # must be like this to find file in previous folder can test using hash find file command to verify

#test 1 to test if forms allow input and can render results
describe 'users/new.html.erb' do
    it 'displays new user input correctly' do
        assign(:full_name, "Full_Name_test")
        assign(:role, "role_test")
        assign(:email, "email_test")
        assign(:discord_username, "discord_username_test")
        assign(:phone, "phone_test")
        assign(:username, "username_test")
        assign(:password, "password_test")

        render

        expect(:full_name).to eq('Full_Name_test')
        expect(:role).to eq('role_test')
        expect(:email).to eq('email_test')
        expect(:discord_username).to eq('discord_username_test')
        expect(:phone).to eq('phone_test')
        expect(:username).to eq('username_test')
        expect(:password).to eq('password_test')
    end
end
