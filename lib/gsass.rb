# CodeKit needs relative paths
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

unless defined?(Sass)
  require 'sass'
end

module Gsass
  class Engine < ::Rails::Engine
    require 'gsass/engine'
  end
end
