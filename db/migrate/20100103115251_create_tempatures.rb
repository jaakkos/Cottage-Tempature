class CreateTempatures < ActiveRecord::Migration
  def self.up
    create_table :tempatures do |t|
      t.references :cottage
      t.decimal :temp
      t.timestamps
    end
  end

  def self.down
    drop_table :tempatures
  end
end
