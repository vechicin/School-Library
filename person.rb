class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, parent_permission: true, name = 'Unkown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?(age)
    return true if age >= 18

    false
  end

  private :is_of_age?

  def can_use_services?
    return true if is_of_age? || parent_permission
  end
end

santiago = Person.new(26, 'Santiago')
puts(santiago)
