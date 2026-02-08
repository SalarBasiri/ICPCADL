unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    l: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm4.Button2Click(Sender: TObject);
begin
form4.Close;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin

if (main_form.Label46.Caption = 'tvoicpcadlp') then
begin
main_form.Label45.Caption := inttostr(strtoint(main_form.Label45.Caption)-strtoint(main_form.Sampling_time_edit.Text));
main_form.tiny1.DataPartition := 'tvoicpcadlp/'+main_form.label45.Caption+'/';
end;
main_form.s.click;
form4.Close;

end;

end.
