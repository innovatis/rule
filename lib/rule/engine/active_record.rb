require 'active_support/concern'

module Rule
  module Engine
    module ActiveRecord
      extend ActiveSupport::Concern

      included do
        
      end 
      
      module InstanceMethods
        def run_rules
          @__rule_engine.run!(self)
        end 
      end 
      
      module ClassMethods
        
      end 
      
    end 
  end 
end 


