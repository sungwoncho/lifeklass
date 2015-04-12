RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do |example|
    # When the app scales, choose to run database_cleaner for only the spec tagged as :db
    # if example.metadata[:db]
    #   DatabaseCleaner.start
    #   DatabaseCleaner.clean
    # end

    DatabaseCleaner.start
    DatabaseCleaner.clean
  end
end
