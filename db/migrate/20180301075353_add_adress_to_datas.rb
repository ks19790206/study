class AddAdressToDatas < ActiveRecord::Migration[5.1]
  def change
    add_column :datas, :adress, :string
  end
end
