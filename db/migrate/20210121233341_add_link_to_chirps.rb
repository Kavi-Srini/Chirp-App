class AddLinkToChirps < ActiveRecord::Migration[6.1]
  def change
    add_column :chirps, :link, :string
  end
end
