class AddUserTypeToMembership < ActiveRecord::Migration[5.1]
  def change
    add_column :memberships, :member_type, :integer, default: 0
  end
end
