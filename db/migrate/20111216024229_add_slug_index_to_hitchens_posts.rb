class AddSlugIndexToHitchensPosts < ActiveRecord::Migration
  def change
    add_index(:hitchens_posts, :slug)
  end
end
