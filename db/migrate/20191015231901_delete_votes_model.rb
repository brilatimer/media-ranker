class DeleteVotesModel < ActiveRecord::Migration[5.2]
  def change
    drop_table :votes_models
  end
end
