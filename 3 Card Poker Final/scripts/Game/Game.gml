// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function Game() constructor{
	playerMoney = 1000;		//game always starts with 1000
	anteBet = 0; 
	pairPlusBet = 0; 
	playBet = 0; 
	newRound = false;
	isDealerTurn = false;
	
	deck = new Deck();
	deck.shuffle(); 
	
	playerHand = new PokerHand();
	dealerHand = new PokerHand();
	
	#macro timerDelay 3
	gameTimer = new Timer(timerDelay);
	
	
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
		anteBet = 0; 
		pairPlusBet = 0; 
		playBet = 0; 
		newRound = false;
		isDealerTurn = false;
		
		//resets the cards to the card backs while dealing
		objPlayerCard1.image_index = 0;
		objPlayerCard2.image_index = 0;
		objPlayerCard3.image_index = 0;
		
		objDealerCard1.image_index = 0;
		objDealerCard2.image_index = 0;
		objDealerCard3.image_index = 0;
		
		//enable and disable buttons as seen fit
		togglePlays(false);
		toggleBets(true);
		
		objBigBox.print("New Round");
		objBigBox.print("Place your bets.");
	}//end redeal 
	
	
	function getPlayerMoney() {
		return playerMoney; 
	}//end getPlayerMoney
	
	/// @func setPairPlusBet(amount)
	/// @desc Sets the bet for pair plus and subtracts it from the player's money.
	/// @param {Real} amount The amount to change the bet to and subtract from the money.
	// William Grant 12/10/24
	function setPairPlusBet(amount) {
		pairPlusBet = amount;
		playerMoney -= pairPlusBet;
	}//end setPlayerBet
	
	/// @func setAnteBet(amount)
	/// @desc Sets the bet for ante and subtracts it from the player's money.
	/// @param {Real} amount The amount to change the bet to and subtract from the money.
	// William Grant 12/10/24
	function setAnteBet(amount) {
		anteBet = amount;
		playerMoney -= anteBet;
	}//end setPlayerBet
	
	/// @func setPlayBet(amount)
	/// @desc Sets the bet for play and subtracts it from the player's money.
	/// @desc Could be done another way probably, but just done for readability.
	/// @param {Real} amount The amount to change the bet to and subtract from the money.
	// William Grant 12/10/24
	function setPlayBet(amount) {
		playBet = amount;
		playerMoney -= playBet;
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
		
		playerHand.sortByRank();
		dealerHand.sortByRank();
		
		playerCard1 = playerHand.getCard(0);
		playerCard2 = playerHand.getCard(1);
		playerCard3 = playerHand.getCard(2);
		
		objPlayerCard1.image_index = playerCard1.getRank() * 4 + playerCard1.getSuit() + 1;
		objPlayerCard2.image_index = playerCard2.getRank() * 4 + playerCard2.getSuit() + 1;
		objPlayerCard3.image_index = playerCard3.getRank() * 4 + playerCard3.getSuit() + 1;
		
		objBigBox.print("Player antes " + string(anteBet) + " and");
		objBigBox.print("Player bets " + string(pairPlusBet) + " on a pair or higher.");
		toggleBets(false);
		togglePlays(true);
	}
	
	/// @func playerFold()
	/// @desc Handles folding for easy readability. Actually turned out to be more useful.
	// William Grant 12/10/24
	function playerFold()
	{
		playerMoney += pairPlusBet;
		objBigBox.print("Player folds and gets back");
		objBigBox.print(string(pairPlusBet) + " chips from Pair Plus bet.");
		togglePlays(false);
		newRound = true;
		gameTimer.start();
	}
	
	/// @func playerContinue()
	/// @desc Handles pressing the continue button. Mostly for delay.
	// William Grant 12/10/24
	function playerContinue()
	{
		objBigBox.print("Playing for " + string(playBet) + " chips.")
		objBigBox.print("Dealer turn.");
		togglePlays(false);
		isDealerTurn = true;
		gameTimer.start();
	}
	
	/// @func dealerFlip()
	/// @desc Handles flipping cards and leading to calcualteWinnings(). Also checks if losing.
	// William Grant 12/10/24
	function dealerFlip()
	{
		isDealerTurn = false;
		dealerCard1 = dealerHand.getCard(0);
		dealerCard2 = dealerHand.getCard(1);
		dealerCard3 = dealerHand.getCard(2);
		objDealerCard1.image_index = dealerCard1.getRank() * 4 + dealerCard1.getSuit() + 1;
		objDealerCard2.image_index = dealerCard2.getRank() * 4 + dealerCard2.getSuit() + 1;
		objDealerCard3.image_index = dealerCard3.getRank() * 4 + dealerCard3.getSuit() + 1;
		
		playerMoney += calculateWinnings()
		
		if (playerMoney <= 0) {
			objDealer.alarm[0] = game_get_speed(gamespeed_fps);
		}
		
		newRound = true;
		gameTimer.start();
	}
	
	/// @func toggleBets(toggleState)
	/// @desc Toggles all the bet buttons according to boolean
	/// @param {Bool} toggleState true = enabled, false = disabled
	// William Grant 12/10/24
	function toggleBets(toggleState)
	{
		objAnteBox.enabled = toggleState;
		objPairPlusBox.enabled = toggleState;
		objPlayBox.enabled = toggleState;
		objPlay.enabled = toggleState;
	}
	
	/// @func togglePlays(toggleState)
	/// @desc Toggles all the play buttons according to boolean
	/// @param {Bool} toggleState true = enabled, false = disabled
	// William Grant 12/10/24
	function togglePlays(toggleState)
	{
		objContinue.enabled = toggleState;
		objFold.enabled = toggleState;
	}
	
	/// @func gameTimer
	/// @desc Timer for folding, dealer turn, and maybe other stuff.
	// William Grant 12/10/24
	function checkTimer()
	{
		if (gameTimer.isFinished() && newRound)
		{
			redeal();
		}
		else if (gameTimer.isFinished() && isDealerTurn)
		{
			dealerFlip();
		}
		else
		{
			gameTimer.tick();	
		}
	}
	
	function promptPlayAgain() 
	{
		if(show_question("You have run out of chips. Play again?")) 
		{
			playerMoney = 1000;
			redeal();
		} 
		else 
		{
			game_end();
		}//end if
	}
	
	
	togglePlays(false);
	toggleBets(true);
	objBigBox.print("Game Start");
	objBigBox.print("Place your bets.");
	
	
	function calculateWinnings()
	{
		var totalWinnings = 0;
		
		//check if dealer "qualifies"
		var dealerQualifies = (dealerHand.getCard(2).getRank() >= RANK.QUEEN); 
		
		if (dealerQualifies)
		{
			//compare hands, 1 if player wins, -1 if dealer wins
			var result = playerHand.compareHands(dealerHand); 
			
			if (result >= 0) //if player wins or ties
			{
				totalWinnings += anteBet*2 + playBet*2;
				objBigBox.print("Player wins this hand.");
			}
			else
			{
				objBigBox.print("Dealer wins this hand.");
			}
		}
		else //if the dealer does not qualify
		{
			totalWinnings += anteBet*2; //get antebet back
			objBigBox.print("Dealer does not qualify.");
		}
		
		//calculate ante bonus
		var playerRank = playerHand.getHandRank(); 
		
		if (playerRank <= HAND_RANK.STRAIGHT)	//only for straight or better
		{
			var anteBonus = [5, 4, 1];	//5x for Straight flush, 4x Three of a kind, 1x Straight
			totalWinnings += anteBet * anteBonus[playerRank]; 
		}
		
		//calculate pair plus 
		var pairPlusMult = [41, 31, 7, 5, 2, 0]; //multipliers
		totalWinnings += pairPlusBet * pairPlusMult[playerRank];
		
		if (totalWinnings > 0)
		{
			objBigBox.print("Player wins a total of " + string(totalWinnings) + " chips.");
		}
		else
		{
			objBigBox.print("Player doesn't gain any chips.");
		}
		
		return totalWinnings; 
	}
}


//the next section flips cards but I don't know how that works with 3 card poker rules
//pretty sure cards flip at the end and winnings are calculated so there is no hit and bet sections
