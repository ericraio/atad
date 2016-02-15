class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :body
      t.string :subject

      t.timestamps null: false
    end
  end
end
