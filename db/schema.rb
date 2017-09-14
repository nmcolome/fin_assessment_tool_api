# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170914171538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_clusters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.bigint "client_cluster_id"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_cluster_id"], name: "index_clients_on_client_cluster_id"
    t.index ["region_id"], name: "index_clients_on_region_id"
  end

  create_table "cost_of_goods_solds", force: :cascade do |t|
    t.bigint "sale_id"
    t.string "account"
    t.string "description"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "transaction_date", null: false
    t.index ["sale_id"], name: "index_cost_of_goods_solds_on_sale_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.bigint "sale_id"
    t.string "account"
    t.string "description"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "transaction_date", null: false
    t.index ["sale_id"], name: "index_discounts_on_sale_id"
  end

  create_table "operating_expenses", force: :cascade do |t|
    t.bigint "sale_id"
    t.string "account"
    t.string "description"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "transaction_date", null: false
    t.index ["sale_id"], name: "index_operating_expenses_on_sale_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "region_products", force: :cascade do |t|
    t.bigint "region_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_region_products_on_product_id"
    t.index ["region_id"], name: "index_region_products_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "region_product_id"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "transaction_date", null: false
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["region_product_id"], name: "index_sales_on_region_product_id"
  end

  add_foreign_key "clients", "client_clusters"
  add_foreign_key "clients", "regions"
  add_foreign_key "cost_of_goods_solds", "sales"
  add_foreign_key "discounts", "sales"
  add_foreign_key "operating_expenses", "sales"
  add_foreign_key "products", "categories"
  add_foreign_key "region_products", "products"
  add_foreign_key "region_products", "regions"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "region_products"
end
