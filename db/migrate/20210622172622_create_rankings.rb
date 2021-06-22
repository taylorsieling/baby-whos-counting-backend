class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.float :score
      t.belongs_to :user
      t.belongs_to :song

      t.timestamps
    end
  end
end
