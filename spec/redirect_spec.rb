require 'rack/test'
require_relative '../lib/redirect'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

describe Redirect do
  let(:app) { described_class.new(target: 'http://example.com', status: 302) }

  context 'GET /' do
    let(:response) { get '/' }

    it { expect(response.status).to eq(302) }
    it { expect(response.location).to eq('http://example.com/') }
  end

  context 'GET /test' do
    let(:response) { get '/test' }

    it { expect(response.status).to eq(302) }
    it { expect(response.location).to eq('http://example.com/test') }
  end

  context 'GET /test/?query=yes' do
    let(:response) { get '/test/?query=yes' }

    it { expect(response.status).to eq(302) }
    it { expect(response.location).to eq('http://example.com/test/?query=yes') }
  end
end
