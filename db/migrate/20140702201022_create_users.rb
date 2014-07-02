class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps
    end
    add_attachment :users, :avatar
  end
end
