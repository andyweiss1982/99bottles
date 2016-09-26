class Bottles

  def song
    verses(99, 0)
  end

  def verses(first_verse_bottles, last_verse_bottles)
    first_verse_bottles.downto(last_verse_bottles).each_with_object([]) do |number_of_bottles, verses|
      verses << verse(number_of_bottles)
    end.join("\n")
  end

  def verse(number_of_bottles)
    @number_of_bottles = number_of_bottles
    @lyrics = ""
    declare(@number_of_bottles)
    change(@number_of_bottles)
    reassess(@number_of_bottles)
    return @lyrics
  end

  private

  def declare(number_of_bottles)
    @lyrics << declaration(@number_of_bottles, verbose: true)
  end

  def change(number_of_bottles)
    @lyrics << action(number_of_bottles)
    if action(number_of_bottles).include?("pass it around")
      @number_of_bottles -= 1
    elsif action(number_of_bottles).include?("buy some more")
      @number_of_bottles = 99
    end
  end

  def reassess(number_of_bottles)
    @lyrics << declaration(number_of_bottles, verbose: false)
  end

  def declaration(number_of_bottles, verbose:)
    if verbose
      "#{remaining(number_of_bottles)} of beer on the wall, #{remaining(number_of_bottles)} of beer.\n".capitalize
    else
      "#{remaining(number_of_bottles)} of beer on the wall.\n"
    end
  end

  def action(number_of_bottles)
    case number_of_bottles
    when 2..99
      "Take one down and pass it around, "
    when 1
      "Take it down and pass it around, "
    when 0
      "Go to the store and buy some more, "
    end
  end

  def remaining(number_of_bottles)
    case number_of_bottles
    when 2..99
      "#{number_of_bottles} bottles"
    when 1
      "#{number_of_bottles} bottle"
    when 0
      "no more bottles"
    end
  end

end