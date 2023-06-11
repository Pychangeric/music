class CreatePayment < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.string :card_name
      t.string :countryg
      t.integer :card_number
      t.references :user, foreign_key: true
      t.timestamps

    end
  end
end
