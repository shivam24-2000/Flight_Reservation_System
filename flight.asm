org 100h

.model small 

.stack 100h

.data


menu:    DB 0Dh,0Ah,"1- View flights from Mumbai",0Dh,0Ah
         DB "2- Book a ticket",0Dh,0Ah 
         DB "3- Exit the application",0Dh,0Ah,
         DB "please choose: ", '$'

CrLf     db 13,10,'$'
         
totalbill: DB 0Dh,0Ah,"The total bill is: ",'$'

flight_info:   
         DB 0Dh,0Ah,0Dh,0Ah,"flight name   Destination         Flight number           Timing",0Dh,0Ah
         DB "Indigo         Indore              6E-624            21:35  - 22:45 (1hr 10min)",0Dh,0Ah
         DB "SpiceJet       Chennai             SG-325            22:15 - 00:05+1D (1hr 50min)",0Dh,0Ah
         DB "Vistara        Bangalore           UK-857            21:30 - 23:10 (1hr 40min)",0Dh,0Ah
         DB "GoAir          Delhi               G8-325+G8-238     21:45 - 8:05+1D (10hr 20min)",0Dh,0Ah
         DB "Air_India      Pune                AI-430+AI-538     21:45 - 6:45+1D (9hr)",0Dh,0Ah,'$'


Indigo:
         DB 0Dh,0Ah,"1- Indigo",0Dh,0Ah,
         DB "The ticket           Price",0Dh,0Ah
         DB "Under 6 years old    1000 Rs",0Dh,0Ah 
         DB "Adults               1500 Rs",0Dh,0Ah
         DB "seniors              1250 Rs",0Dh,0Ah,'$'

SpiceJet:
         DB "2- SpiceJet",0Dh,0Ah,
         DB "The ticket           Price",0Dh,0Ah
         DB "Under 6 years old    1100 Rs",0Dh,0Ah 
         DB "Adults               1350 Rs",0Dh,0Ah
         DB "seniors              1150 Rs",0Dh,0Ah,'$'

Vistara:
         DB "3- Vistara",0Dh,0Ah,
         DB "The ticket           Price",0Dh,0Ah
         DB "Under 6 years old    1050 Rs",0Dh,0Ah 
         DB "Adults               1500 Rs",0Dh,0Ah
         DB "seniors              1350 Rs",0Dh,0Ah,'$'
GoAir:
         DB "4- GoAir",0Dh,0Ah,
         DB "The ticket           Price",0Dh,0Ah
         DB "Under 6 years old    1100 Rs",0Dh,0Ah 
         DB "Adults               1600 Rs",0Dh,0Ah
         DB "seniors              1350 Rs",0Dh,0Ah,'$'
Air_India:
         DB "5- Air_India",0Dh,0Ah,
         DB "The ticket           Price",0Dh,0Ah
         DB "Under 6 years old    1150 Rs",0Dh,0Ah 
         DB "Adults               1400 Rs",0Dh,0Ah
         DB "seniors              1350 Rs",0Dh,0Ah,'$'

flight:      DB 0Dh,0Ah,"What flight would you like to go to (1-Indigo , 2-SpiceJet, 3-Vistara, 4-GoAir, 5-Air_India)? ",'$'
ticket:        DB 0Dh,0Ah,"What ticket would you like to buy (1-child , 2-adult , 3-seniors)? ",'$'
ticket_number: DB 0Dh,0Ah,"How many ticket do you want to buy ",'$'

child_Indigo    DD 1000 ; child Price        
adult_Indigo    DD 1500 ; adult Price 
seniors_Indigo  DD 1250 ; seniors Price 

child_SpiceJet    DD 1100 ; child Price        
adult_SpiceJet    DD 1350 ; adult Price  
seniors_SpiceJet  DD 1150 ; seniors Price  

child_Vistara    DD 1050  ; child Price       
adult_Vistara    DD 1500 ; adult Price 
seniors_Vistara  DD 1350 ; seiniors Price 

child_GoAir    DD 1100  ; child Price      
adult_GoAir    DD 1600 ; adult Price 
seniors_GoAir  DD 1450 ; seiniors Price 

child_Air_India    DD 1150  ; child Price       
adult_Air_India    DD 1400 ; adult Price 
seniors_Air_India  DD 1350 ; seiniors Price 

flight_type   DB 0
ticket_type    DB 0
ticket_num     DD 0
ticket_price   DD 0   
result         DD 0
              
.code

begin:
      mov ax,@data
      mov ds,ax
  
start:
; Code to display the menu  
      mov dx, offset menu
      mov ah, 09h
      int 21h
      
;code to choose one choice from the menu
get_choice:
     
      mov ah, 1
      int 21h

      ; first choice
      cmp al, '1'
      je  FIRST_CHOICE
      
      ; second choice
      cmp al, '2'
      je  SECOND_CHOICE
      
       ; third choice
      cmp al, '3'
      je  THIRD_CHOICE
      
    
      jmp get_choice
      
;===== Get a flight_info =====
FIRST_CHOICE:
      ; Code to display the flight_info message
      mov dx, offset flight_info
      mov ah, 9
      int 21h

      mov dx, offset CRLF
      MOV AH,9
      INT 21H  
      
      ; return to menu
      jmp start

;===== book a ticket =====
SECOND_CHOICE:
      ; Code to display the flight type message
      mov dx, offset CRLF
      MOV AH,9
      INT 21H
      mov dx, offset Indigo
      mov ah, 9
      int 21h 
         
      mov dx, offset CRLF
      MOV AH,9
      INT 21H
      
      mov dx, offset SpiceJet
      mov ah, 9
      int 21h
      
        mov dx, offset CRLF
      MOV AH,9
      INT 21H
      
      mov dx, offset Vistara
      mov ah, 9
      int 21h 
      
        mov dx, offset CRLF
      MOV AH,9
      INT 21H
      
      mov dx, offset GoAir
      mov ah, 9
      int 21h 
      
        mov dx, offset CRLF
      MOV AH,9
      INT 21H
      
      mov dx, offset Air_India
      mov ah, 9
      int 21h
      
      mov dx, offset flight
      mov ah, 9
      int 21h
      
      ; Get the flight type 
      MOV AH, 1
      INT 21H
      mov flight_type, al

      ; Code to display the ticket_type message
      mov dx, offset ticket
      mov ah, 9
      int 21h    
	  
      ; Get the ticket type 
      MOV AH, 1
      INT 21H
      mov ticket_type, al
	  
      ; Code to display the ticket_number message
      mov dx, offset ticket_number
      mov ah, 9
      int 21h
	  
      ; Get the ticket number      
      call INDEC
      mov ticket_num, ax

      ; check the flight type
      cmp flight_type, '1'
      je  Indigo_flight
      cmp flight_type, '2'
      je SpiceJet_flight 
      cmp flight_type, '3'
      je Vistara_flight 
      cmp flight_type, '4'
      je GoAir_flight 
      cmp flight_type, '5'
      je Air_India_flight
      jmp SECOND_CHOICE
       
  ; code for the film flight
  Indigo_flight:
      ; child ticket
      cmp ticket_type, '1'
      jne ADULT_ticket_Indigo
	  mov ax, child_Indigo
      mov ticket_price, ax
	  jmp calculate
	  
      ; adult ticket
    ADULT_ticket_Indigo:
      cmp ticket_type, '2'
      jne seniors_ticket_Indigo
	  mov ax, adult_Indigo
      mov ticket_price, ax
      jmp calculate
      
      ; seniors ticket
    seniors_ticket_Indigo:
      cmp ticket_type, '3'
      jne SECOND_CHOICE
	  mov ax, seniors_Indigo
      mov ticket_price, ax
	  jmp calculate 
	  
	  
  SpiceJet_flight:
      ; child ticket
      cmp ticket_type, '1'
      jne ADULT_ticket_SpiceJet
	  mov ax, child_SpiceJet
      mov ticket_price, ax
	  jmp calculate
	  
      ; adult ticket
    ADULT_ticket_SpiceJet:
      cmp ticket_type, '2'
      jne seniors_ticket_SpiceJet
	  mov ax, adult_SpiceJet
      mov ticket_price, ax
      jmp calculate
      
      ; seniors ticket
    seniors_ticket_SpiceJet:
      cmp ticket_type, '3'
      jne SECOND_CHOICE
	  mov ax, seniors_SpiceJet
      mov ticket_price, ax
	  jmp calculate


  ; code for the  flight
  Vistara_flight:
      ; child ticket
      cmp ticket_type, '1'
      jne ADULT_ticket_Vistara
	  mov ax, child_Vistara
      mov ticket_price, ax
      jmp calculate	  
      
      ; adult ticket
    ADULT_ticket_Vistara:
      cmp ticket_type, '2'
      jne seniors_ticket_Vistara
	  mov ax, adult_Vistara
      mov ticket_price, ax
      jmp calculate
      
      ; seniors ticket
    seniors_ticket_Vistara:
      cmp ticket_type, '3'
      jne SECOND_CHOICE
	  mov ax, seniors_Vistara
      mov ticket_price, ax
	  jmp calculate  
	  
	GoAir_flight:
      ; child ticket
      cmp ticket_type, '1'
      jne ADULT_ticket_GoAir
	  mov ax, child_GoAir
      mov ticket_price, ax
      jmp calculate	  
      
      ; adult ticket
    ADULT_ticket_GoAir:
      cmp ticket_type, '2'
      jne seniors_ticket_GoAir
	  mov ax, adult_GoAir
      mov ticket_price, ax
      jmp calculate
      
      ; seniors ticket
    seniors_ticket_GoAir:
      cmp ticket_type, '3'
      jne SECOND_CHOICE
	  mov ax, seniors_GoAir
      mov ticket_price, ax
	  jmp calculate  
	  
	Air_India_flight:
      ; child ticket
      cmp ticket_type, '1'
      jne ADULT_ticket_Air_India
	  mov ax, child_Air_India
      mov ticket_price, ax
      jmp calculate	  
      
      ; adult ticket
    ADULT_ticket_Air_India:
      cmp ticket_type, '2'
      jne seniors_ticket_Air_India
	  mov ax, adult_Air_India
      mov ticket_price, ax
      jmp calculate
      
      ; seniors ticket
    seniors_ticket_Air_India:
      cmp ticket_type, '3'
      jne SECOND_CHOICE
	  mov ax, seniors_Air_India
      mov ticket_price, ax
	  jmp calculate

	  
      ; calculate price
    calculate: 
      mov cx, ticket_num
	  mov ax, ticket_price
      mul cx  ; ticket_num * ticket_price
      mov result, ax
      
      ; Code to display the total bill message
      mov dx, offset CRLF
      MOV AH,9
      INT 21H
      mov dx, offset totalbill
      MOV AH,9
      INT 21H      
      
      mov ax, result
      call OUTDEC
      
      mov dx, offset CRLF
      MOV AH,9
      INT 21H
               
      jmp start
      
THIRD_CHOICE:
      mov ah,4Ch
      int 21h
      
   
      
      INDEC PROC
  

   PUSH BX                        
   PUSH CX                        
   PUSH DX                       

   JMP @READ                      

   @SKIP_BACKSPACE:               
   MOV AH, 2                      
   MOV DL, 20H                    
   INT 21H                        

   @READ:                         
   XOR BX, BX                     
   XOR CX, CX                     
   XOR DX, DX                     

   MOV AH, 1                      
   INT 21H                        

   CMP AL, '-'                  
   JE @MINUS                      

   CMP AL, '+'                    
   JE @PLUS                     

   JMP @SKIP_INPUT               

   @MINUS:                        
   MOV CH, 1                      
   INC CL                        
   JMP @INPUT                     

   @PLUS:                        
   MOV CH, 2                      
   INC CL                        

   @INPUT:                        
     MOV AH, 1                    
     INT 21H                     

     @SKIP_INPUT:                 

     CMP AL, 0DH                  
     JE @END_INPUT               

     CMP AL, 8H                   
     JNE @NOT_BACKSPACE           

     CMP CH, 0                    
     JNE @CHECK_REMOVE_MINUS     

     CMP CL, 0                   
     JE @SKIP_BACKSPACE          
     JMP @MOVE_BACK               

     @CHECK_REMOVE_MINUS:         

     CMP CH, 1                  
     JNE @CHECK_REMOVE_PLUS       

     CMP CL, 1                  
     JE @REMOVE_PLUS_MINUS        

     @CHECK_REMOVE_PLUS:          

     CMP CL, 1                   
     JE @REMOVE_PLUS_MINUS        
     JMP @MOVE_BACK               

     @REMOVE_PLUS_MINUS:        
       MOV AH, 2                
       MOV DL, 20H                
       INT 21H                    

       MOV DL, 8H              
       INT 21H                    

       JMP @READ                 

     @MOVE_BACK:                 

     MOV AX, BX                 
     MOV BX, 10                  
     DIV BX                      

     MOV BX, AX                  

     MOV AH, 2                
     MOV DL, 20H                 
     INT 21H                      

     MOV DL, 8H                   
     INT 21H                      

     XOR DX, DX                  
     DEC CL                       

     JMP @INPUT                 

     @NOT_BACKSPACE:            

     INC CL                     

     CMP AL, 30H                  
     JL @ERROR                   

     CMP AL, 39H                  
     JG @ERROR                

     AND AX, 000FH               

     PUSH AX                      

     MOV AX, 10                  
     MUL BX                   
     MOV BX, AX                  

     POP AX                      

     ADD BX, AX                 
     JS @ERROR                   
   JMP @INPUT                   

   @ERROR:                      

   MOV AH, 2                      
   MOV DL, 7H                    
   INT 21H                     

   XOR CH, CH                   

   @CLEAR:                     
     MOV DL, 8H                
     INT 21H                    

     MOV DL, 20H                  
     INT 21H                     

     MOV DL, 8H                  
     INT 21H                  
   LOOP @CLEAR                    

   JMP @READ                      

   @END_INPUT:                   

   CMP CH, 1                        
   JNE @EXIT                      
   NEG BX                       

   @EXIT:                        

   MOV AX, BX                     

   POP DX                        
   POP CX                         
   POP BX                         

   RET                           
 INDEC ENDP 
 
    OUTDEC PROC
   PUSH BX                       
   PUSH CX                       
   PUSH DX                        

   CMP AX, 0                      
   JGE @START                  

   PUSH AX                        

   MOV AH, 2                 
   MOV DL, '-'                
   INT 21H                      
   POP AX                       
   NEG AX                        

   @START:                       

   XOR CX, CX                   
   MOV BX, 10                  

   @OUTPUT:                     
     XOR DX, DX              
     DIV BX                  
     PUSH DX                  
     INC CX                      
     OR AX, AX                 
   JNE @OUTPUT                 

   MOV AH, 2                 

   @DISPLAY:                  
     POP DX                    
     OR DL, 30H                
     INT 21H                 
   LOOP @DISPLAY              

   POP DX                    
   POP CX                        
   POP BX                    
   RET                        
 OUTDEC ENDP
 
 HLT