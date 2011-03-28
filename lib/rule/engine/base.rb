module Rule
  module Engine
    class Base

      def self.state(state)
        find_or_create_state(state)
      end 
      
      def self.initial_state(state)
        @initial_state = find_or_create_state(state)
      end 
      
      def self.terminal_state(state)
        @terminal_states ||= []
        @terminal_states << find_or_create_state(state)
      end 
      
      def self.transition(from, to, &blk)
        from_state = find_state!(from)
        to_state   = find_state!(to)

        from_state.add_transition(to_state, blk)
      end 

      def run(object)
                
      end 

      private #################################################################
      
      def self.find_or_create_state(name)
        @states ||= []
        unless state = @states.find { |state| state.name == name }
          state = Rule::Engine::State.new(state)
          @states << state
        end 
        state
      end 

      def self.find_state!(name)
        unless state = @states.find { |state| state.name == name }
          raise "State #{state} not declared."
        end 
        state
      end 
      
    end 
  end 
end 
