require_relative 'app'

def main
  app = App.new
  puts 'Welcome to School Library App!'
  main_menu(app)
end

def main_menu(app)
  loop do
    app.display_menu
    option = gets.chomp.to_i

    case option
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      create_person_menu(app)
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals_for_person
    when 7
      puts 'Thank you for using this App.'
      break
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

def create_person_menu(app)
  puts 'Create a Student (1) or a Teacher (2)? [Input the number]:'
  person_type = gets.chomp.to_i

  case person_type
  when 1
    app.create_student
  when 2
    app.create_teacher
  else
    puts 'Invalid option. Please try again.'
  end
end

main
