#PokerHand takes an array of 5 strings with first character as 1,2,3,4,5 and second character as A,B,C,D,E
#PokerHand includes isFlush, isPair, and isThreeOfAKind methods to determine what type of hand the poker hand is

#PokerHand class is used to encapsulate a poker hand
#It has instance variables numbers and suits
class PokerHand
    #initialize method initializes numbers and suits hashes
    def initialize
        @numbers = Hash.new
        @suits = Hash.new
      end

    #setHand method constructs the hand using instance variable numbers and suits
    def setHand(hand)
        hand.each do |item|
            if(@numbers[item[0]] == nil)
                @numbers[item[0]] = 1
            else
                @numbers[item[0]] = @numbers[item[0]] +1
            end
            if(@suits[item[1]] == nil)
                @suits[item[1]] = 1
            else
                @suits[item[1]] = @suits[item[1]] +1
            end
          end
      end

    #isFlush method returns true if the hand is a flush
    def isFlush
        if(@suits.values.include?(5))
            true
        else
            false
        end
    end
    
    #isPair method returns true if the hand is a pair
    def isPair
        ret = false
        @numbers.values.each do |item|
            if(item >= 2)
                ret = true
            end
        end
        return ret
    end

    #isThreeOfAKind method returns true if the hand is a three of a kind
    def isThreeOfAKind
        ret = false
        @numbers.values.each do |item|
            if(item >= 3)
                ret = true
            end
        end
        return ret
    end

    #printHand method prints the numbers and suits instance variables
    def printHand
        puts "Numbers: ", @numbers
        puts "Suits: " , @suits
    end
end


#testing exampleHand that contains a flush, three of a kind, and pair
exampleHand = ["1A", "2A", "2A", "2A", "5A"]
mypokerHand = PokerHand.new
mypokerHand.setHand(exampleHand)
mypokerHand.printHand
puts "Flush: ", mypokerHand.isFlush
puts "Pair: ", mypokerHand.isPair
puts "Three of a Kind: ", mypokerHand.isThreeOfAKind
