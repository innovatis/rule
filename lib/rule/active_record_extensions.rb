class ActiveRecord::Base
  def self.rule_engine(engine, opts={})
    include(Rule::Engine::ActiveRecord)
    column = opts[:column] || :state

    @__rule_engine = engine.new(column)
  end
end

