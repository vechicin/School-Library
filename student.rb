require './person'

class Student < Person
  def initialize(age, classroom, parent_permission: true, name = 'Unkown')
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

santiago = Student.new(26, 11, parent_permission: false, 'Santiago')
puts(santiago)
