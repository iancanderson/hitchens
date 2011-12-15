class CreateHitchensPosts < ActiveRecord::Migration
  def change
    create_table :hitchens_posts do |t|
      t.text :body
      t.string :title
      t.datetime :publication_date

      t.timestamps
    end
  end
end
