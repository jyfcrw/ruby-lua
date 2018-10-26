module Language
  class Lua
    class Function
      attr_accessor :lua, :fname

      def initialize(lua = nil, fname = nil)
        @lua = lua
        @fname = fname
      end

      def call(*args)
        @lua.call(fname, *args)
      end
    end
  end
end
