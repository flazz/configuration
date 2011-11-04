require 'configuration/transfer'

module Configuration

  def configure(obj)
    Transfer.new(self, obj).transfer
  end

end
