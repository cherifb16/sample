# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)


RSpec.feature "user management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  background do
    User.create!(names: "amina", email: 'aminauzayisenga@gmail.Com', user_type: 'admin',  password: '123456')
    visit  log_in_path
    #click_on 'Login'
    fill_in  'Email' ,  with: 'aminauzayisenga@gmail.Com'
    fill_in  'Password' ,  with: '123456'
    click_on  'Log in'
    
  end
  
  scenario "Test number of users" do
    
    User.create!(names: 'amina', email: 'amina@gmail.com', user_type: 'admin', password: '123456')
    @user = User.all.count
    expect(@user).to eq 2
  end

  scenario "Test user list" do
    
    User.create!(names: 'amina', email: 'aminauzayisenga@gmail.com', user_type: 'admin', password: '123456')
    visit admin_users_path
    expect(page ).to  have_content  'uzayisenga'
    expect(page ).to  have_content  'amina'
  end

  scenario "Test user creation" do
    User.create!(names: 'amina', email: 'amina@gmail.com', user_type: 'admin', password: '123456')
    visit admin_users_path
    expect(page ).to  have_content  'amina'
  end

  scenario "test enable user creation page" do
    visit admin_users_path

    expect(page ).to  have_content  'amina'
  end

  scenario "Test user details" do
    @user= User.create!(names: 'amina', email: 'butera@gmail.com', user_type: 'admin', password: '123456')

    
    visit admin_user_path(id: @user.id)
    expect(page).to have_content('butera@gmail.com')
    expect(page).to have_content('admin')
  end
  scenario "Test user updating" do
    @user = User.first
    visit edit_admin_user_path(id: @user.id)
    fill_in 'Name', with: 'name update'
    fill_in 'Email', with: 'amina1@gmail.com'
    click_on 'Update User'
    visit admin_users_path
    expect(page).to have_content('amina1@gmail.com')
    expect(page).to have_content('name update')
  end
  scenario 'Test user Deletion' do
    User.create!(names: 'aminabutera', email: 'aminabutera1@gmail.com', user_type: 'admin', password: '123456')
    @user = User.last
    @user.destroy
   
    #click_on 'Destroy'
    visit users_path
    expect(page).not_to have_content('aminabutera')
  end
end