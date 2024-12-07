class CreateEmailFormats < ActiveRecord::Migration[7.1]
  def change
    create_table :email_formats do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
