module Configuration

  module ClassMethods

    def configure name
      define_setter name
      define_getter name
    end

    def define_getter(name)
      define_method(:"#{name}") { get name }
    end

    def define_setter(name)
      define_method(:"#{name}=") { |value| set name, value }
    end

  end

end
