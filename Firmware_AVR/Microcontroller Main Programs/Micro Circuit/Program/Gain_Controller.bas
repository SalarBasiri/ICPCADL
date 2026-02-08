$regfile = "m8515.dat"
$crystal = 8000000
Config Spi = Hard , Interrupt = On , Data Order = Lsb , _
      Master = No , Polarity = High , Phase = 0 , Clockrate = 128
Config Pina.0 = Output
Config Pina.1 = Output
Config Pina.2 = Output
Config Pina.3 = Output
Config Pina.4 = Output
Config Pina.5 = Output
Config Pina.6 = Output
Config Pina.7 = Output
Config Pinc.0 = Output
Config Pinc.1 = Output
Config Pinc.2 = Output
Config Pinc.3 = Output
Config Pinc.4 = Output
Config Pinc.5 = Output
Config Pinc.6 = Output
Config Pinc.7 = Output
Config Pind.0 = Output
Config Pind.1 = Output
Config Pind.2 = Output
Config Pind.3 = Output
Config Pind.4 = Output
Config Pind.5 = Output
Config Pind.6 = Output
Config Pind.7 = Output
Dim Gain_ch(9) As Byte
Dim C As Byte , G As Byte
Enable Interrupts
Enable Spi
On Spi Setting_gain
Spiinit
'Porta = 0
'Portc = 0
'Portd = 0
Reset Porta.0
Reset Porta.1
Reset Porta.2
Reset Porta.3
Reset Porta.4
Reset Porta.5
Reset Porta.6
Reset Porta.7
Reset Portc.0
Reset Portc.1
Reset Portc.2
Reset Portc.3
Reset Portc.4
Reset Portc.5
Reset Portc.6
Reset Portc.7
Reset Portd.0
Reset Portd.1
Reset Portd.2
Reset Portd.3
Reset Portd.4
Reset Portd.5
Reset Portd.6
Reset Portd.7
C = 1
Cls
Do


Loop

End                                                         'end program


Setting_gain:
Disable Interrupts
Gain_ch(c) = Spdr
C = C + 1
If C = 9 Then
'Cls
'For G = 1 To 8
'Lcd Gain_ch(g) ; "  "
'Next G
C = 1
Spiinit
If Gain_ch(1) = 0 Then
Reset Porta.0
Reset Porta.1
Reset Porta.2
End If
If Gain_ch(1) = 1 Then
Set Porta.0
Reset Porta.1
Reset Porta.2
End If
If Gain_ch(1) = 2 Then
Reset Porta.0
Set Porta.1
Reset Porta.2
End If
If Gain_ch(1) = 3 Then
Set Porta.0
Set Porta.1
Reset Porta.2
End If
If Gain_ch(1) = 4 Then
Reset Porta.0
Reset Porta.1
Set Porta.2
End If
If Gain_ch(1) = 5 Then
Set Porta.0
Reset Porta.1
Set Porta.2
End If
If Gain_ch(1) = 6 Then
Reset Porta.0
Set Porta.1
Set Porta.2
End If
If Gain_ch(1) = 7 Then
Set Porta.0
Set Porta.1
Set Porta.2
End If
If Gain_ch(2) = 0 Then
Reset Porta.3
Reset Porta.4
Reset Porta.5
End If
If Gain_ch(2) = 1 Then
Set Porta.3
Reset Porta.4
Reset Porta.5
End If
If Gain_ch(2) = 2 Then
Reset Porta.3
Set Porta.4
Reset Porta.5
End If
If Gain_ch(2) = 3 Then
Set Porta.3
Set Porta.4
Reset Porta.5
End If
If Gain_ch(2) = 4 Then
Reset Porta.3
Reset Porta.4
Set Porta.5
End If
If Gain_ch(2) = 5 Then
Set Porta.3
Reset Porta.4
Set Porta.5
End If
If Gain_ch(2) = 6 Then
Reset Porta.3
Set Porta.4
Set Porta.5
End If
If Gain_ch(2) = 7 Then
Set Porta.3
Set Porta.4
Set Porta.5
End If
If Gain_ch(3) = 0 Then
Reset Porta.6
Reset Porta.7
Reset Portc.0
End If
If Gain_ch(3) = 1 Then
Set Porta.6
Reset Porta.7
Reset Portc.0
End If
If Gain_ch(3) = 2 Then
Reset Porta.6
Set Porta.7
Reset Portc.0
End If
If Gain_ch(3) = 3 Then
Set Porta.6
Set Porta.7
Reset Portc.0
End If
If Gain_ch(3) = 4 Then
Reset Porta.6
Reset Porta.7
Set Portc.0
End If
If Gain_ch(3) = 5 Then
Set Porta.6
Reset Porta.7
Set Portc.0
End If
If Gain_ch(3) = 6 Then
Reset Porta.6
Set Porta.7
Set Portc.0
End If
If Gain_ch(3) = 7 Then
Set Porta.6
Set Porta.7
Set Portc.0
End If
If Gain_ch(4) = 0 Then
Reset Portc.1
Reset Portc.2
Reset Portc.3
End If
If Gain_ch(4) = 1 Then
Set Portc.1
Reset Portc.2
Reset Portc.3
End If
If Gain_ch(4) = 2 Then
Reset Portc.1
Set Portc.2
Reset Portc.3
End If
If Gain_ch(4) = 3 Then
Set Portc.1
Set Portc.2
Reset Portc.3
End If
If Gain_ch(4) = 4 Then
Reset Portc.1
Reset Portc.2
Set Portc.3
End If
If Gain_ch(4) = 5 Then
Set Portc.1
Reset Portc.2
Set Portc.3
End If
If Gain_ch(4) = 6 Then
Reset Portc.1
Set Portc.2
Set Portc.3
End If
If Gain_ch(4) = 7 Then
Set Portc.1
Set Portc.2
Set Portc.3
End If
If Gain_ch(5) = 0 Then
Reset Portc.4
Reset Portc.5
Reset Portc.6
End If
If Gain_ch(5) = 1 Then
Set Portc.4
Reset Portc.5
Reset Portc.6
End If
If Gain_ch(5) = 2 Then
Reset Portc.4
Set Portc.5
Reset Portc.6
End If
If Gain_ch(5) = 3 Then
Set Portc.4
Set Portc.5
Reset Portc.6
End If
If Gain_ch(5) = 4 Then
Reset Portc.4
Reset Portc.5
Set Portc.6
End If
If Gain_ch(5) = 5 Then
Set Portc.4
Reset Portc.5
Set Portc.6
End If
If Gain_ch(5) = 6 Then
Reset Portc.4
Set Portc.5
Set Portc.6
End If
If Gain_ch(5) = 7 Then
Set Portc.4
Set Portc.5
Set Portc.6
End If
If Gain_ch(6) = 0 Then
Reset Portc.7
Reset Portd.0
Reset Portd.1
End If
If Gain_ch(6) = 1 Then
Set Portc.7
Reset Portd.0
Reset Portd.1
End If
If Gain_ch(6) = 2 Then
Reset Portc.7
Set Portd.0
Reset Portd.1
End If
If Gain_ch(6) = 3 Then
Set Portc.7
Set Portd.0
Reset Portd.1
End If
If Gain_ch(6) = 4 Then
Reset Portc.7
Reset Portd.0
Set Portd.1
End If
If Gain_ch(6) = 5 Then
Set Portc.7
Reset Portd.0
Set Portd.1
End If
If Gain_ch(6) = 6 Then
Reset Portc.7
Set Portd.0
Set Portd.1
End If
If Gain_ch(6) = 7 Then
Set Portc.7
Set Portd.0
Set Portd.1
End If
If Gain_ch(7) = 0 Then
Reset Portd.2
Reset Portd.3
Reset Portd.4
End If
If Gain_ch(7) = 1 Then
Set Portd.2
Reset Portd.3
Reset Portd.4
End If
If Gain_ch(7) = 2 Then
Reset Portd.2
Set Portd.3
Reset Portd.4
End If
If Gain_ch(7) = 3 Then
Set Portd.2
Set Portd.3
Reset Portd.4
End If
If Gain_ch(7) = 4 Then
Reset Portd.2
Reset Portd.3
Set Portd.4
End If
If Gain_ch(7) = 5 Then
Set Portd.2
Reset Portd.3
Set Portd.4
End If
If Gain_ch(7) = 6 Then
Reset Portd.2
Set Portd.3
Set Portd.4
End If
If Gain_ch(7) = 7 Then
Set Portd.2
Set Portd.3
Set Portd.4
End If
If Gain_ch(8) = 0 Then
Reset Portd.5
Reset Portd.6
Reset Portd.7
End If
If Gain_ch(8) = 1 Then
Set Portd.5
Reset Portd.6
Reset Portd.7
End If
If Gain_ch(8) = 2 Then
Reset Portd.5
Set Portd.6
Reset Portd.7
End If
If Gain_ch(8) = 3 Then
Set Portd.5
Set Portd.6
Reset Portd.7
End If
If Gain_ch(8) = 4 Then
Reset Portd.5
Reset Portd.6
Set Portd.7
End If
If Gain_ch(8) = 5 Then
Set Portd.5
Reset Portd.6
Set Portd.7
End If
If Gain_ch(8) = 6 Then
Reset Portd.5
Set Portd.6
Set Portd.7
End If
If Gain_ch(8) = 7 Then
Set Portd.5
Set Portd.6
Set Portd.7
End If




'Porta = 0
'Portc = 0
'Portd = 0
'G = Gain_ch(1)
'Porta = Porta Or G
'G= Gain_ch(2)
'Shift G , Left , 3
'Porta = Porta Or G
'G= Gain_ch(4)
'Shift G , Left , 1
'Portc = Portc Or G
'G= Gain_ch(5)
'Shift G , Left , 4
'Portc = Portc Or G
'G= Gain_ch(7)
'Shift G , Left , 2
'Portd = Portd Or G
'G= Gain_ch(8)
'Shift G , Left , 5
'Portd = Portd Or G
'G= Gain_ch(3)
'If G < 4 Then
'Shift G , Left , 6
'Porta = Porta Or G
''Else
'Shift G , Left , 6
'Porta = Porta Or G
'Set Portc.0
'End If
'G = Gain_ch(6)
'Shift G , Left , 7
'Portc = Portc Or G
'G= Gain_ch(6)
'Shift G , Right , 1
'Portd = Portd Or G
End If
Enable Interrupts
Return










