class AddTweetsToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet, :string
  end
end
