class ChangeInvitationColumnNameToReceiver < ActiveRecord::Migration[5.1]
  def change
    rename_column :invitations, :reciver_id, :receiver_id
  end
end
