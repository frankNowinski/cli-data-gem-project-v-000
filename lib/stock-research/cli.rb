module StockResearch
  class StockResearch::CLI
    attr_accessor :tickers, :tag_numbers

    POPULAR_STOCKS = [" AAPL", " GOOG", " MSFT", " NFLX", " TSLA", " IBM", " AMZN", " TWTR", " SBUX", "FB"]
    
    def initialize 
      @tag_numbers = []
    end

    def start
      list
      get_tickers
      get_tags
      GetQuote.new(tickers, tag_numbers).call
      start_over
     end

    def list
      puts "\n"
      puts "Popular Stocks".center(49)
      puts " " + "-" * 46
      puts "\n"
      POPULAR_STOCKS.each_with_index{ |stock, i| puts " #{i+1}. #{stock}" }
    end

    def get_tickers 
      puts "\nEnter the stock tickers of the stocks you would\nlike to recieve realtime stock data on." 
      puts "Separate tickers with a space or comma."
      puts "(Enter 'exit' at any time to exit the program)\n\n"
      @tickers = gets.strip.scan(/\S[a-zA-Z]+/).join("+").upcase
      exit if tickers.include?("EXIT")
    end

    def get_tags
      puts "\nWe'll provide you with the generic stock data. Feel free"
      puts "to select any additional information you want to view"
      puts "by entering the number on the left-hand column."
      puts "Separate number with a space or comma.\n\n"
      puts " 1 | Earnings per Share"
      puts " 2 | Dividend Yield"
      puts " 3 | P/E Ratio"
      puts " 4 | Percent Change From 50 Day Moving Average"
      puts " 5 | Percent Change From 200 Day Moving Average\n\n"
     
      (@tag_numbers << gets.strip.downcase.scan(/\d/)).flatten!
      exit if @tag_numbers.include?("EXIT")
    end

    def start_over
      puts "\n\nWould you like to look up more stocks? ('y' or 'yes')\n"
      input = gets.strip.downcase
      StockResearch::CLI.new.start if input == "y" || input == "yes"
    end
  end
end