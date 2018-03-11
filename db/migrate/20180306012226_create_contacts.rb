class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :string
      t.string :last_name
      t.string :string
      t.string :number
      t.string :string

      t.timestamps
    end
  end
end
