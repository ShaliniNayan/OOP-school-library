require_relative 'app'

class LibraryApp
  def initialize(app)
    @app = app
  end

  def start
    menu = Menu.new(@app)
    menu.display
  end

  def save_data_to_files
    @app.save_data_to_files
  end
end
