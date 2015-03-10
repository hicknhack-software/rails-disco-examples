class CreatePostTitles < ActiveRecord::Migration
  def change
    create_table :post_titles do |t|
      t.string :title
    end
  end
end
