namespace :import do
  desc "import stock data from spreadsheet"
  task data: :environment do
    puts 'Import start'

    data = Roo::Spreadsheet.open('lib/stock.xlsx')
    headers = data.row(1)

    data.each_with_index do |row, index|
      next if index == 0

      stock_data = Hash[[headers, row].transpose]

      code = stock_data['종목코드'].to_s

      while code.length < 6
        code.prepend("0")
      end

      stock = Stock.new(name: stock_data['회사명'], code: code)
      if stock.save!
        puts "Saving #{stock.name}: #{stock.code}"
      end
    end
  end

end
