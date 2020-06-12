require 'csv'

namespace :merchants do
  namespace :import do
    desc 'Import merchants from CSV file'
      task :from_csv, [:file_path] => :environment do |_, args|
        abort('Please provide file_path') if args[:file_path].blank?

      data_to_insert = []
      data_hash = File.read(args[:file_path])

      # Columns:
      #  :merchant_name
      #  :description
      #  :email
      #  :status

      # header_converters is used to convert Merchant Name into :merchant_name
      merchants_data = CSV.read(args[:file_path], headers: true, header_converters: ->(h) { h.parameterize.underscore.to_sym })

      progress_bar =
        ProgressBar.create(
          format:         "%a %b\u{15E7}%i %c/%C %p%% %e",
          progress_mark:  ' ',
          remainder_mark: "\u{FF65}",
          starting_at:    0,
          total:          merchants_data.size + 1)

      log_msg =
        lambda do |msg|
          progress_bar.log(msg)
          File.open(Rails.root.join("log/import_merchants.log"), 'a+') { |f| f.write(msg) }
        end

      prepared_merchants_data =
        merchants_data.map do |row|
          row.to_h.tap do |r|
            r[:name] = r.delete(:merchant_name)
            r[:created_at] = DateTime.now
            r[:updated_at] = DateTime.now
            progress_bar.increment
          end
        end

      begin
        # TODO add unique index to skip duplicates by passing unique_by option
        ::Merchant.insert_all(prepared_merchants_data)
        puts "Import of #{prepared_merchants_data.size} merchants successfully finished."
      rescue => e
        puts "Merchants import error: #{e}"
        log_msg.call(e.message)
      end
    end
  end
end
