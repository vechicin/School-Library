require './person'

class Teacher < Person
  def initialize(age, specialization, parent_permission: true, name = 'Unkown')
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

domenico = Teacher.new(54, 'Italian', 'Domenico')
puts(domenico)
