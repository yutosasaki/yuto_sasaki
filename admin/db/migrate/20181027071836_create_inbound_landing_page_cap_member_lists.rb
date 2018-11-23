class CreateInboundLandingPageCapMemberLists < ActiveRecord::Migration[5.2]
  def up
    create_table :inbound_landing_page_cap_member_lists, id: false do |t|
      t.column :inbound_landing_page_id, :integer, null: false
      t.string :cap_member_id, null: false
    end

    add_index :inbound_landing_page_cap_member_lists,
              %i[inbound_landing_page_id cap_member_id],
              unique: true,
              name: 'index_inbound_landing_page_id_cap_member_id'
  end

  def down
    exit
  end
end
