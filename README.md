## Payment System Task

This is a **Payment System Task** for EmerchantPay company.
- **Merchants** has different types of transactions.

- Merchants is imported from `csv` by rake task. **Run**:
`bundle exec rake merchants:import:from_csv\['lib/tasks/merchants_for_import.csv'\]`

- `Device` authentication is used for Web part and **JWT tokens for API**.

- Available roles: `admin` and `merchant`.

- Form objects and model validations implemented via **Reform** gem

- Units specs written with `Rspec`.

**Rubocop** is used for a good code style. Run example: `rubocop app/ spec/`

Cron job for wiping old (> 1 hour) transactions is scheduled by `whenever`.
For manual run use `bundle exec rake transactions:wipe_older_than_hour`

Feature specs written with **Capybara**. Run `bin/bundle exec rspec spec/features`

## Tech info:
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

## API JWT authentication url:
To receive JWT token make `POST /api/authenticate` with `email` and `password`
for example:
```
curl -H "Content-Type: application/json" -X POST -d '{"email":"admin@mail.com","password":"password123"}' http://localhost:3000/api/authenticate
=> {"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1OTI3Njk2ODR9.Q-pjqnOXHRdTLC88g6WS_s_vbocToib7zbtWMUviZ0o"}
```

## Create Transactions (JSON format):
`POST /api/v1/transaction` with params: `:user_id, :customer_phone, :customer_email, :amount, :status`


### TODO:
- Creating Transactions with XML format.
- Transaction types processing:
  `Authorize -> Charge -> Refund`
  `Authorize -> Reversal`
