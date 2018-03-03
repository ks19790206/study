class AddTelToDatas < ActiveRecord::Migration[5.1]
  def change
    add_column :datas, :tel, :string
  end
end
