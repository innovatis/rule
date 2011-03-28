require 'active_support/concern'

module Rule
  module Engine
    class ActiveRecord
      extend ActiveSupport::Concern

      included do
        
      end 
      
      module InstanceMethods
        def validate
          @__rule_engine.run!(self)
        end 
      end 
      
      module ClassMethods
        
      end 
      
    end 
  end 
end 


