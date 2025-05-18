void kernel_main(void) {
    const char* message = "KarpuzOS'e hosgeldiniz! 🍉\n";
    char* video_memory = (char*) 0xB8000;

    for (int i = 0; message[i] != '\0'; ++i) {
        video_memory[i * 2] = message[i];
        video_memory[i * 2 + 1] = 0x0F; // Beyaz yazı
    }

    while (1); // Sonsuz döngü
}
