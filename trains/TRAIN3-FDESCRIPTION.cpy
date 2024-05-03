   FD  TRAIN3
       RECORDING MODE IS V                                        
       RECORD IS VARYING IN SIZE                                  
       FROM 27 TO 43 DEPENDING ON WS-TRAIN3-LEN.    
   01 TRAIN3-PLANNING.
       03 TRAIN3-TYPE       PIC XXX.
       88 TGV     VALUE 'TGV'.
       88 CORAIL  VALUE 'COR'.
       88 TER     VALUE 'TER'.
       03 STATION-DEPART    PIC X(18).
       03 TRAIN3-TIME.
          05 TRAIN3-TIME-HH  PIC 99.
          05 TRAIN3-TIME-MM  PIC 99.
       03 TRAIN-ARRIVE.
          05 TRAIN3-ARR-HH   PIC 99.
          05 TRAIN3-ARR-MM   PIC 99.		  
       03 TRAIN3-NBRE-HEURES PIC 99.
       03 TRAIN3-NBRE-STOPS  PIC 99.
       03 TRAIN3-HALT-FLAG   PIC X(10).
       03 TRAIN3-HALT-FLAG REDEFINES TRAIN3-HALT-FLAG 
	                         PIC X OCCURS 10 TIMES.
       88 TRAIN3-STOPS-HERE VALUE 'H'.
       88 TRAIN3-SERVICE    VALUE 'S'.
       88 TRAIN3-FRETE      VALUE 'F'.   
       