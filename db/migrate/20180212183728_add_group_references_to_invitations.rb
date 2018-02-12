class AddGroupReferencesToInvitations < ActiveRecord::Migration[5.1]
  def change
    add_reference :invitations, :group, foreign_key: true
  end
end
