module Rule
end

path = File.dirname(__FILE__)
$:.unshift(path) unless $:.include?(path)

require 'rule/assertions'
require 'rule/base'
require 'rule/allow'
require 'rule/disallow'
require 'rule/engine/base'
require 'rule/engine/invalid_transition'
require 'rule/engine/state'
require 'rule/engine/transition'

require 'rule/active_record_extensions'
require 'rule/engine/active_record'
require 'rule/railtie'
