$regfile = "m32def.dat"
$crystal = 1000000
Config Lcdpin = Pin , Db4 = Pind.0 , Db5 = Pind.1 , Db6 = Pind.2_
                  , Db7 = Pind.3 , E = Pind.4 , Rs = Pind.5
Config Lcd = 20 * 4
Config Kbd = Porta
Config Spi = Hard , Interrupt = On , Data Order = Lsb , Master = No , _
        Polarity = High , Phase = 0 , Clockrate = 128
Declare Sub Start_graph
Enable Interrupts
Enable Spi
On Spi Master_send_data
Dim Key As Byte
Spiinit
Call Start_graph
Wait 3
Cls
Disable Spi
Do
Main:
 Key = Getkbd()
 If Key > 15 Then Goto Main
 Cls
 Lcd "Key = " ; Key
 Spiout Key , 1
Loop

End                                                         'end program

Master_send_data:
Disable Interrupts
Cls
Home
Lcd Spdr
Wait 1
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













