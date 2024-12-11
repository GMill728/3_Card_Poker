/// @description Set bets and deal the cards, getting ready to continue or fold.
// William Grant 12/10/24

// Inherit the parent event
event_inherited();

if (enabled)
{
	var anteBet = real(objAnteBox.text);
	var pairPlusBet = real(objPairPlusBox.text);
	
	if (anteBet <= 0 && pairPlusBet <= 0)										//If both are 0
	{
		objBigBox.print("Invalid bet.");
		objBigBox.print("Must be greater than 0.");
	}
	else if (anteBet*2 + pairPlusBet > global.game.getPlayerMoney())			//If more money than can bet and play
	{
		objBigBox.print("You do not have enough money");
		objBigBox.print("to place these bets.");
	}
	else																		//Set bets and deal cards
	{
		global.game.setAnteBet(anteBet);
		global.game.setPairPlusBet(pairPlusBet);
		global.game.dealCards();
	}
}
