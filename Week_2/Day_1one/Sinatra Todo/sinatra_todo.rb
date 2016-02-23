require 'Time'
require 'pry'

class Task
    attr_reader :content, :status, :id, :created_at, :update_at
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @complete = :false
        @created_at = Time.now.strftime("%d/%b/%Y:%H:%M:%S")
        @update_at = nil
    end

    def completed
      @complete
    end

    def completed!
      @complete = :true
    end

    def make_incompleted!
      @complete = :false
    end

    def update_content!(new_content)
      @update_at = Time.now.strftime("%d/%b/%Y:%H:%M:%S")
      @content = new_content    
    end

end

class TodoList
  attr_reader :tasksArray
  def initialize
    @tasksArray = []
  end

  def add_task(new_task)
    @tasksArray << (new_task)
  end

  def delete_task_by_id(search_id)
    @tasksArray.delete_if { |item| item.id == search_id} 
  end

  def find_task_by_id(search_id)
    @task_byId = nil
    @tasksArray.each do |item|
      if item.id == search_id
        @task_byId = item
      end
    end
   @task_byId
  end

  def sort_by_created
    sorted_tasksArray = @tasksArray.sort { |task, task2| task.created_at <=> task2.created_at }
    sorted_tasksArray
  end
    


 end

# task = Task.new("Buy the milk")
# todo = TodoList.new
# todo.add_task(task)
# #todo.delete_task_by_id(1)
# todo.find_task_by_id(1)


#  task = Task.new("Buy the milk", "complete")
# puts task.id
# 1
 # task2 = Task.new("Wash the car", "incomplete")
 # puts task2.id
# 2
# puts task.status


