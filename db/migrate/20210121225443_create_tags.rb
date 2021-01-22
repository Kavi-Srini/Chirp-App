class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :phrase

      t.timestamps
    end
  end
end
