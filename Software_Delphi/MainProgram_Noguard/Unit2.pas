unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TCalibration = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Calibration: TCalibration;

implementation

uses Unit1;

{$R *.dfm}

procedure TCalibration.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
main_form.step1_gb.Focused;
end;

end.
