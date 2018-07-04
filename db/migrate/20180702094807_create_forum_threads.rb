class CreateForumThreads < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_threads do |t|
      t.string :subject
      t.integer :user_id

      t.timestamps
    end
  end
end
