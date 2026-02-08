$regfile = "m32def.dat"
$crystal = 1000000
$baud = 1200
Config Lcdpin = Pin , Db4 = Pind.4 , Db5 = Pind.5 , Db6 = Pind.6_
                     , Db7 = Pind.7 , E = Pind.2 , Rs = Pind.3
Config Lcd = 20 * 4
Enable Interrupts
Enable Urxc
On Urxc Lkc_send_data
Dim A As Byte
Wait 5
Cls
Do
Locate 1 , 1
Lcd "In Program..."
Loop


End                                                         'end program



'***************  LCD & Keyboard Controller Send Data   **************
Lkc_send_data:
Disable Interrupts
Cls
Home
Lcd Udr
Wait 1
Enable Interrupts
Return