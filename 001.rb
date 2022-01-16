if __FILE__ == $0

  puts "Hi its new test"

  puts ("5/2 = #{5/2} reszta #{5%2}")

  def newf(*arg)

    # attr_accessor :a

    # def initialize(a = "Janek")
      # @a = a
    # end


    if arg.respond_to?("each")
      @a = arg.join("-")
    end
  end

  class Newf

    attr_accessor :aa

    def initialize(aa = "Janek")
      @aa = aa
    end

    def separ
      if @aa.nil?
        puts ("pppusta jest")

        elsif @aa.respond_to?("join")
          # @aa = @aa.join("-,")      # ? dlaczego nie widzi metody join, bo widzial 1 string? linia 49
          puts ("to jest join: #{@aa.join(" , - ")}")  # dlaczego nie zmienia separ
        else
          puts ("what")

      end


    end

  end


  b = newf("jola, mola, ola,kola")
  puts ("#{b}")

  b = Newf.new("'koka','loka', 'oka', 'smoka'")
  b.aa = ["koka,loka, oka, smoka"]
  puts ("#{b}")
  puts "aaaaaaaaaaa"
  puts ("#{b.aa}")
  b.separ

  5.digits

end
