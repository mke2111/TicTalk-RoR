class CreateTalks < ActiveRecord::Migration[6.1]
  def change
    create_table :talks do |t|
      t.integer :author_id
      t.text :content

      t.timestamps
    end
  end
end
