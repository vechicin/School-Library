require './person.rb'

class Student < Person
  def initialize(name = "Unkown", age, classroom, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

santiago = Student.new('Santiago', 26, 11, parent_permission: false)
puts(santiago)
