class AddUserRefToInvitation < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :sender_id, :integer
    add_column :invitations, :reciver_id, :integer
  end
end
