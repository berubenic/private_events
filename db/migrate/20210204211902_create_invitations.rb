class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations, id: false do |t|
      t.belongs_to :user
      t.belongs_to :event
    end
  end
end
