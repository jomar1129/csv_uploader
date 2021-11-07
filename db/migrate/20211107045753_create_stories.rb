class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.string :name
      t.string :location
      t.string :species
      t.string :gender
      t.string :affiliations
      t.string :weapon
      t.string :vehicle

      t.timestamps
    end
  end
end
