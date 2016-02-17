class AddRefCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ref_code, :string
    add_index :users, :ref_code
  end
end
