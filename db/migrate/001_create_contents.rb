class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.column :project_id, :integer
      t.column :user_id, :integer
      t.column :title, :string
      t.column :content, :text
      t.column :last_modified, :timestamp
    end
  end

  def self.down
    drop_table :contents
  end
end
