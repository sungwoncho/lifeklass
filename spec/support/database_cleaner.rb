RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do |example|
    if true#example.metadata[:db]
      DatabaseCleaner.start
      DatabaseCleaner.clean
    end
  end
end
