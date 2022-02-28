require './person.rb'

class Teacher < Person
  def initialize(name = "Unkown", age, specialization, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

domenico = Teacher.new('Domenico', 54, 'Italian')
puts(domenico)
