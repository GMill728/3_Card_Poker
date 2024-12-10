// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function Game() constructor{
	playerMoney = 1000;		//game always starts with 1000
	anteBet = 0; 
	pairPlusBet = 0; 
	playBet = 0; 
	
	deck = new Deck();
	deck.shuffle(); 
	
	playerHand = new PokerHand();
	dealerHand = new PokerHand();
	
	
	//there are macros that I didn't add here
	
	//do I need to specify last player card and last dealer card???
	
	//put functions to call dealer specific things here
	
	
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
		
		//enable and disable buttons as seen fit
	}//end redeal 
	
	
	function getPlayerMoney() {
		return playerMoney; 
	}//end getPlayerMoney
	
	function setPlayerBet(amount) {
		playerBet = amount;
		playerMoney -= playerBet;
	}//end setPlayerBet

	function dealCards() 
	{
		playerHand.clear(); 
		dealerHand.clear(); 
		
		//reshuffle if low on cards
		if (deck.cardsLeft() < 6)
		{
			deck.shuffle(); 	
		}
		
		for (var i = 0; i < 3; i++)
		{
			playerHand.addCard(deck.deal()); 
			dealerHand.addCard(deck.deal()); 
		}
		
		
	}



//the next section flips cards but I don't know how that works with 3 card poker rules
//pretty sure cards flip at the end and winnings are calculated so there is no hit and bet sections
