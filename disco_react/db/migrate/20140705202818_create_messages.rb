class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :head
      t.text :body
      t.string :author
      t.string :email
    end
  end
end
