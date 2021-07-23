require 'rails_helper'

RSpec.describe Task, type: :model do

  it "Validation does not pass if the name is empty" do
    task = Task.new(name: '', content: 'Failure test')
    expect(task).not_to be_valid
  end

  it "Validation does not pass if content is empty" do
    task = Task.new(name: 'Failure test', content: '')
    expect(task).not_to be_valid
  end

  it "validation passes If content is described in name and content" do
    task=Task.new(name:'True',content:'True')
  end
end
