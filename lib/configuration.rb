require 'configuration/class_methods'
require 'configuration/assigner'

module Configuration

  def self.included(mod)
    mod.extend ClassMethods
  end

  def get(name)
    configurations.fetch name
  end

  def set(name, value)
    configurations.store name, value
  end

  def configurations
    @configurations ||= {}
  end

  def configure(obj)
    Assigner.new(self, obj).assign
  end

end
