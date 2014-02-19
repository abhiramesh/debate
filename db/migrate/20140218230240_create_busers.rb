class CreateBusers < ActiveRecord::Migration
  def change
    create_table :busers do |t|
      t.string :email
      t.timestamps
    end
  end
end
