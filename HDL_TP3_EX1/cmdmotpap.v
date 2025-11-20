// Module Commande Moteur Pas à Pas
module cmdmotpap(nStep, OnOff, Hold, MotDir, FullnHalf, Phase);
	parameter
		INIT_STEP = 1;

	localparam OFF = 0;
	localparam PAS1 = 1;
	localparam PAS2 = 2;
	localparam PAS3 = 3;
	localparam PAS4 = 4;
	localparam PAS41 = 5;
	localparam PAS24 = 6;
	localparam PAS32 = 7;
	localparam PAS13 = 8;
	
		
	input nStep;
	input OnOff;
	input Hold;
	input MotDir;
	input FullnHalf;
	
	output Phase[0:3];
	reg[0:3] Phase;
	
	
	reg[3:0] EtatPresent = INIT_STEP;
	reg[3:0] EtatFutur;
	
	always @(posedge(nStep))
	begin
		EtatPresent <= EtatFutur;
	end
	
	always @(EtatPresent, OnOff, Hold, MotDir, FullnHalf)
	begin
		case(EtatPresent)
			OFF: 
				if (!OnOff | Hold) EtatFutur <= OFF;
				else EtatFutur <= INIT_STEP;
			PAS1:
				if (!OnOff) EtatFutur <= OFF;
				else if (Hold) EtatFutur <= PAS1;
				else if (OnOff & !Hold & !FullnHalf & MotDir) EtatFutur <= PAS41;
				else if (OnOff & !Hold & !FullnHalf & !MotDir) EtatFutur <= PAS13;
				else if (Hold & OnOff) EtatFutur <= PAS1;
				else if (OnOff & !Hold & FullnHalf & !MotDir) EtatFutur <= PAS3;
				else if (OnOff & !Hold & FullnHalf & MotDir) EtatFutur <= PAS4;
			PAS2:
				if (!OnOff) EtatFutur <= OFF;
				else if (Hold) EtatFutur <= PAS2;
				else if (OnOff & !Hold & !FullnHalf & !MotDir) EtatFutur <= PAS24;
				else if (OnOff & !Hold & !FullnHalf & MotDir) EtatFutur <= PAS32;
				else if (OnOff & !Hold & FullnHalf & MotDir) EtatFutur <= PAS3;
				else if (OnOff & !Hold & FullnHalf & !MotDir) EtatFutur <= PAS4;
			PAS3:
				if (!OnOff) EtatFutur <= OFF;
				else if (Hold) EtatFutur <= PAS3;
				else if (OnOff & !Hold & !FullnHalf & !MotDir) EtatFutur <= PAS32;
				else if (OnOff & !Hold & !FullnHalf & MotDir) EtatFutur <= PAS13;
				else if (OnOff & !Hold & FullnHalf & MotDir) EtatFutur <= PAS1;
				else if (OnOff & !Hold & FullnHalf & !MotDir) EtatFutur <= PAS2;
			PAS4:
				if (!OnOff) EtatFutur <= OFF;
				else if (Hold) EtatFutur <= PAS4;
				else if (OnOff & !Hold & !FullnHalf & !MotDir) EtatFutur <= PAS41;
				else if (OnOff & !Hold & !FullnHalf & MotDir) EtatFutur <= PAS24;
				else if (OnOff & !Hold & FullnHalf & !MotDir) EtatFutur <= PAS1;
				else if (OnOff & !Hold & FullnHalf & MotDir) EtatFutur <= PAS2;
			PAS41:
				if (!OnOff) EtatFutur <= OFF;
				else if (Hold) EtatFutur <= PAS41;
				else if (OnOff & !Hold & !MotDir) EtatFutur <= PAS1;
				else if (OnOff & !Hold & MotDir) EtatFutur <= PAS4;
			PAS24:
				if (!OnOff) EtatFutur <= OFF;
				else if (Hold) EtatFutur <= PAS24;
				else if (OnOff & !Hold & !MotDir) EtatFutur <= PAS4;
				else if (OnOff & !Hold & MotDir) EtatFutur <= PAS2;
			PAS32:
				if (!OnOff) EtatFutur <= OFF;
				else if (Hold) EtatFutur <= PAS32;
				else if (OnOff & !Hold & !MotDir) EtatFutur <= PAS2;
				else if (OnOff & !Hold & MotDir) EtatFutur <= PAS3;
			PAS13:
				if (!OnOff) EtatFutur <= OFF;
				else if (Hold) EtatFutur <= PAS13;
				else if (OnOff & !Hold & !MotDir) EtatFutur <= PAS3;
				else if (OnOff & !Hold & MotDir) EtatFutur <= PAS1;
			default:
				EtatFutur <= OFF;
		endcase
	end

	always @(EtatPresent)
	begin
		case(EtatPresent)
			OFF: Phase <= 4'bZZZZ;
			PAS1: Phase <= 4'b1000;
			PAS2: Phase <= 4'b0100;
			PAS3: Phase <= 4'b0010;
			PAS4: Phase <= 4'b0001;
			PAS41: Phase <= 4'b1001;
			PAS24: Phase <= 4'b0101;
			PAS32: Phase <= 4'b0110;
			PAS13: Phase <= 4'b1010;
			default: Phase <= 4'bzzzz;
		endcase
	end
endmodule
