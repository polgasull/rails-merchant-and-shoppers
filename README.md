# README

This README would normally document whatever steps are necessary to get the
application up and running.

Initialize project

* ``` bundle install ``` 
* ``` rails s ```
* Endpoint /orders

Run Job
* ``` bundle exec rake jobs:work ```
* ``` rails c ```
* ``` Delayed::Job.enqueue(DisburseOrders.new) ```

Run specs:
* ``` rspec . ```

## API Structure

Models:
* Merchants
* Shoppers
* Orders

Controllers: 
* Orders

What is doing this API?

The API will calculate and assign a disbursement amount to each order. 
From there we can know how much we have to pay to each merchant. 
Accounting will only know how much is the Sequra comission. 

Listing all the orders you will have the following information: 

* Merchant ID
* Shopper ID
* Order amount
* Disbursement amount
* Sequra comission

If you call the API /orders endpoint for the first time, you'll see completed orders without disbursement amount and sequra comission. 

After running Delayed Job, if you call the endpoint again, you'll see how is calculated and assigned each disbursement to corresponding order. 

Required gems: 
* ``` gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] ``` 
* ``` gem 'rspec-rails', '~> 4.0', '>= 4.0.1' ``` 
* ``` gem 'factory_bot_rails', '~> 6.1' ``` 
* ``` gem 'faker' ``` 
* ``` gem 'shoulda-matchers', '~> 4.4', '>= 4.4.1' ``` 
* ``` gem 'pry', '~> 0.13.1' ``` 
* ``` gem 'delayed_job_active_record' ``` 

## Author comments: 

First of all I enjoyed a lot the test and learned new things. Now I have more desire than before to continue improving rails code.   

1) I couldn't be as Atomic as I would. I had issues with my terminal and ``` git rebase --i HEAD ```, and I was not able to fix them, my key ``` esc ``` totally ignored and not possible to write ``` :wq! ```

2) I missed frozen_literals on each page and I decided to don't add it at the end for a better commit readibility

3) I wasn't able to tackle the disbursements "weekly" calculations. And I decided to move with another solution playing directly with model Orders as it's explained above. 

**More proud:**

* Seeds from JSON file
* disburse orders with delayed job
* specs

**Less proud:**

* Not being able to achieve 100% what is required
* Job worker specs
* non atomic commits

Many thanks

Kind regards!