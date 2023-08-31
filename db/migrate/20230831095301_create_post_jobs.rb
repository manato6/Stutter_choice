class CreatePostJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :post_jobs do |t|
      

      t.timestamps
    end
  end
end
