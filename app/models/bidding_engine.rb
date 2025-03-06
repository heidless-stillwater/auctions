class BiddingEngine
    def self.bid!(auction, amount, bidder)
      # puts "BiddingEngine: bidder.id: #{bidder.id}"
      new(auction, amount, bidder).bid!
    end

    def initialize(auction, amount, bidder)
      @auction = auction
      @bid = Bid.new(bidder: bidder, auction: @auction, amount: amount)
    end

    def bid!
      # puts "@bid.bidder.id: #{@bid.bidder.id} :: @bid.auction.id: #{@bid.auction.id} :: @bid.amount: #{@bid.amount} :: @bid.user_id: #{@bid.user_id}"
      if @bid.valid? && is_bigger?
        @bid.save
      else 
        @auction.errors.add(:bid, "must be bigger than the last bid on this auction")
      end
    end

    private

    def is_bigger?
      return true unless @auction.bids.last
      @auction.bids.last.amount < @bid.amount
    end

end
