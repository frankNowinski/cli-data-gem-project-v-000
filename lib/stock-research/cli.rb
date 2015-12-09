module StockResearch
  class StockResearch::CLI
    attr_accessor :tickers, :tags

    START_STOCKS = [" AAPL", " GOOG", " MSFT", " NFLX", " TSLA", " IBM", " AMZN", " TWTR", " SBUX", "FB"]
    
    def initialize 
      @tags = %w(N A P O T8 M W V J1)
    end

    def start
      list
      get_tickers
      get_tags
      GetQuote.new(tickers, tags).call
      start_over
     end

    def list
      puts "\n"
      puts "Popular Stocks".center(47)
      puts " " + "-" * 45
      puts "\n"
      START_STOCKS.each_with_index{ |stock, i| puts " #{i+1}. #{stock}" }
    end

    def get_tickers 
      puts "\nEnter the stock tickers you want more infomation on." 
      puts "Separate tickers with a space or comma."
      puts "(Enter 'exit' at any time to exit the program)\n\n"
      @tickers = gets.strip.scan(/\S[a-zA-Z]+/).join("+").upcase
      exit if tickers.include?("EXIT")
    end

    def get_tags
      puts "\nWe'll provide you with the generic stock data. Feel free"
      puts "to select any additional information you want to view"
      puts "by entering the tag on the left-hand column."
      puts "Separate tags with a space or comma.\n\n"
      puts " e  | Earnings per Share"
      puts " y  | Dividend Yield"
      puts " r  | P/E Ratio (Realtime)"
      puts " m8 | Percent Change From 50 Day Moving Average"
      puts " m6 | Percent Change From 200 Day Moving Average\n\n"
     
      (@tags << gets.strip.upcase.scan(/\S+/)).flatten!
      exit if @tags.include?("EXIT")
    end

    def start_over
      puts "\n\nWould you like to look up more stocks? ('y' or 'yes')\n"
      input = gets.strip.downcase
      StockResearch::CLI.new.start if input == "y" || input == "yes"
    end
  end
end