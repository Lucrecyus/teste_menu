
//Obter o input do player
var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);

//Mouse: Rolagem para simular movimento no menu
var _mouse_wheel = mouse_wheel_down() - mouse_wheel_up(); 

//Unifica movimento (teclado + mouse)
var _move = _down - _up + _mouse_wheel;

//Navegação no menu

if (_move != 0 && !mostrar_popup_sair) {
    index += _move;
    var _size = array_length(menu); 
    if (no_sub_menu) {
        index = index mod _size; 
    } else {
        index = clamp(index, 0, 2); // Limita o índice entre 0 e 2
		audio_options = false
		show_debug_message("volume desabilitado")
    }
}

//Seleção (clique do mouse ou Enter)

if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_enter)) {
	if (mostrar_popup_sair) { // Lógica do Popup
        if (popup_index == 0) { // Sim
            game_end();
        } else { // Não
			audio_play_sound(snd_select,0, false, volume)
            mostrar_popup_sair = false;
			
		}
        } else if (no_sub_menu) {
        switch(index) {
            case 0: // Iniciar o jogo
				audio_play_sound(snd_select,0, false, volume)
                room_goto(rm_gameplay);
                break;
            case 1: // Configurações (abre o submenu)
				audio_play_sound(snd_select,0, false, volume)
                no_sub_menu = false;
                index = 0; // Reinicia o índice para o submenu
                break;
            case 2: // Sair do jogo
				
				audio_play_sound(snd_select,0, false, volume)
				mostrar_popup_sair = true;
                popup_index = 0; // Inicia com "Sim" selecionado
                
                break;
        }
    } else { // Lógica do Submenu
        switch(index) {
            case 0: //Volume
				if !audio_options{
				audio_options = true
				show_debug_message("volume_habilitado")
				audio_play_sound(snd_select,0, false, volume)
				}
				break;
				
            case 1: // Tela Cheia
				audio_play_sound(snd_select,0, false, volume)
				sub_menu[1] = "Tela Cheia: Sim"
                window_set_fullscreen(!window_get_fullscreen());
				if !window_get_fullscreen(){
				sub_menu[1] = "Tela Cheia: Não"
				
				}
                break;
				
            case 2: // Voltar
				audio_play_sound(snd_select,0, false, volume)
                no_sub_menu = true;
				save_game();
                index = 1; // Volta para o menu principal
                break;
        }
		
    }
}
if audio_options{
	sub_menu[0] = "Volume(num+/num- ou mouse-right/mouse-left): "+ string(round(volume * 100)) + "%"


	if (keyboard_check_pressed(vk_add) || mouse_check_button_pressed(mb_right)) {
	
		volume += 0.1;
	    if (volume > 1) volume = 1; 
	    audio_master_gain(volume); 
		show_debug_message(volume)
	}

	if (keyboard_check_pressed(vk_subtract) || mouse_check_button_pressed(mb_left)) {
	
	    volume -= 0.1;
	    if (volume < 0) volume = 0; 
	    audio_master_gain(volume);
		show_debug_message(volume)
	}
	
}

if (mostrar_popup_sair) {
    if (keyboard_check_pressed(vk_left)) {
        popup_index = 0; // Seleciona "Sim"
	
	}else if (keyboard_check_pressed(vk_right)) {
        popup_index = 1; // Seleciona "Não"
    }
	if _move != 0{
		popup_index += _move
	}else{
        popup_index = clamp(popup_index, 0, 1)
	}
}
