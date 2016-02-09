require 'Time'
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


#  task = Task.new("Buy the milk", "complete")
# puts task.id
# 1
 # task2 = Task.new("Wash the car", "incomplete")
 # puts task2.id
# 2
# puts task.status


