
require 'rails_helper'
RSpec.feature "Publisher management function", type: :feature do
  background do
    User.create!( email: 'amina1@gmail.Com',  password: '123456', password_confirmation:'123456')
    visit new_user_session_path
    fill_in 'Email', with: 'amina1@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    
    Publisher.create(name:'amina', publish:'happiness comes', email:'aminauzayisenga@gmail.com')
  end
  scenario "Test publisher list" do
    
    visit publishers_path
  
  end

  scenario "Test publisher creation" do
    Publisher.create(name:'amina', publish:'happiness comes', email:'aminauzayisenga@gmail.com')
  end

  scenario "Test publisher details" do
    Publisher.first
   
  end

  scenario "Test publisher updating" do
    click_on 'publisher'

    publisher=Publisher.create(name:'amina', publish:'happiness comes', email:'aminauzayisenga@gmail.com')
    
    publisher.name='amina2'
    publisher.save
   # save_and_open_page
   
  end
  scenario 'Test Publisher Deletion' do
    publisher2=Publisher.create(name:'amina', publish:'happiness comes', email:'aminauzayisenga@gmail.com')
    publisher2.delete
   
    visit publishers_path
    
  end
  scenario 'Test Publisher validation' do
    Publisher.create(name:'amina', publish:'happiness comes', email:'aminauzayisenga@gmail.com')
    visit publishers_path
    
      
      
  end
  
  

end