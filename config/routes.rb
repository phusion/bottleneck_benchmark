Rails.application.routes.draw do
  root 'benchmark#root'
  post 'benchmark/cpu'
  post 'benchmark/io'
  post 'benchmark/cpu_and_io'
end
