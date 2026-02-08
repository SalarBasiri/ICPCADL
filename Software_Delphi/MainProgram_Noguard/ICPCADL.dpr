program ICPCADL;

uses
  Forms,
  Unit1 in 'Unit1.pas' {main_form},
  Unit2 in 'Unit2.pas' {Calibration},
  Unit3 in 'Unit3.pas' {eoc_form},
  Unit4 in 'Unit4.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
   Application.HelpFile := 'ICPCLDL.hlp'; {Added by HelpWriter}
  Application.CreateForm(Tmain_form, main_form);
  Application.CreateForm(TCalibration, Calibration);
  Application.CreateForm(Teoc_form, eoc_form);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
