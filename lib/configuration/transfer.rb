module Configuration

  class Transfer
    attr_reader :source
    attr_reader :target

    def initialize(source, target)
      @source = source
      @target = target
    end

    def transfer
      assignments.each &:assign
    end

    def assignments
      settings.map { |setting| Assignment.new(source, target, setting) }
    end

    def settings
      target.settings.select { |setting| source.respond_to? setting }
    end

    class Assignment
      attr_reader :source
      attr_reader :target
      attr_reader :setting

      def initialize(source, target, setting)
        @source = source
        @target = target
        @setting = setting
      end

      def assign
        target.set setting, value
      end

      def value
        source.send setting
      end

    end


  end

end
