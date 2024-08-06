//Desenhar itens do menu principal
if no_sub_menu && !mostrar_popup_sair{ 
	//Alinhar texto
	draw_set_halign(fa_center)
	draw_set_font(fnt_menu)

	//Espaçamento entre as opções
	var _interval = 45

	//Desenhar os itens
	for (var i = 0; i < array_length(menu); ++i) {
	
		//Mudar cor do texto quando selecionada
		draw_set_color(c_white)
		if i == index draw_set_color(c_yellow)
	
	    draw_text(room_width/2, room_height * .4 + _interval * i, menu[i])
		}
}else{
	//Desenhar itens do submenu
	//Alinhar texto
	if !mostrar_popup_sair{
	draw_set_halign(fa_center)
	draw_set_font(fnt_menu)

	//Espaçamento entre as opções
	var _interval = 45

	//Desenhar os itens
	for (var i = 0; i < array_length(sub_menu); ++i) {

		draw_set_color(c_white)
		if i == index draw_set_color(c_yellow)
	
	    draw_text(room_width/2, room_height * .4 + _interval * i, sub_menu[i])
		}
		}
}
if (mostrar_popup_sair) {
    if (mostrar_popup_sair) {
    draw_set_color(c_white);
    draw_roundrect(room_width/2 - 170, room_height/2 - 75, room_width/2 + 170, room_height/2 + 75, true);

    // Opções do popup com cor condicional
    draw_set_color(popup_index == 0 ? c_yellow : c_white); // Amarelo se selecionado, branco se não
    draw_text(room_width/2 - 50, room_height/2 + 20, "Sim");

    draw_set_color(popup_index == 1 ? c_yellow : c_white);
    draw_text(room_width/2 + 50, room_height/2 + 20, "Não");

    draw_set_color(c_white); // Volta para a cor branca para o texto principal
    draw_text(room_width/2, room_height/2 - 20, "Deseja realmente sair?");
}
}