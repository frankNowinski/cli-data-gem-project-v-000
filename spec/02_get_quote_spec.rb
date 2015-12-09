
require 'spec_helper'

describe 'GetQuote' do 
  describe '#create_url' do
    # Given a ticker of AAPL
    # and tags of %w(n a p o t8 m w v j1)
    # what should the @url be, what should create_url return?
    get_quote = GetQuote.new(["AAPL"], [])

    expect(get_quote.create_url).to eq("?")
  end
end