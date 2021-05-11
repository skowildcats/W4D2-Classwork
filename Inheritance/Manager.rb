require_relative 'Employee'

class Manager < Employee
  def initialize(name, title, salary, boss = nil, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total = 0
    queue = @employees
    until queue.empty?
      current = queue.shift
      queue += current.employees if current.is_a?(Manager) 
      total += current.salary
    end
    total * multiplier
  end

  protected
  attr_reader :employees
end


