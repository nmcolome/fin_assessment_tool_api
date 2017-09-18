# Financial Assessment Tool API
[![Build Status](https://travis-ci.org/nmcolome/fin_assessment_tool_api.svg?branch=master)](https://travis-ci.org/nmcolome/fin_assessment_tool_api)

## Intro
This API serves as the backend for the [Financial Assessment Tool](https://github.com/nmcolome/fin_assessment_tool) project.
It receives monthly financial information (sales, discounts, cogs, operating expenses) by client and product (as csv) an returns summarized information through the endpoints. 

## Setup

Clone the repo in your terminal:
```
git clone https://github.com/nmcolome/fin_assessment_tool_api.git
```
Navigate into the project: `cd fin_assessment_tool_api`

Bundle, create, migrate, and seed your database:
```
bundle install
rake db:create
rake db:migrate
rake db:seed
```
Run `rspec` in your terminal to ensure all tests are passing.

## Endpoints
The following endpoints are available. All endpoints will return the data response as JSON.

### Profit And Loss Statement
`GET /api/v1/profit_and_loss` - returns the total (global) profit and loss statement per month.

It returns an array of objects, each object has: date, sales, discounts, net_sales, cogs gross profit, operating expenses, net profit. Al indicators in US Dollars and rounded to 2 decimal places except for date which is a date data type.

**Terms**
* Sales: gross sales based on price list
* Discounts: either on or off invoice. 
* Net Sales = Sales - Discounts
* Cogs: cost of goods sold. Any expense related to manufacturing, packaging and distributing a product.
* Gross Profit = Net Sales - Cogs
* Operating Expenses: Advertising, promotional expenses, administrative, travel, overheads and taxes. Any other expense related to the business but not directly link to the sales exercise or to the manufacturing process.
* Net Profit = Gross Profit - Operating Expenses

### Dashboard
`GET /api/v1/dashboard` - returns the main indicators of contribution and growth by Client Cluster, Category and Product.

It returns an array of objects, each object has: client cluster name, product name, product category name, current year net sales (2017), previous year net sales (2016), segment contribution and current year discounts (2017). Al indicators in US Dollars and rounded to 2 decimal places except for segment contribution which is a percentage.

`GET /api/v1/dashboard?region=x` - It returns the sames information asGET /api/v1/dashboard?region=x  filtered by a specific region ('x').

**Terms**
* Net Sales = Gross Sales - Discounts
* Segment Contribution = Net Sales of a Cluster-Product-Category / Total (global)Net Sales. It represents how much that Cluster-Product-Category contributes to the total Net Sales of the company.

### Top Customers
`GET /api/v1/top_customers` - returns top 10 customers based on global net sales.

It returns an array of objects, each object has: client name, previous year sales (2016), previous year discounts (2016), previous year net sales (2016), current year sales (2017), current year discounts (2017), current year net sales (2017) in US Dollars and rounded to 2 decimal places.

**Terms**
* Net Sales = Gross Sales - Discounts

## Stack
Rails 5.1.4 and Ruby 2.4.1

## Author
[Natalia Colomé](https://github.com/nmcolome)