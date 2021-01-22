class CreateChirpTags < ActiveRecord::Migration[6.1]
  def change
    create_table :chirp_tags do |t|
      t.integer :chirp_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
