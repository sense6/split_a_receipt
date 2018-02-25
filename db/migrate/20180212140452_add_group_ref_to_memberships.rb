class AddGroupRefToMemberships < ActiveRecord::Migration[5.1]
  def change
    add_reference :memberships, :group
  end
end
