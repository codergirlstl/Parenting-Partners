class AddRelationshipToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :relationship, :string
  end
end
