/// @description on click, the player folds their hand essentially ending play of the turn and forfetting an ammount of money
// You can write your code in this editor
//assets edited by Gavin Mills
// Inherit the parent event
event_inherited();

if (enabled)
{
	global.game.playerFold();
}