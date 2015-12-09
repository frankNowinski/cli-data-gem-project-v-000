class GetQuote
  attr_accessor :tickers,:tag_numbers, :tags, :tags_caption, :url

  def initialize(tickers, tag_numbers)
    @tickers, @tag_numbers = tickers, tag_numbers
    set_tags
  end

  def set_tags
    @tags = %w(n a p o t8 m w v j1)
    @tags_caption = [
      ["Name"],
      ["Asking price"], 
      ["Previous Close"], 
      ["Open"],
      ["1y Target price"],
      ["Days Range"],
      ["52 Week Range"],
      ["Volume"],
      ["Market Cap"]
    ] 
  end

  def call
    additional_tag_captions
    create_url
    print_stocks
  end

  def create_url
    @url = "http://finance.yahoo.com/d/quotes.csv?s=#{tickers}&f=#{tags.join}"
  end

  def currency?(value)
    "#{value.include?('%') || !value.include?('.') ? '' : '$'}"
  end

  def print_stocks
    counter = 1
    open(url) do |csv|
      CSV.parse(csv) do |row|
        puts "\n\n"
        puts "#{row[0]}".center(54)
        puts " " + "-" * 51
        tags_captions.each.with_index(0) do |caption,i  |

        end

        while counter < tags_caption.count 
          puts " #{tags_caption[counter].join}: #{currency?(row[counter])}#{row[counter]}"
          counter += 1
        end
        counter = 1
      end
    end
  end

  def additional_tag_captions
    tag_numbers.each do |tag|
      case tag
      when "1"
        tags_caption << ["Earnings per Share"]
        tags << ["e"]
      when "2"
        tags_caption << ["Dividend Yield"]
        tags << ["y"]
      when "3"
        tags_caption << ["P/E Ratio"]
        tags << ["r"]
      when "4"
        tags_caption << ["Percent Change From 50 Day Moving Average"]
        tags << ["m6"]
      when "5"
        tags_caption << ["Percent Change From 200 Day Moving Average"]
        tags << ["m8"]
      end
    end
  end
end 