require("minitest/autorun")
require("minitest/rg")
require_relative("../models/record.rb")

class TestRecord <MiniTest::Test

  def setup
    options = {
      "id" => 1,
      "title" => "2112",
      "quantity" => 5,
    }
    @record = Record.new(options)
  end

  def test_record_title()
    assert_equal("2112", @record.title)
  end

  def test_stock_level()
    assert_equal(5, @record.quantity)
  end


end
