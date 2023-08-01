require_relative 'app'
require_relative 'menu'
require_relative 'library_app'

app = App.new
library_app = LibraryApp.new(app)

at_exit do
  library_app.save_data_to_files
end

library_app.start
