.MODEL SMALL

.DATA
WELCOME DB "                            Welcome..","$"
;PASSWORD
MSG1 DB 10,10," Enter Password: ","$" 
MSG2 DB 10,13,"Enter Password Again: ","$"
PASS DB "1234","$"
INVALID DB 10,"Invalid Password","$"

MSG3 DB 10,"Enter operation number : ","$"
WITHDRAW DB 10,13,"1-Withdraw.","$"
WITHDRAW1 DB 10,"Enter Amount in 4 digits: ","$"
WITHDRAW2 DB 10,10,"The Process done correctly","$"
DEPOSITE DB 10,"2-Deposite.","$"
TRANSFER DB 10,"3-Transfer.","$"
CHECK_BALANCE DB 10,"4-Check Balance.","$"
MSG4 DB 10,13,"1- FOR MAIN MENUE",10,"2- FOR EXIT",10,"$"
MSG5 DB 10,"Invalid Amount!","$"

;BACK EXIT
BACK DB 10,10,"1. Back",10,"2. EXIT",10,"$"


;WITHDRAW OPTIONS
WITH1 db 10,10,"1- 2,000 EGP","$"
WITH2 db 10,10,"2- 8,000 EGP","$"
WITH3 db 10,10,"3- 12,000 EGP","$"
WITH4 db 10,10,"4- 18,000 EGP","$"
WITH5 db 10,10,"5- 20,000 EGP","$"
WITH6 db 10,10,"6- 25,000 EGP","$"
WITHAMOUNT DB 10,"Enter required number: ","$"
;BALANCE
TOTALB  db 10,10,"Your Total Balance now is:  50,000 EGP","$"
TOTALB1 db 10,10,"Your Total Balance now is: 48,000 EGP","$"
TOTALB2 db 10,10,"Your Total Balance now is: 42,000 EGP","$"
TOTALB3 db 10,10,"Your Total Balance now is: 38,000 EGP","$"
TOTALB4 db 10,10,"Your Total Balance now is: 32,000 EGP","$"
TOTALB5 db 10,10,"Your Total Balance now is: 30,000 EGP","$"
TOTALB6 db 10,10,"Your Total Balance now is: 25,000 EGP","$"




;TRANSFER
ACC DB 10,"Enter Account Number: ","$"

;DEPOSITE

DEP1 db 10,10,"Your Total Balance now is: 52,000 EGP","$"
DEP2 db 10,10,"Your Total Balance now is: 58,000 EGP","$"
DEP3 db 10,10,"Your Total Balance now is: 62,000 EGP","$"
DEP4 db 10,10,"Your Total Balance now is: 68,000 EGP","$"
DEP5 db 10,10,"Your Total Balance now is: 70,000 EGP","$"
DEP6 db 10,10,"Your Total Balance now is: 75,000 EGP","$"




.CODE
    MAIN PROC FAR
    .STARTUP
    
    MOV DX,OFFSET WELCOME  ;DISPLAY WELCOME
    MOV AH,09H
    INT 21H
    
    MOV DX,OFFSET MSG1      ;DISPLAY ENTER PASSWORD
    MOV AH,09H
    INT 21H
    
    MOV CX,4
    LEA SI,PASS   ;PASSWORD THAT IT KNOWS 
    L1:
    CALL INTER_PASS
    
    LOOP L1
    JMP ENTER_
    IV:
        MOV DX,OFFSET INVALID  ;IF PASSWORD IS INVALID 
        MOV AH,09H
        INT 21H
        JMP AGAIN
    AGAIN:
        MOV DX,OFFSET MSG2   ;TO ENTER PASSWORD AGAIN 
        MOV AH,09H
        INT 21H
        LEA SI,PASS
        MOV CX,4
        L2:
        CALL INTER_PASS
        LOOP L2
    ENTER_:
    
    LEA DX,WITHDRAW
    MOV AH,09H
    INT 21H
    
    
    LEA DX,DEPOSITE
    MOV AH,09H
    INT 21H
    
    LEA DX,TRANSFER
    MOV AH,09H
    INT 21H
    
    LEA DX,CHECK_BALANCE
    MOV AH,09H
    INT 21H
   
    
    LEA DX,MSG3
    MOV AH,09H
    INT 21H
    MOV AH,01H
    INT 21H
    
    CMP AL,31H
    JNE EX1
    CALL WITHDRAW_FUNC
    .EXIT
    EX1:
    
    CMP AL,32H
    JNE EX2
    CALL DEPOSITE_FUNC
    .EXIT
    EX2:
    
    CMP AL,33H
    JNE EX3
    CALL TRANSFER_FUNC

    .EXIT
    EX3:
    
    CMP AL,34H
    JNE EX4
    CALL CHECK_BALANCE_FUNC
    CALL BACK_EXIT
    .EXIT
    EX4:
    
   
 
   
    .EXIT
    MAIN ENDP
;ENTER PASSWORD  
    INTER_PASS PROC NEAR
        MOV AH,01H  ;READ CHAR 
        INT 21H
        
        CMP AL,[SI] ;COMPARE THE ENTERED CHAR AND THE DEFAULT PASSWORD
        JNZ IV      ;TO BE VALID 
        INC SI      ;TO LOOP ON ALL CHARS OF PASSWORD
        RET
    INTER_PASS ENDP
    
    WITHDRAW_FUNC PROC NEAR
    
            MOV AH,09H
            LEA DX,WITH1
            INT 21H
            
            MOV AH,09H
            LEA DX,WITH2
            INT 21H
            
            MOV AH,09H
            LEA DX,WITH3
            INT 21H
            
            MOV AH,09H
            LEA DX,WITH4
            INT 21H
            
            MOV AH,09H
            LEA DX,WITH5
            INT 21H
            
            MOV AH,09H
            LEA DX,WITH6
            INT 21H
            
            
             LEA DX,WITHAMOUNT
             MOV AH,09H
             INT 21H
    
             MOV AH,01H
             INT 21H 
             
              CMP AL,31H
             JE W11
             JNE W111
             W11:
             CALL W1_FUNC
             CALL BACK_EXIT
             
             W111:
       
                
             
             CMP AL,32H
             JE W12
             JNE W222
             W12:
             CALL W2_FUNC
             CALL BACK_EXIT
             W222:
             
          
             
             CMP AL,33H
             JE W13
             JNE W333
             W13:
             CALL W3_FUNC
             CALL BACK_EXIT
             W333:
  
             CMP AL,34H
             JE W14
             JNE W444
             W14:
             CALL W4_FUNC
             CALL BACK_EXIT
             W444:
     
             
             CMP AL,35H
             JE W15
             JNE W555
             W15:
             CALL W5_FUNC
             CALL BACK_EXIT
             W555:
   
             
             CMP AL,36H
             JE W16
             JNE W666
             W16:
             CALL W6_FUNC
             CALL BACK_EXIT
             W666:
       
  
            RET
        
    WITHDRAW_FUNC ENDP
    
    
    
              
       
    DEPOSITE_FUNC PROC NEAR
    
          MOV AH,09H
          LEA DX,WITH1
            INT 21H
            
            MOV AH,09H
            LEA DX,WITH2
            INT 21H
            
            MOV AH,09H
            LEA DX,WITH3
            INT 21H
            
            MOV AH,09H
            LEA DX,WITH4
            INT 21H
            
            MOV AH,09H
            LEA DX,WITH5
            INT 21H
            
            MOV AH,09H
            LEA DX,WITH6
            INT 21H
            
             
             LEA DX,WITHAMOUNT
             MOV AH,09H
             INT 21H
    
             MOV AH,01H
             INT 21H 
             
            
             CMP AL,31H
             JE D11
             JNE D111
             D11:
             CALL D1_FUNC
             CALL BACK_EXIT
             
             D111:
       
                
             
             CMP AL,32H
             JE D12
             JNE D222
             D12:
             CALL D2_FUNC
             CALL BACK_EXIT
             D222:
             
          
             
             CMP AL,33H
             JE D13
             JNE D333
             D13:
             CALL D3_FUNC
             CALL BACK_EXIT
             D333:
  
             CMP AL,34H
             JE D14
             JNE D444
             D14:
             CALL D4_FUNC
             CALL BACK_EXIT
             D444:
     
             
             CMP AL,35H
             JE D15
             JNE D555
             D15:
             CALL D5_FUNC
             CALL BACK_EXIT
             D555:
   
             
             CMP AL,36H
             JE D16
             JNE D666
             D16:
             CALL D6_FUNC
            CALL BACK_EXIT
             D666:

        RET
    DEPOSITE_FUNC ENDP
    
    TRANSFER_FUNC PROC NEAR
       
       LEA DX,ACC
       MOV AH,09H
       INT 21H
       
       MOV CX,6
       ACCC:
       MOV AH,01H
       INT 21H
       
       LOOP ACCC
       
       CALL WITHDRAW_FUNC
       
        RET
    TRANSFER_FUNC ENDP
    
    CHECK_BALANCE_FUNC PROC NEAR
    
            MOV AH,09H
            LEA DX,TOTALB
            INT 21H
        
        RET
    CHECK_BALANCE_FUNC ENDP
    
    
     W_FUNC PROC NEAR
        LEA DX,WITHDRAW2
             MOV AH,09H
             INT 21H
        RET
     W_FUNC ENDP
     
      W1_FUNC PROC NEAR
                CALL CHECK_BALANCE_FUNC
                LEA DX,TOTALB1
                MOV AH,09H
                INT 21H
                CALL W_FUNC
                RET
       W1_FUNC ENDP
       W2_FUNC PROC NEAR
                CALL CHECK_BALANCE_FUNC
                LEA DX,TOTALB2
                MOV AH,09H
                INT 21H
                CALL W_FUNC
                RET
       W2_FUNC ENDP
       W3_FUNC PROC NEAR
                CALL CHECK_BALANCE_FUNC
                LEA DX,TOTALB3
                MOV AH,09H
                INT 21H
                CALL W_FUNC
                RET
        W3_FUNC ENDP
        W4_FUNC PROC NEAR
                CALL CHECK_BALANCE_FUNC
                LEA DX,TOTALB4
                MOV AH,09H
                INT 21H
                CALL W_FUNC
                RET
        W4_FUNC ENDP
        W5_FUNC PROC NEAR
                CALL CHECK_BALANCE_FUNC
                LEA DX,TOTALB5
                MOV AH,09H
                INT 21H
                CALL W_FUNC
                RET
        W5_FUNC ENDP
        W6_FUNC PROC NEAR
                CALL CHECK_BALANCE_FUNC
                LEA DX,TOTALB6
                MOV AH,09H
                INT 21H
                CALL W_FUNC
                RET
       W6_FUNC ENDP
       
       ;DEPOSITE
       
       D1_FUNC PROC NEAR
                CALL CHECK_BALANCE_FUNC
                LEA DX,DEP1
                MOV AH,09H
                INT 21H
                CALL W_FUNC
                RET
       D1_FUNC ENDP
      D2_FUNC PROC NEAR
                CALL CHECK_BALANCE_FUNC
                LEA DX,DEP2
                MOV AH,09H
                INT 21H
                CALL W_FUNC
                RET
       D2_FUNC ENDP
       D3_FUNC PROC NEAR
                CALL CHECK_BALANCE_FUNC
                LEA DX,DEP3
                MOV AH,09H
                INT 21H
                CALL W_FUNC
                RET
  D3_FUNC ENDP
      D4_FUNC PROC NEAR
                CALL CHECK_BALANCE_FUNC
                LEA DX,DEP4
                MOV AH,09H
                INT 21H
                CALL W_FUNC
                RET
       D4_FUNC ENDP
      D5_FUNC PROC NEAR
                CALL CHECK_BALANCE_FUNC
                LEA DX,DEP5
                MOV AH,09H
                INT 21H
                CALL W_FUNC
                RET
                D5_FUNC ENDP
        D6_FUNC PROC NEAR
                CALL CHECK_BALANCE_FUNC
                LEA DX,DEP6
                MOV AH,09H
                INT 21H
                CALL W_FUNC
                RET
         D6_FUNC ENDP
         BACK_EXIT PROC NEAR
         
         LEA DX,BACK
         MOV AH,09H
         INT 21H
  
         MOV AH,01H
         INT 21H
         
         CMP AL,31H
          JE BA
          JNE EX
          BA:
          JMP ENTER_
          EX:
          .EXIT
            RET
         BACK_EXIT ENDP
END MAIN