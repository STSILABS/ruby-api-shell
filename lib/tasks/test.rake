desc 'Run all code scan and tests'
task :test do
  sh 'rspec'
  sh 'brakeman'
  sh 'rubocop'
end
