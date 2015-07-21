class CreateTwiffs < ActiveRecord::Migration
  def change
    create_table :twiffs do |t|
      t.string :tweet
      t.string :gif

      t.timestamps null: false
    end
  end
end
