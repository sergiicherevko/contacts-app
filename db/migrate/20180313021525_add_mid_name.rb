class AddMidName < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :mid_name, :string
  end
end





# • Change your controller such that a user can create a new contact with a middle name.
# • Add a bio attribute. Be careful to choose the right datatype; someone’s bio can be more than a few sentences.
# • Change your controller such that a user can create a new contact with a bio.
# • Change your frontend to be able to create and update a contact with the new middle name and bio attributes.
