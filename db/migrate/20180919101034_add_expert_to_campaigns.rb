class AddExpertToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :expert, foreign_key: true
  end
end
