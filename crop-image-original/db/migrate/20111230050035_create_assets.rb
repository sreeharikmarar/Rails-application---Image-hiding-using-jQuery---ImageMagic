class CreateAssets < ActiveRecord::Migration
  def self.up

    create_table :assets do |t|

      t.string   :name, :limit => 56
      t.string   :content_type, :limit => 56
      t.string   :file_name, :limit => 128
      t.string   :document_file_name, :limit => 128
      t.string   :document_content_type, :limit => 128
      t.integer  :document_file_size

      t.timestamps
    end

  end

  def self.down
    drop_table :assets
  end
end
