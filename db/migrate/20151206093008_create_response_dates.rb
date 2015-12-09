class CreateResponseDates < ActiveRecord::Migration
  def change
    create_table :response_dates do |t|
      t.datetime :date
      t.integer :share_count, default: 0
      t.integer :response_count, default: 0
      t.references :dateable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
