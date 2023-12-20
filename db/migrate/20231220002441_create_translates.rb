class CreateTranslates < ActiveRecord::Migration[6.0]
  def change
    create_table :translates do |t|
      t.string :reader
      t.string :writer
      t.string :format

      t.timestamps
    end
  end
end
