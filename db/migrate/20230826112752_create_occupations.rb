class CreateOccupations < ActiveRecord::Migration[6.1]
  def change
    create_table :occupations do |t|
      t.string :occupation_name

      t.timestamps
    end
  end
end
