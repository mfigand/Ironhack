require 'rspec'
require './sinatra_todo.rb'
require 'rack/test'
require 'pry'

RSpec.describe 'sinatra_todo' do
   before :each do
     @todo = TodoList.new
     @task = Task.new("Buy the milk")
     @task2 = Task.new("Walk the dog")
   end

  it "Check if the add_task works" do
    @todo.add_task(@task)
    expect(@todo.tasksArray.find{|task| task.id == @task.id}).not_to be(nil)
  end

  it "Find a task by id" do
    @todo.add_task(@task)
    expect(@todo.find_task_by_id(@task.id)).to eq(@task)
  ends

  it "Delete task by id" do
    @todo.add_task(@task)
    @todo.delete_task_by_id(@task.id)
    expect(@todo.tasksArray.find{|task| task.id == @task.id}).to be(nil)
  end

  it "Sort task by created_at" do
    @todo.add_task(@task)
    @todo.add_task(@task2)
    @todo.sort_by_created
    #binding.pry
    expect(sorted_tasksArray[0]).to be(sorted_tasksArray[0])
  end

end










