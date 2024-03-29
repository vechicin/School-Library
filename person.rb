require './corrector'
require './rental'

class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @correct_name = Corrector.new
    @rentals = []
  end

  def can_use_services?
    return false unless is_of_age? || @parent_permission
  end

  def validate_name(_name)
    @name = @correct_name.correct_name(@name)
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
