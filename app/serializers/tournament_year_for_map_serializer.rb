class TournamentYearForMapSerializer < ActiveModel::Serializer
  belongs_to :tournament
  belongs_to :champion, class_name: 'Player', :foreign_key => 'champion_id'
  has_many :tournament_year_and_players, serializer: TournamentYearAndPlayerForMapSerializer
  attributes :period, :id
  '''
  def tournament_year_and_players
      object.tournament_year_and_players.eager_load(:player).limit(10)
  end
 '''
  def period
    object.first_day.strftime("%m/%d") + " ~ " + object.last_day.strftime("%m/%d")
  end
end
