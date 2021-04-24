class CreateBackendApiStuff < ActiveRecord::Migration[6.1]
  def change

    create_table :teams do |t|
      t.integer :api_id
      t.string :name
      t.string :abbreviation
      t.string :city
      t.string :division
      t.string :conference
      t.string :website

      t.timestamps
    end

    create_table :game_teams do |t|
      t.integer :game_id
      t.integer :team_id
      t.string :home_away

      t.timestamps
    end

    create_table :games do |t|
      t.integer :api_id
      t.datetime :datetime
      t.string :game_type
      t.string :season
      t.string :status

      t.timestamps
    end

    create_table :players do |t|
      t.integer :api_id
      t.string :name
      
      t.timestamps
    end

    create_table :game_players do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :team_id
      t.string :position
      t.integer :jersey_num

      t.timestamps
    end

    create_table :goals do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :team_id
      t.integer :api_id
      t.string :time
      t.string :period
      t.string :video_url
      t.string :video_id

      t.timestamps
    end

    create_table :assists do |t|
      t.integer :goal_id
      t.integer :player_id

      t.timestamps
    end

  end
end
