$regfile = "m32def.dat"
$crystal = 1000000
Config Spi = Hard , Interrupt = On , Data Order = Lsb , Master = Yes , _
        Polarity = High , Phase = 0 , Clockrate = 128
Config Lcdpin = Pin , Db4 = Pind.0 , Db5 = Pind.1 , Db6 = Pind.2_
                  , Db7 = Pind.3 , E = Pind.4 , Rs = Pind.5
Config Lcd = 40 * 2
Enable Interrupts
Enable Spi
On Spi Slave_send_data
Dim A As Byte
Spiinit
Do
Locate 1 , 1
Lcd "In Program..."
Loop


End                                                         'end program

Slave_send_data:
Disable Interrupts
Cls
Home
Lcd Spdr
Wait 1
Enable Interrupts
Return

