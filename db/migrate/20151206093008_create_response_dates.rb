class CreateResponseDates < ActiveRecord::Migration
  def change
    create_table :response_dates do |t|
      t.references :dateable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
