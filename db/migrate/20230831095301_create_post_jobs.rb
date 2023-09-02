class CreatePostJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :post_jobs do |t|
      t.integer :post_id
      t.integer :job_id

      t.timestamps
    end
  end
end
