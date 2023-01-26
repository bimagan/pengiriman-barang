 .model small            
.code
org 100h
jmp mulai
    nama    db 0dh, 0ah, 0dh, 0ah,"Nama pengirim  : ", '$'
    no      db 0dh, 0ah,"No. HP     : ", '$'
    alm     db 0dh, 0ah,"Alamat pengirim :", '$'
    nama2    db 0dh, 0ah, 0dh, 0ah,"Nama penerima  : ", '$'
    no2      db 0dh, 0ah,"No. HP penerima     : ", '$' 
    alm2     db 0dh, 0ah,"Alamat penerima :", '$'
        tampung_nama db 30,?,30 dup (?)
        tampung_no db 30,?,30 dup (?)
        tampung_alm db 30,?,30 dup (?)
        tampung_nama2 db 30,?,30 dup (?)
        tampung_no2 db 30,?,30 dup (?)
        tampung_alm2 db 30,?,30 dup (?)
  m1      db 0dh, 0ah,"---- PROGRAM PENGIRIMAN BARANG ----", '$'  
    m2      db 0dh, 0ah,"         ", '$'
    m3      db 0dh, 0ah,"Silakan masukkan data diri anda." , '$' 
    m4      db 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Selamat datang di Jasa pengiriman barang G&J ....", '$' 
    m5      db 0dh, 0ah," "
            db 0dh, 0ah, "Berikut jenis pengiriman yang tersedia : ", 0dh, 0ah      

            db "==========================================================", 0dh, 0ah
            db "|| 1.  reguler         		    7-9 hari Rp.10.000      ||", 0dh, 0ah  
            db "|| 2.  hemat        		    8-13 hari Rp.5.000      ||", 0dh, 0ah 
            db "==========================================================", 0dh, 0ah
            db 0dh, 0ah, "jenis pengiriman nomor berapa yang anda pilih ? ", '$'
    m6      db 0dh, 0ah, 0dh, 0ah, "Proses berhasil, berikut rinciannya :", '$'
    m7      db 0dh, 0ah, "barang akan dikirim pada besok hari ", '$'
    m8      db 0dh, 0ah, 0dh, 0ah,"Apakah anda ingin mengubah jenis pengiriman ?(Y, N)", '$'
    salah   db 0dh, 0ah, "Tidak ada pilihan.", '$'
    jenis1    db 0dh, 0ah, 0dh, 0ah, "reguler        7-9 hari",0dh, 0ah, "Harga          Rp.10.000",0dh, 0ah,0dh, 0ah, "terimakasih telah menggunakan jasa kami." , '$'
    jenis2    db 0dh, 0ah, 0dh, 0ah, "hemat         8-13 hari",0dh, 0ah, "Harga          Rp.5.000",0dh, 0ah,0dh, 0ah, "terimakasih telah menggunakan jasa kami. " , '$'
    

mulai:
    mov ah,09h
    lea dx,m1
    int 21h
        
    mov ah,09h
    lea dx,m2
    int 21h        
        
    mov ah,09h
    lea dx,m3
    int 21h       
                               
    mov ah,09h
    lea dx,nama
    int 21h        

    MOV ah, 0ah
    LEA dx, tampung_nama
    INT 21h
    PUSH dx 
    
    MOV ah, 09
    LEA dx, no
    INT 21h
              
    MOV ah, 0ah
    LEA dx, tampung_no
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, alm
    INT 21h
              
    MOV ah, 0ah
    LEA dx, tampung_alm
    INT 21h
    PUSH dx  
    
    mov ah,09h
    lea dx,nama2
    int 21h        

    MOV ah, 0ah
    LEA dx, tampung_nama2
    INT 21h
    PUSH dx
    
     MOV ah, 09
    LEA dx, no2
    INT 21h
              
    MOV ah, 0ah
    LEA dx, tampung_no2
    INT 21h
    PUSH dx 
    
     MOV ah, 09
    LEA dx, alm2
    INT 21h
              
    MOV ah, 0ah
    LEA dx, tampung_alm2
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, m4
    INT 21h

mulai2:        
    MOV ah, 09
    LEA dx, m5
    INT 21h   
    
Proses1:
    MOV ah, 01
    INT 21h
    
    CMP al, '1'
    JE paket1
    
    CMP al, '2'
    JE paket2
          
    JNE input_salah 
    
Proses2:
    MOV ah, 09
    LEA dx, m8
    INT 21h
    MOV ah, 01
    INT 21h
    
    CMP al, 'Y'
    JE pilih_lagi
    
    CMP al, 'y'
    JE pilih_lagi
    
    CMP al, 'N'
    JE end
    
    CMP al, 'n'
    JE end
    
    JNE input_salah

paket1:
     MOV ah, 09
     LEA dx, m6
     INT 21h
     
     MOV ah, 09
     LEA dx, jenis1
     INT 21h   
     
     JMP Proses2
     
paket2:
     MOV ah, 09
     LEA dx, m6
     INT 21h
     
     MOV ah, 09
     LEA dx, jenis2       
     
     INT 21h   
     
     JMP Proses2

pilih_lagi:
    JMP mulai2

end:
    MOV ah, 09
    LEA dx, m7
    INT 21h
    INT 20h
    JMP Exit

input_salah:
    MOV ah, 09
    LEA dx, salah
    INT 21h
    
    JMP Proses2

JMP Exit
Exit:
RET
