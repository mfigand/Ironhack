class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        @name = name
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      #returns the hours worked * hourly_rate
      @hourly_rate*@hours_worked
    end
end

class SalariedEmployee < Employee
    def initialize(name, email, salary)
        @name = name
        @email = email
        @salary = salary
    end

    def calculate_salary
      #returns the hours worked * hourly_rate
      @salary/52
    end
end

class MultiPaymentEmployee < Employee
    def initialize(name, email, salary, hourly_rate, hours_worked)
        @name = name
        @email = email
        @salary = salary
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      #returns the hours worked * hourly_rate
      @salary/52 + @hourly_rate*@hours_worked
    end
end

class Payroll
    def initialize(employees)
        @employees = employees
    end
  def pay_employees
  	@employees.each do |item|
  		puts "#{item.name} -> #{item.calculate_salary*1.18}" # El error no está aquí, viene dado por otro método que habéis implementado
      # Should output how much we're paying each employee for this week and the total amount spent on payroll this week. 
  		end
  end
  def notify_employee(employee)
  	@employees.each do |item|
  		puts "#{item.email} have been paid"
  	end
          #email them
  end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
manuel = HourlyEmployee.new("Manuel", "m.figand@gmail.com", 35, 40)
eli = HourlyEmployee.new("Elisa", "sfj@asdjfhjk.com",35, 45)

employees = [josh, nizar, ted, manuel, eli]
payroll = Payroll.new(employees)
payroll.pay_employees
payroll.notify_employee(employees)

















