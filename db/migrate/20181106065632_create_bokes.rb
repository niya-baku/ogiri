class CreateBokes < ActiveRecord::Migration[5.2]
  def change
    create_table :bokes do |t|
      t.string :content
      t.integer :odai_id
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
