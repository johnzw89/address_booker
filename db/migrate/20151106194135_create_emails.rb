class CreateEmails < ActiveRecord::Migration
  def change
    create_table :contact_methods do |t|
    	t.belongs_to :contact
    	t.string :info
    	t.string :info_type
      t.timestamps null: false
    end
  end
end
