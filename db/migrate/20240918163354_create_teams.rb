class CreateTeams < ActiveRecord::Migration[7.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :location
      t.text :desc
      t.decimal :fee, :precision => 8, :scale => 2
      t.text :age_ranges, array: true, default: []
      t.string :payment_frequency
      t.date :start_date
      t.boolean :active

      t.timestamps
    end
  end
end
