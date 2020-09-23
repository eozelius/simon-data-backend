# Ethan Ozelius SimonDatat Coding Challenge
Rails JSON API for Email Campaigns using SendGrid.  This App is a DB backed API for User and EmailCampaign resources.  EmailCampaigns and Users have a **Many to Many** DB relationship.

## Quick start
```bash
create db
rails db:create

migrate db
rails db:migrate

seed db
rails db:seed

start server
rails s


PRODUCTION
- Ensure that Sendgrid and Postgres setup have been completed.
bundle exec RAILS_ENV=production rails s
```

## JSON API
In an effort to make this application as lean as possible all Frontend utilities have been stripped out (webpack, sprockets, views etc.)

## Sendgrid Setup
This app uses API_KEY authentication, as opposed to username/password.  The environment variable `SENDGRID_API_KEY` is required to send emails in production.

## Emails per Environment
Rails uses 3 environments: Test, Develope and Production.  Email sending in each environment varys, in Development and Test the `letter_opener` gem will be used to inspect emails without actually sending them.  In production real emails will be sent using sendgrid.

## Postgres
This Application requires PG v12 to be installed and running.  To create the production database, you will need to create a `simon_data` pg user who has the `CREATEDB` priviledge.

## TODO
- Email Campaign
  - `max_send_per_user` - limit the number of emails that will be sent to a single user.  default: 10.
  - `interval` - send the email campaign on a daily/weekly etc interval
  - Security Authtication - gate email sending with authentication system.
  - Verify another Sendgrid User other than my personal email address.