require("minitest/autorun")
require("minitest/rg")
require_relative("../models/record.rb")

class TestRecord <MiniTest::Test

  def setup
    options = {
      "id" => 1,
      "title" => "2112",
      "quantity" => 5,
  end



  def test_record_title()
    assert_equal("2112", @record.title)
  end

  
end
