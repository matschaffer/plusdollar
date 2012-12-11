# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

require 'webmock/rspec'
WebMock.disable_net_connect!(:allow_localhost => true)

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  def sign_in email='mat@schaffer.me'
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: 'test1234'
    click_on 'Sign in'
  end

  def stub_github_issues_api
    @example_api_url = "https://api.github.com/repos/matschaffer/knife-solo/issues/1"
    @example_url = "https://github.com/matschaffer/knife-solo/issues/1"
    @example_title = "Upload cookbooks to secure location"
    stub_request(:get, @example_api_url).to_return(body: { title: @example_title}.to_json)
  end

  def stub_stripe_customer_api
    @example_customer = {id: "cus_fromatest", active_card: "afakecard"}
    stub_request(:post, "https://api.stripe.com/v1/customers").to_return(body: @example_customer.to_json)
  end

  config.before do
    stub_github_issues_api
  end
end
