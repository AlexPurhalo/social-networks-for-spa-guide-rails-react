class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string :username, null: false
      t.string :hashed_password
      t.string :email
			t.string :access_token

      t.timestamps
    end
	end

	def down
		drop_table :users
	end
end
