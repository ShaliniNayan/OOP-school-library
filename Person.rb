class Person
    attr_reader :id
    attr_accessor :name, :age
  
    def initialize(name = "Unknown", age = nil, parent_permission = true)
      @id = generate_id
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
    def can_use_services?
        of_age? || @parent_permission
      end
    
      private
    
      def of_age?
        @age.to_i >= 18
      end
    
      def generate_id
        @id = Random.rand(1..500)
      end
    end
    