class CreateMatchups < ActiveRecord::Migration[6.1]
  def change

    create_table :matchups do |t|
      t.integer :owner_id
      t.integer :team_id
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :status

      t.timestamps
    end

    create_table :invitations do |t|
      t.integer :matchup_id
      t.string :code
      t.string :nickname

      t.timestamps
    end

    create_table :user_matchups do |t|
      t.integer :user_id
      t.integer :matchup_id
      t.string :nickname
      t.integer :draft_order

      t.timestamps
    end

    create_table :picks do |t|
      t.integer :user_matchup_id
      t.integer :player_id
    end

  end
end
