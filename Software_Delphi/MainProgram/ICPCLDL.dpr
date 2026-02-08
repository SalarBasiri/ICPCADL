program ICPCLDL;

uses
  Forms,
  Unit1 in 'Unit1.pas' {main_form},
  Unit2 in 'Unit2.pas' {Calibration};

{$R *.res}

begin
  Application.Initialize;
   Application.HelpFile := 'ICPCLDL.hlp'; {Added by HelpWriter}
  Application.CreateForm(Tmain_form, main_form);
  Application.CreateForm(TCalibration, Calibration);
  Application.Run;
end.
