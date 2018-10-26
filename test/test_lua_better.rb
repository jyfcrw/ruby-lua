require 'helper'

class TestLuaBetter < Test::Unit::TestCase
  context "a lua jit" do
    setup do
      @lua = Language::Lua.new()

      @lua.eval <<-LUA
        function foo()
          local a = {}
          a.foos = {}
          table.insert(a.foos, {b=100})
          table.insert(a.foos, {c=200})
          a.foos[1].c = 300
          return a
        end

        function baa(a)
          a.baas = a.baas or {}
          table.insert(a.baas, {b=100})
          table.insert(a.baas, {c=200})
          a.baas[1].c = 300
          return a
        end

        function cee()
          return {b=1}, 2, "cee is CEE."
        end

        function tuu()
          a, b, c = cee()
          return a, b, c
        end
      LUA
    end

    should "return a array instead of table" do
      result = @lua.call(true, "foo")
      # puts result
      assert_equal 2, result['foos'].size
      assert_equal 100, result['foos'][0]['b']
      assert_equal 200, result['foos'][1]['c']
      assert_equal 300, result['foos'][0]['c']
    end

    should "support symbal as keys" do
      a = { foo: 'test baa', baas: [ { f: 'Hello' } ] }
      result = @lua.call(true, "baa", a)
      # puts result
      assert_equal 3, result['baas'].size
      assert_equal 'Hello', result['baas'][0]['f']
      assert_equal 100, result['baas'][1]['b']
      assert_equal 200, result['baas'][2]['c']
      assert_equal 300, result['baas'][0]['c']
    end

    should "return multiple values" do
      result, other, last = @lua.call(true, "cee")
      # puts result, other, last
      assert !result.nil?
      assert other.is_a? Numeric
      assert last.is_a? String
    end

    should "return multiple values in right order" do
      result, other, last = @lua.call(true, "tuu")
      # puts result, other, last
      assert_equal Hash, result.class
      assert_equal 2, other
      assert_equal "cee is CEE.", last 
    end
  end
end
