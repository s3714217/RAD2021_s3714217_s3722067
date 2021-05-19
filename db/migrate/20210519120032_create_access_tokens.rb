class CreateAccessTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :access_tokens do |t|
      t.string :email
      t.string :user_id
      t.string :token

      t.timestamps
    end
  end
end
