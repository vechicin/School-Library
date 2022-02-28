class Person
  attr_accessor :name
  attr_accessor :age
  attr_reader :id

  def initialize(name = "Unkown", age, parent_permission: true)
  @id = Random.rand(1..1000)
  @name = name
  @age = age
  @parent_permission = parent_permission
  end

  def is_of_age?(age)
  return true if age >= 18
  false
  end

  private :is_of_age?

  def can_use_services?
  return true if is_of_age? || parent_permission
  end
end

santiago = Person.new('Santiago', 26)
puts(santiago)
