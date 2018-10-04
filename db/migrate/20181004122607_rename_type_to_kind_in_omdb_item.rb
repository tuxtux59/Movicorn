class RenameTypeToKindInOmdbItem < ActiveRecord::Migration[5.2]
  def change
    rename_column :omdb_items, :type, :kind
  end
end
