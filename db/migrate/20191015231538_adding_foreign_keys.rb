class AddingForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes_models, :media, foreign_key: true
    add_reference :votes_models, :user, foreign_key: true
  end
end
