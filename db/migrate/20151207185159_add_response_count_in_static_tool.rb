class AddResponseCountInStaticTool < ActiveRecord::Migration
  def change
    add_column :static_tools, :response_count, :integer, default: 0
  end
end
