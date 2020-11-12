# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'bigdecimal'
require 'bigdecimal/util'

if Merchant.count == 0
  puts "start merchants"

  path = File.join(File.dirname(__FILE__), "./seeds/merchants.json")
  records = JSON.parse(File.read(path))
  records['RECORDS'].each do |record|
    Merchant.create(
      id: record['id'], 
      name: record['name'],
      email: record['email'],
      cif: record['cif']
    )
  end
  puts "merchants are seeded"
end

if Shopper.count == 0
  puts "start shoppers"

  path = File.join(File.dirname(__FILE__), "./seeds/shoppers.json")
  records = JSON.parse(File.read(path))
  records['RECORDS'].each do |record|
    Shopper.create(
      id: record['id'], 
      name: record['name'],
      email: record['email'],
      nif: record['nif']
    )
  end
  puts "shoppers are seeded"
end

if Order.count == 0
  puts "start orders"

  path = File.join(File.dirname(__FILE__), "./seeds/orders.json")
  records = JSON.parse(File.read(path))
  records['RECORDS'].each do |record|
    Order.create(
      id: record['id'], 
      merchant_id: record['merchant_id'],
      shopper_id: record['shopper_id'],
      amount: record['amount'].to_f,
      created_at: record['created_at'],
      completed_at: record['completed_at']
    )
  end
  puts "orders are seeded"
end
