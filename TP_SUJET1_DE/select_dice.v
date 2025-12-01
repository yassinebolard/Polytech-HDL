module select_dice(Clk, Reset_n, inc, dec, dice);
    parameter[2:0] DEFAULT_DICE = 3'd0;

    input Clk;
    input Reset_n;      // Toujours utile pour remettre à zéro
    input inc;   // Doit venir du module 'Debounce/Pulse'
    input dec;   // Doit venir du module 'Debounce/Pulse'
    
    output[0:2] dice;
    
    reg[2:0] current_dice;
    
    // Tout se passe sur le front montant de l'horloge principale
    always @(posedge Clk or negedge Reset_n)
    begin
        if (!Reset_n) 
            current_dice <= DEFAULT_DICE;
        else begin
            // On incrémente seulement si le signal 'enable' est à 1
            if (inc) 
                current_dice <= (current_dice + 1); // Le modulo 8 est automatique sur 3 bits
            else if (dec) 
                current_dice <= (current_dice - 1);
        end
    end
    
    assign dice = current_dice;

endmodule
