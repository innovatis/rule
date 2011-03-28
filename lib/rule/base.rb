module Rule

  module Assertions
    def assert(assertion, message)
      unless assertion
        @errors << message
      end 
    end 
    
    def assert_presence_of(thing, name)
      unless thing.present?
        @errors << "#{name} must be provided"
      end 
    end 

    def assert_absence_of(thing, name)
      unless thing.blank?
        @errors << "#{name} must be blank"
      end 
    end 
  end 
  
  class Base
    attr_reader :object
    def initialize(object)
      @object = object
      @errors = []
    end 
    
    include Rule::Assertions
  end 
end 

