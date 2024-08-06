var _select = keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left);


if _select{
	
	switch(index){
		case 0:
			audio_play_sound(snd_select,0, false)
			//Retornar ao menu
			room_goto(rm_menu)
	}

}