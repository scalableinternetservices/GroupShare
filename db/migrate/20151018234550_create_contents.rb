class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :type
      t.string :metadata
      t.string :expire_at
      t.string :owner
      t.string :title

      t.belongs_to :stream, index: true
      t.timestamps null: false
    end
  end
end
