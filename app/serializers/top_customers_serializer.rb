class TopCustomersSerializer < ActiveModel::Serializer
  attributes :client, :sales_16, :discounts_16, :net_sales_16, :sales_17, :discounts_17, :net_sales_17
end