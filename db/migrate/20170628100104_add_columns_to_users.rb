class AddColumnsToUsers < ActiveRecord::Migration[5.1]
	def up
		add_column :users, :inst_uid, :string
		add_column :users, :inst_avatar, :string
		add_column :users, :inst_username, :string
	end

	def down
		remove_column :users, :inst_uid, :string
		remove_column :users, :inst_avatar, :string
		remove_column :users, :inst_username, :string
	end
end
