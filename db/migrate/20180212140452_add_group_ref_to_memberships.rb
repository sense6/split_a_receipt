class AddGroupRefToMemberships < ActiveRecord::Migration[5.1]
  def change
    add_reference :memberships, :group, foreign_key: {on_delete: :cascade}
  end
end
