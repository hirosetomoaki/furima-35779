class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.string :category,           null: false
      t.string :status,             null: false
      t.string :charge,             null: false
      t.string :shipmentsource,     null: false
      t.string :shippingdate,       null: false
      t.timestamps
    end
  end
end
