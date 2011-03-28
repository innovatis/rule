module Rule

  class Base
    attr_reader :object
    def initialize(object)
      @object = object
      @errors = []
    end 
    
    def add_error(error)
      @errors << error
    end 

    def pass?
      validate != false and @errors.none?
    end 
    
    include Rule::Assertions
  end 
end 

