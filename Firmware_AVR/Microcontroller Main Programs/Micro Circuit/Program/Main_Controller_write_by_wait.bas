$regfile = "m8535.dat"
$crystal = 8000000
$baud = 1200
Config Serialin = Buffered , Size = 5
Config Serialout = Buffered , Size = 5
Config Timer1 = Timer , Prescale = 1
Config Spi = Hard , Interrupt = Off , Data Order = Lsb , Master = Yes_
                 , Polarity = High , Phase = 0 , Clockrate = 128
Config Pina.0 = Input
Config Pina.1 = Input
Config Pina.2 = Input
Config Pina.3 = Input
Config Pina.4 = Input
Config Pina.5 = Input
Config Pina.6 = Input
Config Pina.7 = Input
Config Pinb.0 = Input
Config Pinb.1 = Input
Config Pinb.2 = Input
Config Pinb.3 = Input
Config Pinb.4 = Input
Config Pinb.5 = Input
Config Pinb.6 = Input
Config Pinb.7 = Input
Config Pinc.7 = Output
Config Pinc.6 = Input
Config Pinc.5 = Input
Config Pinc.4 = Input
Config Pind.2 = Output
Config Pind.3 = Output
Config Pind.4 = Output
Config Pind.5 = Output
Config Pind.6 = Output
Config Pind.7 = Output
Config Pinc.2 = Output
Config Pinc.2 = Output
Config Pinb.4 = Output



Enable Interrupts
Enable Ovf1
On Ovf1 Sample
Spiinit
Dim C As Byte
Dim Send As Byte
Dim A As Byte
Dim D(10) As Byte
Mode_selection:
Reset Portb.0
Reset Portb.1
Do
S:
Set Portc.7
A = Waitkey()
If A = 100 Then Goto Pc
If A = 200 Then Goto Stand_alone
Pc:
Reset Portc.7

Do

If Pinc.5 = 1 Then If Pinc.4 = 0 Then Gosub Read_from_card
If Pinc.5 = 0 Then If Pinc.4 = 1 Then Gosub Write_to_card
If Pinc.5 = 1 Then If Pinc.4 = 1 Then Gosub Read_from_eeprom
If Pinc.5 = 0 Then If Pinc.4 = 0 Then Gosub Card_disable



Loop







Stand_alone:
Goto S

Loop


End                                                         'end program

'*************************   Sample   ********************
Sample:



Return





'************************   read from card   ********************
Read_from_card:
If Send <> 10 Then
Send = 10
Printbin Send
End If


Return




'************************   write to card   ********************
Write_to_card:
If Send <> 20 Then
Send = 20
Printbin Send

For C = 1 To 10
Bitwait Pinc.6 , Set
D(c) = Pina
Bitwait Pinc.6 , Reset
Next C

For C = 1 To 8
Spiout D(c) , 1
Waitms 100
Next C


End If



Return



'************************   read from EEPROM   ********************
Read_from_eeprom:
If Send <> 30 Then
Send = 30
Printbin Send
End If



Return


'************************   card disable   ********************
Card_disable:
If Send <> 40 Then
Send = 40
Printbin Send
End If




Return