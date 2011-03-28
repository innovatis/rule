module Rule
  module Engine
    class State

      attr_reader :name
      
      def initialize(name)
        @name = name
        @transitions = []
      end 
          
      def add_transition(to, blk)
        @transitions << Transition.new(self, to, blk)
      end 

      def valid_transitions(object)
        @transitions.map { |transition|
          begin
            transition.run!(object)
          rescue Rule::Engine::InvalidTransition
            nil
          else 
            transition
          end 
        }.compact
      end 

      def next_state(object)
        transitions = valid_transitions(object)
        if transitions.any?
          return transitions.sort_by{|transition| transition.priority}.last.to_state
        else 
          return self
        end 
      end 

      
    end 
  end 
end 



