require 'test_helper'

class BenchmarkControllerTest < ActionDispatch::IntegrationTest
  test "should get cpu" do
    get benchmark_cpu_url
    assert_response :success
  end

  test "should get io" do
    get benchmark_io_url
    assert_response :success
  end

end
