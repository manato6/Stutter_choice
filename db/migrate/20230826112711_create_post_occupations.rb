class CreatePostOccupations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_occupations do |t|

      t.timestamps
    end
  end
end
