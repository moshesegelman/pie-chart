class ChangeGcityToCity < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :gcity, :city
  end
end
