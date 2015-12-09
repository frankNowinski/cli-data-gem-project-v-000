require_relative '../lib/stock-research/cli'
require 'pry'

describe 'CLI' do
  let(:stocks){StockResearch::CLI.new}

  describe '#initialize' do
    it "initializes with @tag_numbers set to an empty array" do
      expect(stocks.tag_numbers).to eq([])
    end

    it 'has an attribute to store stock tickers' do
      expect(stocks).to respond_to(:tickers)
      expect(stocks).to respond_to(:tickers=)
    end

    it 'has an attribute to store additional tag numbers' do
      expect(stocks).to respond_to(:tag_numbers)
      expect(stocks).to respond_to(:tag_numbers=)
    end
  end

  describe '#start' do
    it 'is an instance method' do 
      expect(stocks).to respond_to(:start) 
    end

    it 'calls an instance method called #list' do
      expect(stocks.start).to respond_to(:list) # Why does this enter the program?
    end
  end

    # Unsure of how to tests for constant variables
    # describe '::POPULAR_STOCKS' do
    #   POPULAR_STOCKS = [" AAPL", " GOOG", " MSFT", " NFLX", " TSLA", " IBM", " AMZN", " TWTR", " SBUX", "FB"]

    #   it 'defines a constant POPULAR_STOCKS as an array of 10 popular stocks' do
    #     expect(POPULAR_STOCKS).to eq(Stocks::POPULAR_STOCKS)
    #   end
    # end
end

# describe '#get_tickers' do

#   it 'gets tickers and assigns them to @tickers' do
#     allow($stdin).to receive(:puts)

#     expect(stocks.tickers).to receive(:gets).and_return("aapl")
#     expect(stocks.tickers).to eq("AAPL")
#   end
# end


