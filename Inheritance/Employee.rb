class Employee
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

  private
  attr_reader :name, :title, :boss

  protected
  attr_reader :salary
end