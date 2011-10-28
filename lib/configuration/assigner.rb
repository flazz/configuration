module Configuration

  class Assigner
    attr_reader :source
    attr_reader :target

    def initialize(source, target)
      @source = source
      @target = target
    end

    def assign
      settings.each do |name|
        value = source.get name
        target.set name, value
      end
    end

    def settings
      source.configurations.keys & target.settings
    end

  end

end
