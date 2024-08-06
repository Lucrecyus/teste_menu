//Alinhar texto
draw_set_halign(fa_center)
draw_set_font(fnt_menu)

//Espaçamento
var _interval = 40

//Desenhar os itens
for (var i = 0; i < array_length(retornar); ++i) {
	
	draw_set_color(c_white)
	if i == index draw_set_color(c_yellow)
	
    draw_text(room_width/2, room_height * .4 + _interval * i, retornar[i])
	
}