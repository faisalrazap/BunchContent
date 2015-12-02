class AddFieldsToStaticTool < ActiveRecord::Migration
  def change
    add_column :static_tools, :page_key, :string, limit: 30
    add_index :static_tools, :page_key
  end
end
