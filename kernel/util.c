void memory_copy(char *source, char *dest, int nbytes) {
    int i;
    for (i = 0; i < nbytes; i++) {
        *(dest + i) = *(source + i);
    }
}

/**
 * K&R implementation
 */
void int_to_ascii(int n, char str[]) {
    int i, sign;
    if ((sign = n) < 0) n = -n;
    i = 0;
    do {
        str[i++] = n % 10 + '0';
    } while ((n /= 10) > 0);

    if (sign < 0) str[i++] = '-';
    str[i] = '\0';

    // Implementing Reverse
    char aux_char = 0;
    unsigned int front_index = 0;
    unsigned int back_index = strlen(str) - 1;
    while(front_index < back_index){
        aux_char = str[front_index];
        str[front_index] = str[back_index];
        str[back_index] = aux_char;
        front_index++;
        back_index--;
    }
}