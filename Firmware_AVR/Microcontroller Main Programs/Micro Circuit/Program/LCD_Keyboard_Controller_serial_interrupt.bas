$regfile = "m32def.dat"
$crystal = 1000000
Config Lcdpin = Pin , Db4 = Pind.4 , Db5 = Pind.5 , Db6 = Pind.6_
                        , Db7 = Pind.7 , E = Pind.2 , Rs = Pind.3
Config Lcd = 20 * 4
Config Kbd = Porta
Config Spi = Hard , Interrupt = Off , Data Order = Lsb , Master = Yes , _
        Polarity = High , Phase = 0 , Clockrate = 128
Enable Interrupts
Enable Urxc
On Urxc Mc_send_data
Declare Sub Start_graph
Dim Key As Byte
Dim C As Byte
Spiinit
Call Start_graph
Wait 3
Cls
Do
Main:
 Key = Getkbd()
 If Key > 15 Then Goto Main
 Cls
 Lcd "Key = " ; Key
 For C = 1 To 8
 Spiout Key , 1
 Waitms 100
 Next C
Loop

End                                                         'end program

'***********************  Master Send Data   **********************
Mc_send_data:
Disable Interrupts
Cls
Home
Lcd Udr
Enable Interrupts
Return








'***********************   Start  Graph  **********************
Sub Start_graph
Dim A As Integer
Cls
Deflcdchar 0 , 32 , 15 , 8 , 11 , 10 , 10 , 10 , 10
Deflcdchar 1 , 32 , 31 , 32 , 31 , 32 , 32 , 32 , 32
Deflcdchar 2 , 32 , 30 , 2 , 26 , 10 , 10 , 10 , 10
Deflcdchar 3 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10
Deflcdchar 4 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10
Deflcdchar 5 , 10 , 10 , 10 , 10 , 11 , 8 , 15 , 32
Deflcdchar 6 , 32 , 32 , 32 , 32 , 31 , 32 , 31 , 32
Deflcdchar 7 , 10 , 10 , 10 , 10 , 26 , 2 , 30 , 32
Cls
Lcd Chr(0)
For A = 1 To 18
Lcd Chr(1)
Next A
Lcd Chr(2)
Locate 2 , 1
Lcd Chr(3)
Lcd "   Salar Basiri   "
Lcd Chr(4)
Locate 3 , 1
Lcd Chr(3)
Lcd "      Present     "
Lcd Chr(4)
Locate 4 , 1
Lcd Chr(5)
For A = 1 To 18
Lcd Chr(6)
Next A
Lcd Chr(7)
Cursor Off
End Sub







