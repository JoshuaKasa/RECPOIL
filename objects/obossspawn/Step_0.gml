if (boss_health > 0)
{
	if (done == false)
	{
		if (dd == 0)
		{
			var char = string_char_at(name, ind);
			
			boss_text += char;
			dd = ddd;
			ind += 1;
			
			audio_play_sound(sndCharacter, false, false);
		}
		if (dd > 0) then dd -= 1
		if (string_length(boss_text) == string_length(name)) then done = true;
	}
	if (a == 0.05) then audio_play_sound(mscDemiGod, 1, false);
}
