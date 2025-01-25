class AddActiveStorageTables < ActiveRecord::Migration[5.1]
  def change
    create_table :active_storage_blobs do |t|
      t.string   :key,        null: false
      t.string   :filename,   null: false
      t.string   :content_type
      t.text     :metadata
      t.bigint   :byte_size,  null: false
      t.string   :checksum,   null: false
      t.datetime :created_at, null: false
    end

    create_table :active_storage_attachments do |t|
      t.string     :name,     null: false
      t.references :record,   null: false, polymorphic: true, index: false
      t.references :blob,     null: false

      t.datetime :created_at, null: false
    end

    add_index :active_storage_blobs, :key, unique: true
    add_index :active_storage_attachments, [:record_type, :record_id, :name, :blob_id], unique: true, name: "index_active_storage_attachments_uniqueness"
  end
end

