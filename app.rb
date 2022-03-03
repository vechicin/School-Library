require './book'
require './person'
require './rental'
require './student'
require './teacher'

class App
  attr_accessor :books
  attr_reader :options

  def initialize
    @options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
    'List all rentals for a given person id', 'Exit']
    @books = []
    @people = []
    @rentals = []
  end

  def run_program
    p 'Please choose an option!'
    @options.each_with_index do |option, id|
      p "#{id + 1} - #{option}"
    end
    choice = gets.chomp
    execute(choice)
  end

  def execute(choice)
    case choice
    when '1' then booklist
    when '2' then people
    when '3' then create_person
    when '4' then new_book
    when '5' then new_rental
    when '6' then rental_id
    when '7' then quit_app
    else p 'Please enter a valid input, it must be a number between 1 and 7'
    end
  end

  def booklist
    if @books.empty?
      p 'There are currently no books, please add a new book'
    else
      @books.each { |book| p "Title: #{book.title}, Author: #{book.author}" }
    end
    puts ''
    run_program
  end

  def people
    if @people.empty?
      p 'There are currently no people, please add a new person'
    else
      @people.each do |person|
        p "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts ''
    run_program
  end

  def create_person
    p 'Is this person a student(1) or a teacher(2)?'
    choice = gets.chomp
    case choice
      when '1' then new_student
      when '2' then new_teacher
      else p 'Please enter a valid input, it must be the number 1 or the number 2' 
    end
  end

  def new_student
    p "Enter student's classroom"
    classroom = gets.chomp.to_i
    p 'Enter name: '
    name = gets.chomp
    p 'Enter age: '
    age = gets.chomp.to_i
    p 'Parent permission? [Y/N]'
    input = gets.chomp.downcase
    valid_permission = input == 'y'
    @people.push(Student.new(classroom, age, name, parent_permission: valid_permission))
    p 'Success!'
    puts ''
    run_program
  end

  def new_teacher
    p 'Enter age: '
    age = gets.chomp.to_i
    p 'Enter name: '
    name = gets.chomp
    p 'Enter specialization: '
    specialization = gets.chomp
    @people.push(Teacher.new(specialization, age, name))
    p 'Success!'
    puts ''
    run_program
  end

  def new_book
    p 'Enter title: '
    title = gets.chomp
    p 'Enter author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    p 'Success!'
    puts ''
    run_program
  end

  def new_rental
    p 'Please select a book'
    @books.each_with_index do |book, id|
      p "ID: #{id}, Title: #{book.title}, Author: #{book.author}"
    end
    book = @books[gets.chomp.to_i]
    p 'Please select the person who is renting the book'
    @people.each_with_index do |person, id|
      p "#{id}. Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person = @people[gets.chomp.to_i]
    p 'Date of rental (yyyy-mm-dd): '
    date = gets.chomp
    @rentals.push(Rental.new(date, book, person))
    p 'Success'
    puts ''
    run_program
  end

  def rental_id
    if @people.empty?
      p 'Nobody has rented a book'
    else
      p "Enter person's id: "
      id = gets.chomp.to_i
      @people.each do |person|
        if person.id == id
          person.rentals.each do |rental|
            p "Date of rental: #{rental.date}, Title: #{rental.book.title}, Author: #{rental.book.author}"
          end
        else p 'There are no rentals for that id'
        end
      end
    end
    puts ''
    run_program
  end

  def quit_app
    p 'Thank you for using this app, see you soon!'
  end
end
