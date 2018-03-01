class CreateDatas < ActiveRecord::Migration[5.1]
  def change
    create_table :datas do |t|
      t.string :name
    end
  end
end
