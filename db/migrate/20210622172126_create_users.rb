class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string "username"
      t.string "profile_img_url"
      t.string "spotify_id"
      t.string "spotify_url"
      t.string "access_token"
      t.string "refresh_token"
      t.string "email"

      t.timestamps
    end
  end
end
