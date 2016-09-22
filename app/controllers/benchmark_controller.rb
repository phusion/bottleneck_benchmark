class BenchmarkController < ApplicationController
  def root
    render text: 'Ok'
  end

  def cpu
    render text: fibonacci(25)
  end

  def io
    sleep 0.150
    render text: 'Ok'
  end

  def cpu_and_io
    sleep 0.150
    render text: fibonacci(24)
  end

  private

  # This is an intentionally slow implementation
  def fibonacci(n)
    return n if ( 0..1 ).include? n
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end
