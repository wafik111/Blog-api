class CreateJoinTablePostsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :posts_tags, id: false do |t|
      t.bigint :post_id
      t.bigint :tag_id
    end
  end
end
