class CreateBlogPost < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.datetime :posted_at
      t.string :title
      t.text :text
    end
  end
end
