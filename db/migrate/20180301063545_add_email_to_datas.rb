class AddEmailToDatas < ActiveRecord::Migration[5.1]
  def change
    add_column :datas, :email, :string
  end
end
