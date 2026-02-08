$regfile = "m32def.dat"
$crystal = 1000000
Config Porta = Output
Do
Wait 1
Porta = Porta Or 1
Wait 1
Porta = Porta And 0
Loop
End                                                         'end program
