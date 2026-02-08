$regfile = "m32def.dat"
$crystal = 8000000
$baud = 1200
Config Lcdpin = Pin , Db4 = Pinc.4 , Db5 = Pinc.5 , Db6 = Pinc.6_
                                , Db7 = Pinc.7 , E = Pinc.2 , Rs = Pinc.3
Config Lcd = 20 * 4
Config Kbd = Porta
Config Serialout = Buffered , Size = 5
Config Serialin = Buffered , Size = 5
Config Pind.4 = Output
Config Pind.5 = Output
Config Pind.6 = Output
Config Pind.7 = Output
Enable Interrupts
Declare Sub Start_graph
Dim Key As Byte
Dim C As Byte
Call Start_graph
Wait 5
Start_condition:
Locate 2 , 2
Lcd "Select Mode:    "
Locate 3 , 2
Lcd "1:PC 2:Stand alone"
Main:
Key = Getkbd()
If Key > 15 Then Goto Main
If Key = 0 Then Goto Pc
If Key = 4 Then Goto Stand_alone
'*************************   PC   ***************************
Pc:
C = 100
Printbin C
Locate 2 , 2
Lcd " Connect to PC... "
Locate 3 , 2
Lcd "   Run Program    "
Reset Portd.4
Reset Portd.5
Reset Portd.6
Set Portd.7
Do
C = Waitkey()
If C = 10 Then
Set Portd.4
Reset Portd.5
Reset Portd.6
Reset Portd.7
End If
If C = 20 Then
Reset Portd.4
Set Portd.5
Reset Portd.6
Reset Portd.7
End If
If C = 30 Then
Reset Portd.4
Reset Portd.5
Set Portd.6
Reset Portd.7
End If
If C = 40 Then
Reset Portd.4
Reset Portd.5
Reset Portd.6
Set Portd.7
End If


Loop


Stand_alone:
C = 200
Printbin C
Cls
Lcd "Under Constraction"







End                                                         'end program








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