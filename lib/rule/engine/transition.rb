module Rule
  module Engine
    class Transition
      attr_reader :from, :to, :action
      alias_method :to_state, :to
      alias_method :from_state, :from
      
      PRIORITIES = { 
        :min       => 0,
        :very_low  => 1,
        :low       => 3,
        :normal    => 5,
        :high      => 7,
        :very_high => 9,
        :max       => 10
      }
      
      def initialize(from, to, action)
        @from     = from
        @to       = to
        @action   = action
        @priority = PRIORITIES[:normal]
      end 
      
      def run!(object)
        @object = object
        action.bind(self).call
      end 
      
      def validate(rule_klass)
        unless rule_klass.new(@object).validate
          raise Rule::Engine::InvalidTransition
        end 
      end 

      def priority(priority)
        case priority
        when Numeric
          @priority = priority
        when Symbol
          @priority = PRIORITIES[:normal]
        else 
          raise "Invalid priority"
        end 
      end 
      
    end 
  end 
end 




