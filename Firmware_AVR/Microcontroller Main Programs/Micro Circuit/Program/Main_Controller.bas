$regfile = "m32def.dat"
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
Config Pinc.3 = Output
Config Pinb.4 = Output

Enable Interrupts
Enable Timer1
Enable Ovf1
On Ovf1 Ovf1rtn
Spiinit
Dim C As Byte
Dim Send As Byte
Dim A As Byte
Dim D(10) As Byte
Dim Timer_start_value As Word

Timer1 = 63935

Disable Timer1
Reset Portc.7

A = Waitkey()
If A = 100 Then Goto Pc
If A = 200 Then Goto Stand_alone
Pc:

Do
If Pinc.5 = 1 Then If Pinc.4 = 0 Then Gosub Read_from_card
If Pinc.5 = 0 Then If Pinc.4 = 1 Then Gosub Write_to_card
If Pinc.5 = 1 Then If Pinc.4 = 1 Then Gosub Read_from_eeprom
If Pinc.5 = 0 Then If Pinc.4 = 0 Then Gosub Card_disable
Loop

Stand_alone:



End                                                         'end program

'*************************   Sample   ********************
Ovf1rtn:

Disable Interrupts
Timer1 = Timer_start_value
Portd = Portd And &B00000011
Reset Portc.2
Reset Portc.3
Set Portb.4

Send = 4
Portd = Portd Or Send
Set Portc.7

For C = 1 To 5
Bitwait Pinc.6 , Set
If Pinc.5 = 0 Then
If Pinc.4 = 0 Then
Send = 40
Printbin Send
Disable Timer1
Portd = Portd And &B00000011
Reset Portc.2
Reset Portc.3
Reset Portc.7
Reset Portb.4
Goto Pc
End If
End If

Shift Portd , Left , 1
Bitwait Pinc.6 , Reset
Next C

Reset Portc.7

Bitwait Pinc.6 , Set
Reset Portd.7
Set Portc.2
Bitwait Pinc.6 , Reset

Bitwait Pinc.6 , Set
Reset Portc.2
Set Portc.3
Bitwait Pinc.6 , Reset

Bitwait Pinc.6 , Set

Reset Portc.3
Reset Portb.4
Portd = Portd Or &B11111100
Set Portc.2
Set Portc.3

Bitwait Pinc.6 , Reset
Enable Interrupts



Return





'************************   read from card   ********************
Read_from_card:
If Send <> 10 Then
  Send = 10
  Printbin Send
  Enable Interrupts
  Enable Timer1


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

  Select Case D(9)
    Case 1 : Timer_start_value = 63935
    Case 2 : Timer_start_value = 61535
    Case 3 : Timer_start_value = 57535
    Case 4 : Timer_start_value = 45535
    Case 5 : Timer_start_value = 25535
  End Select



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
  Disable Timer1
  Portd = Portd And &B00000011
  Reset Portc.2
  Reset Portc.3
  Reset Portc.7
  Reset Portb.4

End If
Return