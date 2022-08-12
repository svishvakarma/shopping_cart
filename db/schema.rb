# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_10_111004) do
  create_table "line_items", force: :cascade do |t|
    t.integer "price"
    t.integer "quantity"
    t.integer "user_id"
    t.integer "product_id"
    t.string "canceled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_line_items_on_product_id"
    t.index ["user_id"], name: "index_line_items_on_user_id"
  end

  create_table "lineitems", force: :cascade do |t|
    t.integer "price"
    t.integer "quantity"
    t.integer "product_id"
    t.integer "user_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_lineitems_on_order_id"
    t.index ["product_id"], name: "index_lineitems_on_product_id"
    t.index ["user_id"], name: "index_lineitems_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total_price", default: 0
    t.integer "total_quantity", default: 0
    t.integer "status"
    t.string "payment_mode"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "discription"
    t.integer "price"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "city"
    t.string "state"
    t.string "address"
    t.string "postal_code"
    t.string "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
