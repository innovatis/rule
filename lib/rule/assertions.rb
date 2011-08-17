module Rule
  module Assertions
    def assert(assertion, message)
      unless assertion
        add_error message
      end
    end

    def assert_presence_of(thing, name)
      unless thing.present?
        add_error "#{name} must be provided"
      end
    end

    def assert_absence_of(thing, name)
      unless thing.blank?
        add_error "#{name} must be blank"
      end
    end
  end
end
