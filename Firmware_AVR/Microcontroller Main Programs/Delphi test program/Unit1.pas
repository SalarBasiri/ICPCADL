unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  array_of_byte = array [1..10] of byte;
  speed_check_array = array [1..300000] of byte;
  file_of_byte = file of byte;
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button4: TButton;
    Label2: TLabel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Button10: TButton;
    Label3: TLabel;
    Button11: TButton;
    Edit11: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  control_array : array_of_byte;
  p378,p379,p37a : byte;
implementation
procedure start;
begin
asm
mov dx,$37a
in al,dx
or al,00000011b
and al,11111011b
out dx,al
end;
end;
procedure in_378;
begin
asm
mov dx,$37a
in al,dx
or al,00100000b
out dx,al
end;
end;
procedure out_378(value : byte);
begin
asm
mov dx,$37a
in al,dx
and al,11011111b
out dx,al
mov dx,$378
mov al,value
out dx,al
end;
end;
procedure card_disable;
begin
asm
mov dx,$37a
in al,dx
or al,00000011b
out dx,al
end;
end;
procedure write_to_card;
begin
asm
mov dx,$37a
in al,dx
or al,00000001b
and al,11111101b
out dx,al
end;
end;
procedure read_from_card;
begin
asm
mov dx,$37a
in al,dx
or al,00000010b
and al,11111110b
out dx,al
end;
end;
procedure read_from_eeprom;
begin       
asm
mov dx,$37a
in al,dx
and al,11111100b
out dx,al
end;
end;







{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
start;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
out_378(strtoint(edit1.Text));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
a :byte;
begin
in_378;
asm
mov dx,$378
in al,dx
mov a,al
end;
label1.Caption := inttostr(a);


end;

procedure TForm1.Button4Click(Sender: TObject);
var
r:byte;
begin
label2.Caption := 'before';
repeat
asm
mov dx,$379
in al,dx
and al,10000000b
mov r,al
end;
until (r=0);
label2.Caption := 'after';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
card_disable;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
read_from_card;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
write_to_card;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
read_from_EEPROM;

end;

procedure TForm1.Button9Click(Sender: TObject);
var
c : byte;

begin
control_array[1] := strtoint(edit2.Text);
control_array[2] := strtoint(edit3.Text);
control_array[3] := strtoint(edit4.Text);
control_array[4] := strtoint(edit5.Text);
control_array[5] := strtoint(edit6.Text);
control_array[6] := strtoint(edit7.Text);
control_array[7] := strtoint(edit8.Text);
control_array[8] := strtoint(edit9.Text);
control_array[9] := strtoint(edit11.Text);;
control_array[10] := 255;
asm
mov dx,$37a
in al,dx
and al,11111011b
out dx,al
end;
write_to_card;
for c := 1 to 10 do
begin
out_378(control_array[c]);
sleep(10);
asm
mov dx,$37a
in al,dx
or al,00000100b
out dx,al
end;
sleep(10);
asm
mov dx,$37a
in al,dx
and al,11111011b
out dx,al
end;
end;
sleep(2000);

card_disable;

end;

procedure TForm1.Button10Click(Sender: TObject);
var
data_count,number_of_sample : longint;
msb,lsb,r,c : byte;
data : file_of_byte;
begin
number_of_sample := strtoint(edit10.Text);
assignfile(data,'c:/data.sal');
rewrite(data);
in_378;
read_from_card;
for data_count := 1 to number_of_sample do
begin
repeat
asm
mov dx,$379
in al,dx
and al,10000000b
mov r,al
end;
until (r=0);
for c := 1 to 8 do
begin
asm
mov dx,$378
in al,dx
mov msb,al
mov dx,$379
in al,dx
mov lsb,al
end;
write(data,msb);
asm
mov dx,$37a
in al,dx
or al,00000100b
out dx,al
end;
write(data,lsb);
asm
mov dx,$37a
in al,dx
and al,11111011b
out dx,al
end;


end;



end;

card_disable;
asm
mov dx,$37a
in al,dx
or al,00000100b
out dx,al
end;
closefile(data);
asm
mov dx,$37a
in al,dx
and al,11111011b
out dx,al
end;

end;

procedure TForm1.Button11Click(Sender: TObject);
var
data_count,number_of_sample : longint;
msb,lsb,r,c : byte;
data : file_of_byte;
armsb,arlsb : speed_check_array;
begin
number_of_sample := strtoint(edit10.Text);
in_378;
label3.Caption := 'before';
for data_count := 1 to number_of_sample do
begin
asm
mov dx,$378
in al,dx
mov msb,al
mov dx,$379
in al,dx
mov lsb,al
mov dx,$37a
in al,dx
or al,00000100b
out dx,al
end;
armsb[data_count] := msb;
arlsb[data_count] := lsb;

asm
mov dx,$37a
in al,dx
and al,11111011b
out dx,al
end;


end;
label3.Caption := 'after';


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
asm
mov dx,$378
in al,dx
mov p378,al
mov dx,$379
in al,dx
mov p379,al
mov dx,$37a
in al,dx
mov p37a,al
end;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
asm
mov dx,$37a
in al,dx
and al,11011111b
out dx,al
end;
end;

end.
 