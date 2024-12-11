/// @description the player chooses to play thehand once seen
// You can write your code in this editor
//assets edited by Gavin Mills
// Inherit the parent event
event_inherited();
if (enabled)
{
	global.game.setPlayBet(real(objPlayBox.text));
	global.game.playerContinue();
}