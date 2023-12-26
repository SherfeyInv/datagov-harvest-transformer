# frozen_string_literal: true

class CreateTranslates < ActiveRecord::Migration[6.0]
  def change
    create_table :translates do |t|
      t.binary :file
      t.string :reader
      t.string :writer

      t.timestamps
    end
  end
end
