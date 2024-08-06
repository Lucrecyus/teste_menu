// Função para salvar o jogo
function save_game() {
    var _file = file_text_open_write("save.txt");

    // Converter tela_cheia para 0 (false) ou 1 (true)
    var _tela_cheia_int = tela_cheia ? 1 : 0; 
    
    // Escrever os valores como strings
    file_text_write_string(_file, string(volume) + "\n"); // Adiciona uma quebra de linha
    file_text_write_string(_file, string(_tela_cheia_int) + "\n"); // Adiciona uma quebra de linha
    file_text_close(_file);
}

// Função para carregar o jogo
function load_game() {
    if file_exists("save.txt") {
        show_debug_message("Arquivo de salvamento encontrado.");
        var _file = file_text_open_read("save.txt");

        // Lê os valores como strings e converte para os tipos corretos
        volume = real(file_text_read_string(_file));
        tela_cheia = (file_text_read_string(_file) == "1"); // Converte de volta para booleano
        
        file_text_close(_file);
        window_set_fullscreen(tela_cheia);
    } else {
        show_debug_message("Arquivo de salvamento não encontrado.");
        // Se o arquivo não existir, define valores padrão
        volume = 0.5;
        tela_cheia = false;
    }
}
