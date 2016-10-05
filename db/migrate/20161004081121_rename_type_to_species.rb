class RenameTypeToSpecies < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :type, :species
  end
end
