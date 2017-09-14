require 'csv'

class Seed
  def self.start
    seed = self.new
    seed.destroy_all
    seed.generate_seed
  end

  def destroy_all
    ClientCluster.destroy_all
    Client.destroy_all
    Region.destroy_all
    RegionProduct.destroy_all
    Product.destroy_all
    Sale.destroy_all
    Discount.destroy_all
    CostOfGoodsSold.destroy_all
    OperatingExpense.destroy_all
    Category.destroy_all
  end

  def generate_seed
    generate_client_clusters
  end

  def generate_client_clusters
    puts 'Building client clusters'
    client_clusters = CSV.open './db/csv/client_clusters.csv', headers: true, header_converters: :symbol
    client_clusters.each do |row|
      ClientCluster.create!(name: row[:name])
    end
    generate_regions
  end
  
  def generate_regions
    puts 'Building regions'
    regions = CSV.open './db/csv/regions.csv', headers: true, header_converters: :symbol
    regions.each do |row|
      Region.create!(name: row[:name])
    end
    generate_categories
  end
  
  def generate_categories
    puts 'Building categories'
    categories = CSV.open './db/csv/categories.csv', headers: true, header_converters: :symbol
    categories.each do |row|
      Category.create!(name: row[:name])
    end
    generate_products
  end

  def generate_products
    puts 'Building products'
    products = CSV.open './db/csv/products.csv', headers: true, header_converters: :symbol
    products.each do |row|
      Product.create!(name: row[:name], category_id: row[:category_id] )
    end
    generate_region_products
  end

  def generate_region_products
    puts 'Building region products'
    region_products = CSV.open './db/csv/region_products.csv', headers: true, header_converters: :symbol
    region_products.each do |row|
      RegionProduct.create!(region_id: row[:region_id], product_id: row[:product_id] )
    end
    generate_clients
  end

  def generate_clients
    puts 'Building clients'
    clients = CSV.open './db/csv/clients.csv', headers: true, header_converters: :symbol
    clients.each do |row|
      Client.create!(name: row[:name], region_id: row[:region_id], client_cluster_id: row[:client_cluster_id])
    end
    generate_sales
  end

  def generate_sales
    puts 'Building sales'
    sales = CSV.open './db/csv/sales.csv', headers: true, header_converters: :symbol
    sales.each do |row|
      new_date = format_date(row[:date])
      Sale.create!(client_id: row[:client_id], region_product_id: row[:region_product_id], amount: row[:amount], transaction_date: new_date)
    end
    generate_discounts
  end

  def generate_discounts
    puts 'Building discounts'
    discounts = CSV.open './db/csv/discounts.csv', headers: true, header_converters: :symbol
    discounts.each do |row|
      new_date = format_date(row[:date])
      Discount.create!(account: "11111111", amount: row[:amount], description: "price promotion", sale_id: row[:sale_id], transaction_date: new_date)
    end
    generate_cogs
  end

  def generate_cogs
    puts 'Building cogs'
    cogs = CSV.open './db/csv/cogs.csv', headers: true, header_converters: :symbol
    cogs.each do |row|
      new_date = format_date(row[:date])
      CostOfGoodsSold.create!(account: "22222222", amount: row[:amount], description: "supply chain costs", sale_id: row[:sale_id], transaction_date: new_date)
    end
    generate_expenses
  end

  def generate_expenses
    puts 'Building expenses'
    operating_expenses = CSV.open './db/csv/operating_expenses.csv', headers: true, header_converters: :symbol
    operating_expenses.each do |row|
      new_date = format_date(row[:date])
      OperatingExpense.create!(account: "33333333", amount: row[:amount], description: "administrative", sale_id: row[:sale_id], transaction_date: new_date)
    end
  end

  def format_date(row_date)
    date = row_date.split('/')
    date[0], date[1], date[2] = date[2], date[0], date[1]
    date.join('/')
  end
end

Seed.start





