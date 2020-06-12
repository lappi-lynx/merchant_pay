## Payment System Task

This is a *Payment System Task* for EmerchantPay company.
Merchants has different types of transactions.
Merchants can be imported by csv rake task.
Transactions coming by API in json/xml formats.
App has authentication for API and 2 roles: Admin and Merchant.
Form objects and model validations implemented via `Reform` gem
Units specs written with `Rspec`.
`Rubocop` is used for a good code style.

##Tech info:
* Rails v 6.0.3 using webpack and bootstrap
* Ruby version 2.6.3
* Database PostgreSQL

## Setup
```
rails db:create db:migrate db:seed
bin/bundle rails s
bin/webpack-dev-server
```
To execute rake task for `Merchant` import run:
`bin/bundle exec rake merchants:import:from_csv\['lib/tasks/merchants_for_import.csv'\]`
