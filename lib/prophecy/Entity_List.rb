require 'delegate'
module Prophecy
  module Common
    
    class EntityList < DelegateClass(Array)
      attr_reader :kind, :resourceVersion

      def initialize(kind, resource_version, list)
        @kind = kind
        
        @resourceVersion = resource_version
        super(list)
      end
    end
  end
end
