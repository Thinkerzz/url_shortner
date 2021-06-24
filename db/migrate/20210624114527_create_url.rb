class CreateUrl < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string  :long_url
      t.string  :short_url
      t.string  :ip_address, default: ''
      t.integer :visit_count, default: 0

      t.timestamps
    end
  end
end
