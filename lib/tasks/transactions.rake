namespace :transactions do
  desc 'Wipe transactions older than 1 hour'
  task wipe_older_than_hour: :environment do
    target_transactions = Transaction.where("updated_at > ?", 1.hour.from_now)

    begin
      target_transactions.delete_all
      puts "#{target_transactions.size} Transactions were successfully deleted."
    rescue => e
      puts "Transactions wiping error: #{e}"
    end
  end
end
