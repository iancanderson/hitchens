class AddSlugToHitchensPost < ActiveRecord::Migration
  def change
    add_column :hitchens_posts, :slug, :string
  end
end
