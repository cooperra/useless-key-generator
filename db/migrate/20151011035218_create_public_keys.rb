class CreatePublicKeys < ActiveRecord::Migration
  def change
    create_table :public_keys do |t|
      t.string :key, null: false

      t.timestamps null: false
    end
  end
end
