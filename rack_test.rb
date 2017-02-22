require 'minitest/autorun'
 require 'minitest/pride'
 require "rack/test"
 require_relative 'server'


class TestThing < Minitest::Test
   include Rack::Test::Methods



   def test_say_name
    get "/ffffff/6"
    p response
    assert response.ok?
    assert_equal "Hello, Billy", last_response.body
   end





#end of the class
end
