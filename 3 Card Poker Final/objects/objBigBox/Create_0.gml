/// @description Declares and initalizes attributes for objBigBox, a console
// You can write your code in this editor

messageList = array_create(1,"");				//Expandable if desired
currIdx = 0;

/// @func print(msg)
/// @desc Prints desired message to box. Can be expanded for multiple lines, but currently just one line.
/// @param {string} msg The message to be printed
/// @return {undefined}
function print(msg) {
	
	if (currIdx < array_length(messageList) )	//If not full,
	{	
		messageList[currIdx] = msg;				//Put in array
		currIdx++;								//Increment for next slot
	} 
	else 
	{											//Otherwise
		array_shift(messageList);				//Shift messages, deleting oldest
		array_push(messageList, msg);			//Put newest on the end		
	}
	
}

/// @func clear()
/// @desc Clears and resets the console.
/// @return {undefined} 
function clear() {
	currIdx = 0;
}