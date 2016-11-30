# Checking git health after fresh installation on Mountain Lion
require_relative './spinner'
require_relative './player'
require_relative './game_turn'
require_relative './treasure_trove'

module StudioGame

  class Game

    attr_reader :title
    attr_accessor :total_game_points

    def initialize(title)
      @title = title.capitalize
      @players = []
      @treasure = TreasureTrove::TREASURES
    end

    def add_player(player)
      @players << player
    end

    def show_players
      puts @players
    end

    def play(rounds=5)
      print_treasures
      1.upto(rounds) do |round|

        yield if block_given?

        puts "\n\nSTARTING ROUND #{round}"
        @players.each do |player|
          GameTurn.take_turn(player)
        end
      end
    end

    def show_game_status
      puts "\n\nGAME STATUS\nThere are #{@players.size} players in #{self.title}:"
      show_players
    end

    def print_stats
      strong_players, weak_players = @players.partition {|player| player.strong?}

      puts "\nReport on Player Health"
      puts "\n#{strong_players.size} strong players\n"
      strong_players.each do |player|
        print_name_and_health(player)
      end

      puts "\n#{weak_players.size} weak players\n"
      weak_players.each do |player|
        print_name_and_health(player)
      end
      puts "\n\n"

      puts "\nPoint Totals With a Custom Iterator\n"
      @players.each do |player|
        puts "\n#{player.name}\'s point totals:"
        player.each_found_treasure do |treasure|
          puts "#{treasure.points} total #{treasure.name} points"
        end
      end
    end

    def print_high_scores
      sorted_players = @players.sort
      puts "\n\n"
      puts "Scores in Descending Order"
      sorted_players.each do |player|
        print_name_and_score(player)
      end
    end

    def print_name_and_score(player)
      puts "#{player.name} #{player.score.to_s.rjust(20,'.')}"
    end

    def print_name_and_health(player)
      puts "#{player.name} #{player.health.to_s.rjust(20,'.')}"
    end

    def print_treasures
      puts "There are #{@treasure.size} treasures to be found:"
      @treasure.each do |treasure|
        puts "A #{treasure.name} is worth #{treasure.points} points"
      end
    end

    def total_game_points

      total = 0

      @players.each do |player|
        total += player.points
      end
      return total
    end

    def load_players(csvfile = 'players.csv')
      puts "\ncsvfile = #{csvfile}\n"

      filehandle = File.open(csvfile)
      players = []
      index = 0

      loop do
        currentline = filehandle.gets
        break if currentline == nil
        players[index] = currentline.chomp
        index += 1
      end

      players.each do |player|
        temparray = player.split(',')
        entrant = Player.new(temparray[0].to_s,temparray[1].to_i)
        add_player(entrant)
      end

    end

    def save_high_scores(highfile = 'high_scores.txt')
      target = File.open(highfile, 'w') {|f| f.write(print_high_scores)}
    end
  end
end

