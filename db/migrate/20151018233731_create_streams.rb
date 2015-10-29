class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :owner
      t.string :title
      t.string :description
      t.boolean :is_public
      t.datetime :expire_at
      t.string :pin_hash

      t.timestamps null: false
      t.string :public_id

    end
  end
end
