class CreateUserSessionInfos < ActiveRecord::Migration
  def self.up
    create_table :user_session_infos do |t|
      t.references :site
      t.string :session
      t.string :page_url
      t.integer :timespent
      t.string :ipaddress
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :user_session_infos
  end
end
