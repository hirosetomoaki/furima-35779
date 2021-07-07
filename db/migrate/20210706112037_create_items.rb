class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.string :category,           null: false
      t.string :status,             null: false
      t.string :user,               null: false
      t.timestamps
    end
  end
end
