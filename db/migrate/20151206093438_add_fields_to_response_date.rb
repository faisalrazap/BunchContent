class AddFieldsToResponseDate < ActiveRecord::Migration
  def change
    add_column :response_dates, :share_count, :integer, default: 0
    add_column :response_dates, :response_count, :integer, default: 0
    add_column :response_dates, :date, :datetime
  end
end
