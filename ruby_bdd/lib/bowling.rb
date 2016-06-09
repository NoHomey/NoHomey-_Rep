require 'json'
require 'csv'

class Bowling
    attr_reader :score, :strikes, :spares, :done

    def initialize
        @score = 0
        @strikes = 0
        @spares = 0
        @done = false
    end

    def hit(pin_cunt)
        @score += pin_cunt
        check_done
    end

    def strike
        @score += 20
        @strikes += 1
        check_done
    end

    def spare
        @score += 10
        @spares += 1
        check_done
    end

    def reset
        @score = 0
        @strikes = 0
        @spares = 0
        @done = false
    end

    def check_done
        @done = @score >= 120
    end

    def to_hash
        hash = Hash.new
        instance_variables.map do |ivar|
            name = ivar.id2name
            name[0] = ''
            hash[name] = instance_variable_get ivar
        end
        hash
    end

    def to_json
        JSON.pretty_generate to_hash
    end
end
