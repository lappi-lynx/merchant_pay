every :hour do
  rake "transactions:wipe_older_than_hour"
end
