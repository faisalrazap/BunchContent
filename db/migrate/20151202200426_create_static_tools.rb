class CreateStaticTools < ActiveRecord::Migration
  def change
    create_table :static_tools do |t|

      t.timestamps null: false
    end
  end
end
