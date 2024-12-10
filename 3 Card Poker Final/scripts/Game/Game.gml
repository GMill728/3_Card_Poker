// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Game() constructor{
	Money = 150;
	playerBet = undefined;
	
	deck = new Deck();
	playerHand = new PokerHand();
	dealerHand = new PokerHand();
	
	
	//there are macros that I didn't add here
	
	//do I need to specify last player card and last dealer card???
	
	//put functions to call dealer specific things here
	
	//shuffle deck
	deck.shuffle();
	
	//deal hands
	playerHand.addCard( deck.deal() );
	playerHand.addCard( deck.deal() );
	playerHand.addCard( deck.deal() );
	
	dealerHand.addCard( deck.deal() );
	dealerHand.addCard( deck.deal() );
	dealerHand.addCard( deck.deal() );
	
	//I think here you would call the enabling of the continue and fold buttons
	
	function redeal() {
		//here in black jack he deletes added cards but we don't have to worry about that
		
		//clear the hands
		playerHand.clear();
		dealerHand.clear();
		
		//resets the cards to the card backs while dealing
		objPlayerCard1.image_index = 0;
		objPlayerCard2.image_index = 0;
		objPlayerCard3.image_index = 0;
		
		objDealerCard1.image_index = 0;
		objDealerCard2.image_index = 0;
		objDealerCard3.image_index = 0;
		
		//shuffle deck
		deck.shuffle();
		
		//deal hands
		playerHand.addCard( deck.deal() );
		playerHand.addCard( deck.deal() );
		playerHand.addCard( deck.deal() );
		
		dealerHand.addCard( deck.deal() );
		dealerHand.addCard( deck.deal() );
		dealerHand.addCard( deck.deal() );
		
		//enable and disable buttons as seen fit
	}//end redeal 
	
	
	function getPlayerMoney() {
		return playerMoney; 
	}//end getPlayerMoney
	
	function setPlayerBet(amount) {
		playerBet = amount;
		playerMoney -= playerBet;
}//end setPlayerBet

function flipCards() {
	var playerCard1 = playerHand.getCard(0);
	var playerCard2 = playerHand.getCard(1);
	var dealerCard1 = dealerHand.getCard(0);
	
	//show player hand
	objPlayerCard1.image_index = playerCard1.getRank() * 4 + playerCard1.getSuit() + 1;
	objPlayerCard2.image_index = playerCard2.getRank() * 4 + playerCard2.getSuit() + 1;
	objPlayerCard3.image_index = playerCard2.getRank() * 4 + playerCard2.getSuit() + 1;
	
	//show dealer hand
	objDealerCard1.image_index = dealerCard1.getRank() * 4 + dealerCard1.getSuit() + 1;
	objDealerCard2.image_index = dealerCard1.getRank() * 4 + dealerCard1.getSuit() + 1;
	objDealerCard3.image_index = dealerCard1.getRank() * 4 + dealerCard1.getSuit() + 1;

	//disable buttons
	
	//then enable checks for hand values
}

//the next section flips cards but I don't know how that works with 3 card poker rules
//pretty sure cards flip at the end and winnings are calculated so there is no hit and bet sections
}