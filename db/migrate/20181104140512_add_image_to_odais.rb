class AddImageToOdais < ActiveRecord::Migration[5.2]
  def change
    add_column :odais, :image, :string
  end
end
