class AddSocialCountToResponseDate < ActiveRecord::Migration
  def change
    add_column :static_tools, :share_count, :integer, default: 0
  end
end
