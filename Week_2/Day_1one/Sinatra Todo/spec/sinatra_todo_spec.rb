require 'rspec'
require './sinatra_todo.rb'


RSpec.describe 'sinatra_todo' do
   before :each do
     @task = Task.new("Buy the milk")
   end

  it "Puts the id of the Task" do
    expect(@task.id).to eq(1)
  end

  it "Puts the id of the Task" do
    expect(@task.id).to eq(2)
  end

  it "Puts the status of the Task" do
    expect(@task.completed).to eq(:false)
  end

  it "Puts the status of the Task" do
    expect(@task.completed!).to eq(:true)
  end

  it "Puts the status of the Task" do
    expect(@task.make_incompleted!).to eq(:false)
  end

   it "Puts when the Task was created" do
    expect(@task.created_at).to eq(Time.now.strftime("%d/%b/%Y:%H:%M:%S"))
  end

  it "Update the content of the Task" do
    expect(@task.update_content!("Walk the dog")).to eq("Walk the dog")
  end

  it "change the current time to nil" do
    expect(@task.update_content!("Walk the dog")).to eq("Walk the dog")
  end

  it "change the current time to nil" do
    @task.update_content!("Walk the dog")
    expect(@task.update_at).to eq(Time.now.strftime("%d/%b/%Y:%H:%M:%S"))
  end


end

