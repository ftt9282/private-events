class AddEventCreatorToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_creator, :integer
  end
end
