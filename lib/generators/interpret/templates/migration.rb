class InterpretCreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.string :locale
      t.string :key
      t.text   :value
      t.text   :interpolations
      t.boolean :is_proc, :default => false
      t.boolean :protected, :default => false
      t.boolean :stale, :default => false
    end
  end

  def self.down
    drop_table :translations
  end
end

