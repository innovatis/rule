module Rule
  module Engine
    class Base

      def initialize(column)
        @column = column
      end 
      
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

      def run!(object)
        state = self.class.find_state!(object.send(column)) || @initial_state
        loop do
          prev_state = state
          state = prev_state.next_state(object)
          break if prev_state == state
        end 
        object.update_attribute(column, state.name)
      end 

      private #################################################################
      
      def self.find_or_create_state(name)
        @states ||= []
        unless state = @states.find { |state| state.name == name }
          state = Rule::Engine::State.new(name)
          @states << state
        end 
        state
      end 

      def self.find_state!(name)
        unless state = @states.find { |state| state.name == name }
          raise "State #{name} not declared."
        end 
        state
      end 
      
    end 
  end 
end 
