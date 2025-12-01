module button_shaper(
    input clk,          // Horloge 50 MHz
    input reset_n,      // Reset (actif bas)
    input button_in,    // Entrée bouton (KEY)
    output reg pulse_out // Sortie : une seule impulsion propre
);

    // Paramètres pour 50 MHz
    // 10ms = 0.01s. 50,000,000 * 0.01 = 500,000 cycles
    parameter COUNTER_MAX = 500000; 

    reg [18:0] counter;
    reg stable_state;   // L'état stable du bouton
    reg sync_0, sync_1; // Pour éviter la métastabilité

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            counter <= 0;
            stable_state <= 1; // KEY sont à 1 au repos
            pulse_out <= 0;
            sync_0 <= 1;
            sync_1 <= 1;
        end else begin
            // 1. Synchronisation du signal (double étage de bascules)
            sync_0 <= button_in;
            sync_1 <= sync_0;

            // 2. Logique de Debounce
            if (stable_state != sync_1) begin
                counter <= counter + 1;
                if (counter >= COUNTER_MAX) begin
                    stable_state <= sync_1; // Changement validé
                    counter <= 0;
                    
                    // 3. Génération du Pulse (seulement si on passe de 1 à 0 car bouton actif bas)
                    if (sync_1 == 0) pulse_out <= 1; 
                end
                else begin
                    pulse_out <= 0;
                end
            end else begin
                counter <= 0;
                pulse_out <= 0;
            end
        end
    end
endmodule