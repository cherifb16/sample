require 'rails_helper'
    RSpec.describe Doctor, type: :system do

        it "Validation does not pass if the first_name is empty" do
          doctor = Doctor.new(first_name: '', last_name: 'Failure test')
          doctor = Doctor.new(last_name: '', last_name: 'Failure test')
          doctor = Doctor.new(city: '', last_name: 'Failure test')
          doctor = Doctor.new(username: '', last_name: 'Failure test')
          doctor = Doctor.new(password: '', last_name: 'Failure test')
          doctor = Doctor.new(address: '', last_name: 'Failure test')
          doctor = Doctor.new(primary_practice: '', last_name: 'Failure test')
          doctor = Doctor.new(secondary_practice: '', last_name: 'Failure test')
          doctor = Doctor.new(gcmid: '', last_name: 'Failure test')
          expect(doctor).not_to be_valid

        end
      
        it "Validation does not pass if last_name is empty" do
          doctor = Doctor.new(first_name: 'Failure test', last_name: '')
          doctor = Doctor.new(last_name: '', last_name: 'Failure test')
          doctor = Doctor.new(city: '', last_name: 'Failure test')
          doctor = Doctor.new(username: '', last_name: 'Failure test')
          doctor = Doctor.new(password: '', last_name: 'Failure test')
          doctor = Doctor.new(address: '', last_name: 'Failure test')
          doctor = Doctor.new(primary_practice: '', last_name: 'Failure test')
          doctor = Doctor.new(secondary_practice: '', last_name: 'Failure test')
          doctor = Doctor.new(gcmid: '', last_name: 'Failure test')
          expect(doctor).not_to be_valid
        end
      
        it "validation passes If last_name is described in first_name and last_name" do
          doctor=Doctor.new(first_name:'True',last_name:'True')
          doctor = Doctor.new(last_name: 'True', last_name: 'True')
          doctor = Doctor.new(city: 'True', last_name: 'True')
          doctor = Doctor.new(username: 'True', last_name: 'True')
          doctor = Doctor.new(password: 'True', last_name: 'True')
          doctor = Doctor.new(address: 'True', last_name: 'True')
          doctor = Doctor.new(primary_practice: 'True', last_name: 'True')
          doctor = Doctor.new(secondary_practice: 'True', last_name: 'True')
          doctor = Doctor.new(gcmid: 'True', last_name: 'True')
        end
      end