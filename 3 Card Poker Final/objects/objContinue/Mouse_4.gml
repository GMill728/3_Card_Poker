/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (enabled)
{
	global.game.setPlayBet(real(objPlayBox.text));
	global.game.playerContinue();
}