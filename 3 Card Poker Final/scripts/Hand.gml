/// @file Structure for representing, storing, and handling operations on a Hand for a Card Game
/// @author Griffin Nye
/// Date Created: 5/29/24
/// Date Modified: 11/2/24
/// Dependencies: Struct.Card

//Constructor:
/// @file Hand()
/// @desc Creates an empty hand of playing cards.
/// @return {Struct.Hand} New instance of Hand struct.
function Hand() constructor {
    hand = array_create(0);
    
	/// @func clear()
	/// @desc Removes all Cards from the hand.
	/// @return {undefined}
	function clear() {
		array_delete(hand, 0, array_length(hand) );  //Reset the hand to empty
    }//end clear
	
	/// @func addCard(c)
	/// @desc Adds the specified Card to the hand.
	/// @param {Struct.Card} c The Card to be added
	/// @return {undefined}
	function addCard(c) {
    	//Add one more slot to hand list
		array_push(hand, c);
    }//end addCard

	/// @func removeCard(c)
	/// @desc Removes the specified Card from the hand, if present.
	/// @param {Struct.Card} c The Card to be removed
	/// @return {undefined}
	function removeCard(c) {
    	//Find index containing said card
        var idx = array_get_index(hand, c);
        removeIdx(idx);
    }//end removeCard

	/// @func removeIdx(pos)
	/// @desc Removes a Card from the specified position from the hand
	/// @param {real} pos The position of the Card to be removed. Position is 0-indexed.
	/// @return {undefined}
	function removeIdx(pos) {
        array_delete(hand, pos, 1);
    }//end removeIdx

	/// @func getCardCount()
	/// @desc Returns the number of Cards in the hand.
	/// @return {real} The number of Cards in the hand.
	function getCardCount() {
        return array_length(hand);
    }//end getCardCount

	/// @func getCard(pos)
	/// @desc Gets the Card at the specified position in the hand. The Card is not removed from the hand.
	/// @param {real} pos The position of the Card to be retrieved. Position is 0-indexed.
	/// @return Card - The Card at the specified position
	function getCard(pos) {
        return hand[pos];
    }//end getCard
	
	/// @func getCardPos(c)
	/// @desc Returns the position of the specified Card in the hand and -1 if Card not found.
	/// @param {Struct.Card} C The Card to be searched for.
	/// @return {int} The position of the Card in the hand. -1 if Card not found.
	function getCardPos(c) {
        return array_get_index(hand, c);
    }//end getIndex

	/// @func sortByRank() 
	/// @desc Sorts the Cards in the hand by value of the rank as defined in the Card.RANK enum.
	/// @return {undefined}
	function sortByRank() {
		//Here we use a Priority Queue to sort the cards.
		//A Priority Queue operates the same as a Queue, except elements are inserted with a priority value
		//The Priority Queue then orders the contents automatically based on this priority value
		//If we use the Card's Rank as the priority value, then our Priority Queue will sort our cards by Rank!
		
        var pq = ds_priority_create(); //Create a Priority Queue

		//For each Card in the hand, retrieve it, calculate its priority, and insert it into pq
        for (var i = 0; i < array_length(hand); i++) {
			var currCard = hand[i];                     //Get current Card
			var priority = currCard.getRank();          //Calculate priority (rank)
            ds_priority_add(pq, currCard, priority);    //Insert currCard into pq with priority value determined above
        }//end for
		
		//After the above for loop, now pq contains the Cards in the hand sorted by Rank!
		//So all we have to do is remove them and copy them back into the Hand!
		
        clear(); //Clear the hand

		//Remove each Card from pq and copy it into hand
        while (ds_priority_size(pq) > 0) {
			var currCard = ds_priority_delete_min(pq); //Retrieve minimum priority Card from pq
            array_push(hand, currCard);                //Add currCard to hand
        }//end while

        ds_priority_destroy(pq); //Destroy the priority queue since we no longer need it
    }//end sortByRank

	/// @func sortBySuit() 
	/// @desc Sorts the Cards in the hand by value of the Suit as defined in the Card.SUIT enum.
	/// @return {undefined}
	function sortBySuit() {
		//Here we use a Priority Queue to sort the cards.
		//A Priority Queue operates the same as a Queue, except elements are inserted with a priority value
		//The Priority Queue then orders the contents automatically based on this priority value
		//If we use the Card's Suit as the priority value, then our Priority Queue will sort our cards by Suit!
		
        var pq = ds_priority_create(); //Create a Priority Queue

		//For each Card in the hand, retrieve it, calculate its priority, and insert it into pq
        for (var i = 0; i < array_length(hand); i++) {
			var currCard = hand[i];                     //Get current Card
			var priority = currCard.getSuit();          //Calculate priority (suit)
            ds_priority_add(pq, currCard, priority);    //Insert currCard into pq with priority value determined above
        }//end for

		//After the above for loop, now pq contains the Cards in the hand sorted by Suit!
		//So all we have to do is remove them and copy them back into the Hand!
		
        clear(); //Clear the hand

		//Remove each Card from pq and copy it into hand
        while (ds_priority_size(pq) > 0) {
			var currCard = ds_priority_delete_min(pq); //Retrieve minimum priority Card from pq
            array_push(hand, currCard);                //Add currCard to hand
        }//end while

        ds_priority_destroy(pq); //Destroy the priority queue since we no longer need it
    }//end sortBySuit
	
	/// @func sortBySuitThenRank
	/// @desc Sorts the Cards in the hand by value of Suit as defined by the Card.SUIT enum. 
	///       Then orders the cards within each suit by their rank as defined in the Card.RANK enum.
	/// @return {undefined}
	function sortBySuitThenRank() {
		//Here we use a Priority Queue to sort the cards.
		//A Priority Queue operates the same as a Queue, except elements are inserted with a priority value
		//The Priority Queue then orders the contents automatically based on this priority value
		//If we use the Card's Suit and Rank as the priority value, and assign a higher priority value to Suit,
		//then our Priority Queue will primarily sort our cards by Suit and then secondary sort our cards by Rank!
		
        var pq = ds_priority_create(); //Create a Priority Queue

		//For each Card in the hand, retrieve it, calculate its priority, and insert it into pq
        for (var i = 0; i < array_length(hand); i++) {
			var currCard = hand[i];                                       //Get current Card
			var priority = currCard.getSuit() * 13 + currCard.getRank();  //Calculate priority (Suit, then Rank)
            ds_priority_add(pq, currCard, priority);                      //Insert currCard into pq with priority value determined above
        }//end for
		
		//After the above for loop, now pq contains the Cards in the hand sorted by Suit and then Rank!
		//So all we have to do is remove them and copy them back into the Hand!

        clear(); //Clear the hand

		//Remove each Card from pq and copy it into hand
        while (ds_priority_size(pq) > 0) {
			var currCard = ds_priority_delete_min(pq); //Retrieve minimum priority Card from pq
            array_push(hand, currCard);                //Add currCard to hand
        }//end while  

        ds_priority_destroy(pq); //Destroy the priority queue since we no longer need it
    }//end sortBySuitThenRank
    
	/// @func sortByRankThenSuit
	/// @desc Sorts the Cards in the hand by rank as defined by the Card.RANK enum.
	///       Then sorts the cards within each rank by their suit as defined by the Card.SUIT enum.
	/// @return {undefined}
	function sortByRankThenSuit() {
		//Here we use a Priority Queue to sort the cards.
		//A Priority Queue operates the same as a Queue, except elements are inserted with a priority value
		//The Priority Queue then orders the contents automatically based on this priority value
		//If we use the Card's Suit and Rank as the priority value, and assign a higher priority value to Rank,
		//then our Priority Queue will primarily sort our cards by Rank and then secondary sort our cards by Suit!
		
        var pq = ds_priority_create(); //Create a Priority Queue

		//For each Card in the hand, retrieve it, calculate its priority, and insert it into pq
        for (var i = 0; i < array_length(hand); i++) {
            var currCard = hand[i];                                       //Get current Card
			var priority = currCard.getRank() * 13 + currCard.getSuit();  //Calculate priority (Rank, then Suit)
            ds_priority_add(pq, currCard, priority);                      //Insert currCard into pq with priority value determined above
        }//end for
		
		//After the above for loop, now pq contains the Cards in the hand sorted by Rank and then Suit!
		//So all we have to do is remove them and copy them back into the Hand!

        clear(); //Clear the hand

		//Remove each Card from pq and copy it into hand
        while (ds_priority_size(pq) > 0) {
			var currCard = ds_priority_delete_min(pq); //Retrieve minimum priority Card from pq
            array_push(hand, currCard);               //Add currCard to hand
        }//end while

        ds_priority_destroy(pq); //Destroy the priority queue since we no longer need it
    }//end sortByRankThenSuit

	/// @func toString()
	/// @desc Returns a string representation of the hand.
	/// @return {string} The string representation of the hand
	function toString() {
        var result = "";

        for (var i = 0; i < array_length(hand); i++) {
			var currCard = hand[i];
            result += currCard.toString() + " ";
        }//end for

        return string_trim(result);
    }//end toString
}//end hand
