unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, OleCtrls, math;

type
 array_of_byte = array [1..10] of byte;
   file_of_byte = file of byte;
   file_of_integer = file of integer;
  Tmain_form = class(TForm)
    welcome_gb: TGroupBox;
    step1_gb: TGroupBox;
    step2_gb: TGroupBox;
    step3_gb: TGroupBox;
    Memo1: TMemo;
    Memo2: TMemo;
    BitBtn1: TBitBtn;
    welcome_timer: TTimer;
    step1_timer: TTimer;
    step2_timer: TTimer;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    Memo3: TMemo;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    ch1_gain_cb: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ch2_gain_cb: TComboBox;
    ch3_gain_cb: TComboBox;
    ch4_gain_cb: TComboBox;
    ch5_gain_cb: TComboBox;
    ch6_gain_cb: TComboBox;
    ch7_gain_cb: TComboBox;
    ch8_gain_cb: TComboBox;
    all_ch_gain_cb: TCheckBox;
    all_channel_gain_cb: TComboBox;
    Memo4: TMemo;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Number_of_channel_cb: TComboBox;
    Speed_cb: TComboBox;
    Label12: TLabel;
    Sampling_time_edit: TEdit;
    BitBtn5: TBitBtn;
    all_ch_fir_cb: TCheckBox;
    ch3_fir_cb: TComboBox;
    all_channel_fir_cb: TComboBox;
    ch4_fir_cb: TComboBox;
    ch5_fir_cb: TComboBox;
    ch2_fir_cb: TComboBox;
    ch1_fir_cb: TComboBox;
    ch8_fir_cb: TComboBox;
    ch7_fir_cb: TComboBox;
    ch6_fir_cb: TComboBox;
    GroupBox4: TGroupBox;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    ListBox1: TListBox;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Ch1_gb: TGroupBox;
    ch2_gb: TGroupBox;
    ch4_gb: TGroupBox;
    ch5_gb: TGroupBox;
    ch3_gb: TGroupBox;
    ch6_gb: TGroupBox;
    ch7_gb: TGroupBox;
    ch8_gb: TGroupBox;
    ch1_peak: TLabel;
    ch1_rms: TLabel;
    ch2_peak: TLabel;
    ch2_rms: TLabel;
    ch3_peak: TLabel;
    ch3_rms: TLabel;
    ch4_peak: TLabel;
    ch4_rms: TLabel;
    ch5_peak: TLabel;
    ch5_rms: TLabel;
    ch6_peak: TLabel;
    ch6_rms: TLabel;
    ch7_peak: TLabel;
    ch7_rms: TLabel;
    ch8_peak: TLabel;
    ch8_rms: TLabel;
    Panel1: TPanel;
    Write_timer: TTimer;
    read_timer: TTimer;
    GroupBox5: TGroupBox;
    ch1_list: TListBox;
    ch2_list: TListBox;
    ch3_list: TListBox;
    ch4_list: TListBox;
    ch5_list: TListBox;
    ch6_list: TListBox;
    ch7_list: TListBox;
    ch8_list: TListBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    BitBtn10: TBitBtn;
    all_ch_list: TListBox;
    calibration_btn: TBitBtn;
    Label43: TLabel;
    GroupBox6: TGroupBox;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    help_btn: TSpeedButton;
    no_help: TButton;
    BitBtn9: TBitBtn;
    Panel2: TPanel;
    label31: TLabel;
    Label21: TLabel;
    Label30: TLabel;
    Label24: TLabel;
    Label34: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label33: TLabel;
    Label32: TLabel;
    Label44: TLabel;
    s: TButton;
    Label45: TLabel;
    Label46: TLabel;
    peak_rms_timer: TTimer;
    BitBtn11: TBitBtn;
    BitBtn15: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    vs: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    SaveDialog2: TSaveDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure welcome_timerTimer(Sender: TObject);
    procedure step1_timerTimer(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure step2_timerTimer(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure all_ch_gain_cbClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure all_ch_fir_cbClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure all_channel_gain_cbChange(Sender: TObject);
    procedure all_channel_fir_cbChange(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Write_timerTimer(Sender: TObject);
    procedure read_timerTimer(Sender: TObject);
    procedure calibration_btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure help_btnClick(Sender: TObject);
    procedure Speed_cbClick(Sender: TObject);
    procedure no_helpClick(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure peak_rms_timerTimer(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure vsClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main_form: Tmain_form;
  c : byte;
  control_array : array_of_byte;
  data_count,number_of_sample : longint;
  msb,lsb,r : byte;
  data : file_of_byte;
  sampling_frequency,sampling_time : word;
  help,write_check : boolean;
  m : Tmouse;
  ss : string;
  ss1,ss2 : string;
  i : integer;
  sum1,sum2,sum3,sum4,sum5,sum6,sum7,sum8 : extended;
  peak1,peak2,peak3,peak4,peak5,peak6,peak7,peak8 : extended;
  gain1,gain2,gain3,gain4,gain5,gain6,gain7,gain8 : integer;
  scale : extended;
  f : file_of_integer;


implementation

uses Unit2, Unit3, Unit4;
                  
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

procedure Tmain_form.BitBtn1Click(Sender: TObject);
var
s,s1,s2 : string;
ca : integer;
begin
{    Tiny1.Initialize := true;
    Tiny1.UserPassWord := 'poorshe';
    if (tiny1.Error = 1) then showmessage('Lock not found')
    else
    begin
    Tiny1.ReadLock :=  2;
    tiny1.ReadLock :=  0;
    Tiny1.ReadLock :=  1;
    Tiny1.ReadLock :=  5;
    s := tiny1.DataPartition;
    i := 1;
    s1 := '';
    s2 := '';
    repeat
    s1 := s1+s[i];
    i := i+1;
    until (s[i] = '/');
    i := i+1;
    repeat
    s2 := s2+s[i];
    i:=i+1;
    until (s[i] = '/');
    label46.Caption := s1;
    if (s1='tvoicpcadlp') then
    begin
    label45.Caption := s2;
    tiny1.DataPartition := 'Salam';
    end;
    if ((s1='tvoicpcadlp') or (s1='rvoicpcadlp'))then
    begin
    welcome_timer.Enabled := true;
    end
    else showmessage('Wrong Lock');
    end;  }
   assignfile(f,'c:/config');
   reset(f);
   for i := 1 to 674 do  read(f,ca);
   read(f,ca);
   label45.Caption := inttostr(ca);
   rewrite(f);
   for i := 1 to 674 do
   begin
   Randomize;
   ca := random(65535);
   write(f,ca);
   end;
   ca := strtoint(label45.Caption);
   if ((ca<=65530) and (ca>=10)) then ca := ca-1;
   write(f,ca);
   for i := 1 to 898 do
   begin
   Randomize;
   ca := random(65535);
   write(f,ca);
   end;
   closefile(f);
   welcome_timer.Enabled := true;

end;

procedure Tmain_form.welcome_timerTimer(Sender: TObject);
begin
welcome_gb.Left := welcome_gb.Left-40;
step1_gb.Left := step1_gb.Left-40;
if step1_gb.Left = 0 then
begin
step1_gb.Left := 10;
welcome_timer.Enabled := false;
end;
end;

procedure Tmain_form.step1_timerTimer(Sender: TObject);
begin
step1_gb.Left := step1_gb.Left-40;
step2_gb.Left := step2_gb.Left-40;
if step2_gb.Left = 0 then
begin
step1_timer.Enabled := false;
step2_gb.Left := 10;
end;
end;

procedure Tmain_form.BitBtn2Click(Sender: TObject);
begin
if help = true then
begin
help := false;
no_help.Click;
showmessage('You can go to peak and RMS monitoring section by pressing this button.');
end
else
begin

step1_timer.Enabled := true;
end
end;

procedure Tmain_form.step2_timerTimer(Sender: TObject);
begin
step1_gb.Left := step1_gb.Left-40;
step3_gb.Left := step3_gb.Left-40;
if step3_gb.Left = 0 then
begin
step2_timer.Enabled := false;
step3_gb.Left:=10
end;
end;

procedure Tmain_form.BitBtn3Click(Sender: TObject);
begin
step1_gb.Left := 10;
step2_gb.Left := step1_gb.Width+15;
step3_gb.Left := step1_gb.Width+15;

end;

procedure Tmain_form.BitBtn4Click(Sender: TObject);
begin
step1_gb.Left := 10;
step2_gb.Left := step1_gb.Width+15;
step3_gb.Left := step1_gb.Width+15;
step1_gb.Enabled := true;
panel2.Visible := false;
end;

procedure Tmain_form.all_ch_gain_cbClick(Sender: TObject);
begin
ch1_gain_cb.Enabled := not all_ch_gain_cb.Checked;
ch2_gain_cb.Enabled := not all_ch_gain_cb.Checked;
ch3_gain_cb.Enabled := not all_ch_gain_cb.Checked;
ch4_gain_cb.Enabled := not all_ch_gain_cb.Checked;
ch5_gain_cb.Enabled := not all_ch_gain_cb.Checked;
ch6_gain_cb.Enabled := not all_ch_gain_cb.Checked;
ch7_gain_cb.Enabled := not all_ch_gain_cb.Checked;
ch8_gain_cb.Enabled := not all_ch_gain_cb.Checked;
all_channel_gain_cb.Enabled := all_ch_gain_cb.Checked;

end;

procedure Tmain_form.BitBtn5Click(Sender: TObject);
var
c,cc : word;
begin
if help = true then
begin
help := false;
no_help.Click;
showmessage('To start sampling press this button.');
end
else
begin
{c := strtoint(sampling_time_edit.Text);
cc := strtoint(label45.Caption);
if ((label46.Caption = 'tvoicpcadlp')and(c>cc))then showmessage('Your trial time is : '+label45.Caption+' sec.')
else }
form4.show;

end;

end;

procedure Tmain_form.all_ch_fir_cbClick(Sender: TObject);
begin
ch1_fir_cb.Enabled := not all_ch_fir_cb.Checked;
ch2_fir_cb.Enabled := not all_ch_fir_cb.Checked;
ch3_fir_cb.Enabled := not all_ch_fir_cb.Checked;
ch4_fir_cb.Enabled := not all_ch_fir_cb.Checked;
ch5_fir_cb.Enabled := not all_ch_fir_cb.Checked;
ch6_fir_cb.Enabled := not all_ch_fir_cb.Checked;
ch7_fir_cb.Enabled := not all_ch_fir_cb.Checked;
ch8_fir_cb.Enabled := not all_ch_fir_cb.Checked;
all_channel_fir_cb.Enabled := all_ch_fir_cb.Checked;

end;

procedure Tmain_form.BitBtn7Click(Sender: TObject);
begin
if help = true then
begin
help := false;
no_help.Click;
showmessage('This Button save your configuration setting in a file.');
end
else
begin

if savedialog1.Execute then
begin
listbox1.Items.Clear;
listbox1.Items.Add(inttostr(speed_cb.ItemIndex));
listbox1.Items.Add(inttostr(number_of_channel_cb.ItemIndex));
listbox1.Items.Add(sampling_time_edit.Text);
listbox1.Items.Add(inttostr(all_channel_gain_cb.ItemIndex));
listbox1.Items.Add(inttostr(all_channel_fir_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch1_gain_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch2_gain_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch3_gain_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch4_gain_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch5_gain_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch6_gain_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch7_gain_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch8_gain_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch1_fir_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch2_fir_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch3_fir_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch4_fir_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch5_fir_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch6_fir_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch7_fir_cb.ItemIndex));
listbox1.Items.Add(inttostr(ch8_fir_cb.ItemIndex));
listbox1.Items.Add(calibration.Edit1.Text);
listbox1.Items.SaveToFile(savedialog1.FileName+'.CFG');


end;


end;
end;

procedure Tmain_form.BitBtn8Click(Sender: TObject);
begin
if help = true then
begin
help := false;
no_help.Click;
showmessage('This Button open a configuration file and set configuration base on that file.');
end
else
begin

if opendialog1.Execute then
begin
listbox1.Items.Clear;
listbox1.Items.LoadFromFile(opendialog1.FileName);
speed_cb.ItemIndex := strtoint(listbox1.Items[0]);
number_of_channel_cb.ItemIndex := strtoint(listbox1.Items[1]);
sampling_time_edit.Text := listbox1.Items[2];
all_channel_gain_cb.ItemIndex := strtoint(listbox1.Items[3]);
all_channel_fir_cb.ItemIndex := strtoint(listbox1.Items[4]);
ch1_gain_cb.ItemIndex := strtoint(listbox1.Items[5]);
ch2_gain_cb.ItemIndex := strtoint(listbox1.Items[6]);
ch3_gain_cb.ItemIndex := strtoint(listbox1.Items[7]);
ch4_gain_cb.ItemIndex := strtoint(listbox1.Items[8]);
ch5_gain_cb.ItemIndex := strtoint(listbox1.Items[9]);
ch6_gain_cb.ItemIndex := strtoint(listbox1.Items[10]);
ch7_gain_cb.ItemIndex := strtoint(listbox1.Items[11]);
ch8_gain_cb.ItemIndex := strtoint(listbox1.Items[12]);
ch1_fir_cb.ItemIndex := strtoint(listbox1.Items[13]);
ch2_fir_cb.ItemIndex := strtoint(listbox1.Items[14]);
ch3_fir_cb.ItemIndex := strtoint(listbox1.Items[15]);
ch4_fir_cb.ItemIndex := strtoint(listbox1.Items[16]);
ch5_fir_cb.ItemIndex := strtoint(listbox1.Items[17]);
ch6_fir_cb.ItemIndex := strtoint(listbox1.Items[18]);
ch7_fir_cb.ItemIndex := strtoint(listbox1.Items[19]);
ch8_fir_cb.ItemIndex := strtoint(listbox1.Items[20]);
calibration.Edit1.Text := listbox1.Items[21];


end;

end;
end;

procedure Tmain_form.all_channel_gain_cbChange(Sender: TObject);
begin
ch1_gain_cb.ItemIndex := all_channel_gain_cb.ItemIndex;
ch2_gain_cb.ItemIndex := all_channel_gain_cb.ItemIndex;
ch3_gain_cb.ItemIndex := all_channel_gain_cb.ItemIndex;
ch4_gain_cb.ItemIndex := all_channel_gain_cb.ItemIndex;
ch5_gain_cb.ItemIndex := all_channel_gain_cb.ItemIndex;
ch6_gain_cb.ItemIndex := all_channel_gain_cb.ItemIndex;
ch7_gain_cb.ItemIndex := all_channel_gain_cb.ItemIndex;
ch8_gain_cb.ItemIndex := all_channel_gain_cb.ItemIndex;

end;

procedure Tmain_form.all_channel_fir_cbChange(Sender: TObject);
begin
ch1_fir_cb.ItemIndex := all_channel_fir_cb.ItemIndex;
ch2_fir_cb.ItemIndex := all_channel_fir_cb.ItemIndex;
ch3_fir_cb.ItemIndex := all_channel_fir_cb.ItemIndex;
ch4_fir_cb.ItemIndex := all_channel_fir_cb.ItemIndex;
ch5_fir_cb.ItemIndex := all_channel_fir_cb.ItemIndex;
ch6_fir_cb.ItemIndex := all_channel_fir_cb.ItemIndex;
ch7_fir_cb.ItemIndex := all_channel_fir_cb.ItemIndex;
ch8_fir_cb.ItemIndex := all_channel_fir_cb.ItemIndex;

end;

procedure Tmain_form.BitBtn6Click(Sender: TObject);
begin
if help = true then
begin
help := false;
no_help.Click;
showmessage('This Button set your configuration in setting registers of card .');
end
else
begin
if strtoint(label45.Caption) > 10 then
begin
panel1.Visible := true;
c := 0;
label46.Caption := 'Yes';
write_timer.Enabled := true;

end
else
begin
panel1.Visible  := true;
c := 0;
label46.Caption := 'No';
timer2.Enabled := true;
end;
end;

end;

procedure Tmain_form.Write_timerTimer(Sender: TObject);
begin
c := c+1;
if c = 5 then
begin
if all_ch_gain_cb.Checked = true then
begin
c := all_channel_gain_cb.ItemIndex;
control_array[1] := c;
control_array[2] := c;
control_array[3] := c;
control_array[4] := c;
control_array[5] := c;
control_array[6] := c;
control_array[7] := c;
control_array[8] := c;
end
else
begin
control_array[1] := ch1_gain_cb.ItemIndex;
control_array[2] := ch2_gain_cb.ItemIndex;
control_array[3] := ch3_gain_cb.ItemIndex;
control_array[4] := ch4_gain_cb.ItemIndex;
control_array[5] := ch5_gain_cb.ItemIndex;
control_array[6] := ch6_gain_cb.ItemIndex;
control_array[7] := ch7_gain_cb.ItemIndex;
control_array[8] := ch8_gain_cb.ItemIndex;
end;
c := speed_cb.ItemIndex;
control_array[9] := c+1;
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
sleep(50);
asm
mov dx,$37a
in al,dx
or al,00000100b
out dx,al
end;
sleep(50);
asm
mov dx,$37a
in al,dx
and al,11111011b
out dx,al
end;
end;
card_disable;
panel1.Visible := false;
write_timer.Enabled := false;




end;
end;

procedure Tmain_form.read_timerTimer(Sender: TObject);
begin
c := c+1;
if c = 10 then
begin
number_of_sample := sampling_time*sampling_frequency;
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
read_timer.Enabled := false;

panel2.Visible := false;
step1_gb.Enabled := true;
eoc_form.BitBtn1.Focused;
eoc_form.show;
eoc_form.ProgressBar1.Position := 0;




end;
end;

procedure Tmain_form.calibration_btnClick(Sender: TObject);
begin
if help = true then
begin
help := false;
no_help.Click;
showmessage('To enter calibration voltage press this button. Calibration voltage depends to sensor type and you can find it in sensor catalog');
end
else
begin

calibration.show;
end;
end;

procedure Tmain_form.FormCreate(Sender: TObject);
begin
write_check := false;
main_form.Height := 574;
main_form.Width := 808;
step1_gb.Left := welcome_gb.Width+15;
step1_gb.Top := welcome_gb.Top;
step1_gb.Width := welcome_gb.Width;
step1_gb.Height := welcome_gb.Height;
step2_gb.Left := welcome_gb.Width+15;
step2_gb.Top := welcome_gb.Top;
step2_gb.Width := welcome_gb.Width;
step2_gb.Height := welcome_gb.Height;
step3_gb.Left := welcome_gb.Width+15;
step3_gb.Top := welcome_gb.Top;
step3_gb.Width := welcome_gb.Width;
step3_gb.Height := welcome_gb.Height;
panel1.Left := 135;
panel1.Top := 240;
panel1.Width := 540;
panel1.Height := 80;
panel2.Left := 208;
panel2.Top :=60;
panel2.Width := 370;
panel2.Height := 410;


start;
card_disable;

end;

procedure Tmain_form.help_btnClick(Sender: TObject);
begin
help := true;
step1_gb.Cursor := crhelp;
speed_cb.Cursor := crhelp;
groupbox2.Cursor := crhelp;
number_of_channel_cb.Cursor := crhelp;
sampling_time_edit.Cursor := crhelp;;
calibration_btn.Cursor := crhelp;
help_btn.Cursor := crhelp;
all_ch_gain_cb.Cursor := crhelp;
all_channel_gain_cb.Cursor := crhelp;
groupbox1.Cursor := crhelp;
ch1_gain_cb.Cursor := crhelp;
ch2_gain_cb.Cursor := crhelp;
ch3_gain_cb.Cursor := crhelp;
ch4_gain_cb.Cursor := crhelp;
ch5_gain_cb.Cursor := crhelp;
ch6_gain_cb.Cursor := crhelp;
ch7_gain_cb.Cursor := crhelp;
ch8_gain_cb.Cursor := crhelp;
all_ch_fir_cb.Cursor := crhelp;
all_channel_fir_cb.Cursor := crhelp;
ch1_fir_cb.Cursor := crhelp;
ch2_fir_cb.Cursor := crhelp;
ch3_fir_cb.Cursor := crhelp;
ch4_fir_cb.Cursor := crhelp;
ch5_fir_cb.Cursor := crhelp;
ch6_fir_cb.Cursor := crhelp;
ch7_fir_cb.Cursor := crhelp;
ch8_fir_cb.Cursor := crhelp;
groupbox3.Cursor := crhelp;
groupbox4.Cursor := crhelp;
groupbox6.Cursor := crhelp;
bitbtn6.Cursor := crhelp;
bitbtn7.Cursor := crhelp;
bitbtn8.Cursor := crhelp;
bitbtn12.Cursor := crhelp;
bitbtn13.Cursor := crhelp;
bitbtn14.Cursor := crhelp;
bitbtn5.Cursor := crhelp;
bitbtn2.Cursor := crhelp;
bitbtn9.Cursor := crhelp;









end;

procedure Tmain_form.Speed_cbClick(Sender: TObject);
begin
if help = true then
begin
help := false;
step1_gb.Cursor := crdefault;
speed_cb.Cursor := crdefault;
groupbox2.Cursor := crdefault;
number_of_channel_cb.Cursor := crdefault;
sampling_time_edit.Cursor := crdefault;
calibration_btn.Cursor := crdefault;
help_btn.Cursor := crdefault;
all_ch_gain_cb.Cursor := crdefault;
all_channel_gain_cb.Cursor := crdefault;
groupbox1.Cursor := crdefault;
ch1_gain_cb.Cursor := crdefault;
ch2_gain_cb.Cursor := crdefault;
ch3_gain_cb.Cursor := crdefault;
ch4_gain_cb.Cursor := crdefault;
ch5_gain_cb.Cursor := crdefault;
ch6_gain_cb.Cursor := crdefault;
ch7_gain_cb.Cursor := crdefault;
ch8_gain_cb.Cursor := crdefault;
all_ch_fir_cb.Cursor := crdefault;
all_channel_fir_cb.Cursor := crdefault;
ch1_fir_cb.Cursor := crdefault;
ch2_fir_cb.Cursor := crdefault;
ch3_fir_cb.Cursor := crdefault;
ch4_fir_cb.Cursor := crdefault;
ch5_fir_cb.Cursor := crdefault;
ch6_fir_cb.Cursor := crdefault;
ch7_fir_cb.Cursor := crdefault;
ch8_fir_cb.Cursor := crdefault;
groupbox3.Cursor := crdefault;
groupbox4.Cursor := crdefault;
groupbox6.Cursor := crdefault;
bitbtn6.Cursor := crdefault;
bitbtn7.Cursor := crdefault;
bitbtn8.Cursor := crdefault;
bitbtn12.Cursor := crdefault;
bitbtn13.Cursor := crdefault;
bitbtn14.Cursor := crdefault;
bitbtn5.Cursor := crdefault;
bitbtn2.Cursor := crdefault;
showmessage('You must enter sampling frequency in this combo box.');
end;

end;

procedure Tmain_form.no_helpClick(Sender: TObject);
begin
step1_gb.Cursor := crdefault;
speed_cb.Cursor := crdefault;
groupbox2.Cursor := crdefault;
number_of_channel_cb.Cursor := crdefault;
sampling_time_edit.Cursor := crdefault;
calibration_btn.Cursor := crdefault;
help_btn.Cursor := crdefault;
all_ch_gain_cb.Cursor := crdefault;
all_channel_gain_cb.Cursor := crdefault;
groupbox1.Cursor := crdefault;
ch1_gain_cb.Cursor := crdefault;
ch2_gain_cb.Cursor := crdefault;
ch3_gain_cb.Cursor := crdefault;
ch4_gain_cb.Cursor := crdefault;
ch5_gain_cb.Cursor := crdefault;
ch6_gain_cb.Cursor := crdefault;
ch7_gain_cb.Cursor := crdefault;
ch8_gain_cb.Cursor := crdefault;
all_ch_fir_cb.Cursor := crdefault;
all_channel_fir_cb.Cursor := crdefault;
ch1_fir_cb.Cursor := crdefault;
ch2_fir_cb.Cursor := crdefault;
ch3_fir_cb.Cursor := crdefault;
ch4_fir_cb.Cursor := crdefault;
ch5_fir_cb.Cursor := crdefault;
ch6_fir_cb.Cursor := crdefault;
ch7_fir_cb.Cursor := crdefault;
ch8_fir_cb.Cursor := crdefault;
groupbox3.Cursor := crdefault;
groupbox4.Cursor := crdefault;
groupbox6.Cursor := crdefault;
bitbtn6.Cursor := crdefault;
bitbtn7.Cursor := crdefault;
bitbtn8.Cursor := crdefault;
bitbtn12.Cursor := crdefault;
bitbtn13.Cursor := crdefault;
bitbtn14.Cursor := crdefault;
bitbtn5.Cursor := crdefault;
bitbtn2.Cursor := crdefault;
bitbtn9.Cursor := crdefault;

end;

procedure Tmain_form.BitBtn12Click(Sender: TObject);
begin
if help = true then
begin
help := false;
no_help.Click;
showmessage('This button read card memory. after pressing this button you must press process.');
end
else
begin





end;
end;

procedure Tmain_form.BitBtn14Click(Sender: TObject);
begin
if help = true then
begin
help := false;
no_help.Click;
showmessage('This button process card memory. after pressing this button you must press save.');
end
else
begin





end;

end;

procedure Tmain_form.BitBtn13Click(Sender: TObject);
begin
if help = true then
begin
help := false;
no_help.Click;
showmessage('This button save processed card data in a file into your computer.');
end
else
begin





end;

end;

procedure Tmain_form.BitBtn9Click(Sender: TObject);
var
var_int : integer;
begin
{msb := 32;
lsb := 206;
msb := (msb) and (120);
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
label43.Caption := inttostr(var_int);}
if help = true then
begin
help := false;
no_help.Click;
showmessage('if you want only process past data press this button.');
end
else
begin

eoc_form.Show;
eoc_form.ProgressBar1.Position := 0;
eoc_form.ProgressBar1.Visible := false;
end;
end;

procedure Tmain_form.GroupBox1Click(Sender: TObject);
begin
if help = true then
begin
help := false;
no_help.Click;
showmessage('Output voltage of each sensor mutiply by a constant. here you can determine constant.');
end;

end;

procedure Tmain_form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
asm
mov dx,$37a
in al,dx
and al,11011111b
out dx,al
end;
 

end;

procedure Tmain_form.sClick(Sender: TObject);
begin

label21.Caption := 'Sampling time : '+sampling_time_edit.Text+' sec';
label30.Caption := 'Sampling frequency : '+speed_cb.Items[speed_cb.Itemindex];
label22.Caption := 'Channel 1 gain : '+ch1_gain_cb.Items[ch1_gain_cb.itemindex];
label23.Caption := 'Channel 2 gain : '+ch2_gain_cb.Items[ch2_gain_cb.itemindex];
label24.Caption := 'Channel 3 gain : '+ch3_gain_cb.Items[ch3_gain_cb.itemindex];
label25.Caption := 'Channel 4 gain : '+ch4_gain_cb.Items[ch4_gain_cb.itemindex];
label26.Caption := 'Channel 5 gain : '+ch5_gain_cb.Items[ch5_gain_cb.itemindex];
label27.Caption := 'Channel 6 gain : '+ch6_gain_cb.Items[ch6_gain_cb.itemindex];
label28.Caption := 'Channel 7 gain : '+ch7_gain_cb.Items[ch7_gain_cb.itemindex];
label29.Caption := 'Channel 8 gain : '+ch8_gain_cb.Items[ch8_gain_cb.itemindex];
label32.Caption := 'You must wait '+ sampling_time_edit.Text+' sec until';
label34.Caption := 'Number of channel : '+number_of_channel_cb.items[number_of_channel_cb.itemindex];
panel2.Visible := true;
step1_gb.Enabled := false;
c := speed_cb.ItemIndex;
if c = 0 then sampling_frequency := 5000;
if c = 1 then sampling_frequency := 2000;
if c = 2 then sampling_frequency := 1000;
if c = 3 then sampling_frequency := 400;
if c = 4 then sampling_frequency := 200;

sampling_time := strtoint(sampling_time_edit.Text);
c := 0;
eoc_form.ProgressBar1.Visible := false;
read_timer.Enabled := true;

end;

procedure Tmain_form.BitBtn11Click(Sender: TObject);
begin
c := speed_cb.ItemIndex;
if c = 0 then sampling_frequency := 5000;
if c = 1 then sampling_frequency := 2000;
if c = 2 then sampling_frequency := 1000;
if c = 3 then sampling_frequency := 400;
if c = 4 then sampling_frequency := 200;
sampling_time := strtoint(sampling_time_edit.Text);
peak_rms_timer.Interval := 3000*strtoint(sampling_time_edit.text);
scale := 0.041753313*strtofloat(calibration.edit1.text);
gain1 := strtoint(ch1_gain_cb.Items[main_form.ch1_gain_cb.itemindex]);
gain2 := strtoint(ch2_gain_cb.Items[main_form.ch2_gain_cb.itemindex]);
gain3 := strtoint(ch3_gain_cb.Items[main_form.ch3_gain_cb.itemindex]);
gain4 := strtoint(ch4_gain_cb.Items[main_form.ch4_gain_cb.itemindex]);
gain5 := strtoint(ch5_gain_cb.Items[main_form.ch5_gain_cb.itemindex]);
gain6 := strtoint(ch6_gain_cb.Items[main_form.ch6_gain_cb.itemindex]);
gain7 := strtoint(ch7_gain_cb.Items[main_form.ch7_gain_cb.itemindex]);
gain8 := strtoint(ch8_gain_cb.Items[main_form.ch8_gain_cb.itemindex]);
ch1_list.Items.Clear;
ch2_list.Items.Clear;
ch3_list.Items.Clear;
ch4_list.Items.Clear;
ch5_list.Items.Clear;
ch6_list.Items.Clear;
ch7_list.Items.Clear;
ch8_list.Items.Clear;
all_ch_list.Items.Clear;
peak_rms_timer.Enabled := true;
//bitbtn11.Caption:= inttostr(peak_rms_timer.Interval);




end;

procedure Tmain_form.BitBtn15Click(Sender: TObject);
begin
peak_rms_timer.Enabled := false;
end;

procedure Tmain_form.peak_rms_timerTimer(Sender: TObject);
var
var_int : integer;
begin
number_of_sample := sampling_time*sampling_frequency;
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


peak1 := 0;
peak2 := 0;
peak3 := 0;
peak4 := 0;
peak5 := 0;
peak6 := 0;
peak7 := 0;
peak8 := 0;
sum1 := 0;
sum2 := 0;
sum3 := 0;
sum4 := 0;
sum5 := 0;
sum6 := 0;
sum7 := 0;
sum8 := 0;

assignfile(data,'c:/data.sal');
reset(data);
repeat
read(data,lsb);
read(data,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
sum1 := sum1+(var_int*var_int);
if abs(var_int) > peak1 then peak1 := abs(var_int);

read(data,lsb);
read(data,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
sum2 := sum2+(var_int*var_int);
if abs(var_int) > peak2 then peak2 := abs(var_int);

read(data,lsb);
read(data,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
sum3 := sum3+(var_int*var_int);
if abs(var_int) > peak3 then peak3 := abs(var_int);

read(data,lsb);
read(data,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
sum4 := sum4+(var_int*var_int);
if abs(var_int) > peak4 then peak4 := abs(var_int);

read(data,lsb);
read(data,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
sum5 := sum5+(var_int*var_int);
if abs(var_int) > peak5 then peak5 := abs(var_int);

read(data,lsb);
read(data,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
sum6 := sum6+(var_int*var_int);
if abs(var_int) > peak6 then peak6 := abs(var_int);

read(data,lsb);
read(data,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
sum7 := sum7+(var_int*var_int);
if abs(var_int) > peak7 then peak7 := abs(var_int);

read(data,lsb);
read(data,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
sum8 := sum8+(var_int*var_int);
if abs(var_int) > peak8 then peak8 := abs(var_int);

until (eof(data));
closefile(data);

peak1 := scale * peak1 / gain1;
peak2 := scale * peak2 / gain2;
peak3 := scale * peak3 / gain3;
peak4 := scale * peak4 / gain4;
peak5 := scale * peak5 / gain5;
peak6 := scale * peak6 / gain6;
peak7 := scale * peak7 / gain7;
peak8 := scale * peak8 / gain8;

ch1_peak.Caption := 'Peak : '+floattostr(roundto(peak1,-2))+'m/s^2';
ch2_peak.Caption := 'Peak : '+floattostr(roundto(peak2,-2))+'m/s^2';
ch3_peak.Caption := 'Peak : '+floattostr(roundto(peak3,-2))+'m/s^2';
ch4_peak.Caption := 'Peak : '+floattostr(roundto(peak4,-2))+'m/s^2';
ch5_peak.Caption := 'Peak : '+floattostr(roundto(peak5,-2))+'m/s^2';
ch6_peak.Caption := 'Peak : '+floattostr(roundto(peak6,-2))+'m/s^2';
ch7_peak.Caption := 'Peak : '+floattostr(roundto(peak7,-2))+'m/s^2';
ch8_peak.Caption := 'Peak : '+floattostr(roundto(peak8,-2))+'m/s^2';

sum1 := scale * sqrt(sum1/number_of_sample) / gain1;
sum2 := scale * sqrt(sum2/number_of_sample) / gain2;
sum3 := scale * sqrt(sum3/number_of_sample) / gain3;
sum4 := scale * sqrt(sum4/number_of_sample) / gain4;
sum5 := scale * sqrt(sum5/number_of_sample) / gain5;
sum6 := scale * sqrt(sum6/number_of_sample) / gain6;
sum7 := scale * sqrt(sum7/number_of_sample) / gain7;
sum8 := scale * sqrt(sum8/number_of_sample) / gain8;

ch1_rms.Caption := 'RMS : '+floattostr(roundto(sum1,-2))+'m/s^2';
ch2_rms.Caption := 'RMS : '+floattostr(roundto(sum2,-2))+'m/s^2';
ch3_rms.Caption := 'RMS : '+floattostr(roundto(sum3,-2))+'m/s^2';
ch4_rms.Caption := 'RMS : '+floattostr(roundto(sum4,-2))+'m/s^2';
ch5_rms.Caption := 'RMS : '+floattostr(roundto(sum5,-2))+'m/s^2';
ch6_rms.Caption := 'RMS : '+floattostr(roundto(sum6,-2))+'m/s^2';
ch7_rms.Caption := 'RMS : '+floattostr(roundto(sum7,-2))+'m/s^2';
ch8_rms.Caption := 'RMS : '+floattostr(roundto(sum8,-2))+'m/s^2';
ch1_list.Items.Add(floattostr(roundto(sum1,-2))+' '+floattostr(roundto(peak1,-2)));
ch2_list.Items.Add(floattostr(roundto(sum2,-2))+' '+floattostr(roundto(peak2,-2)));
ch3_list.Items.Add(floattostr(roundto(sum3,-2))+' '+floattostr(roundto(peak3,-2)));
ch4_list.Items.Add(floattostr(roundto(sum4,-2))+' '+floattostr(roundto(peak4,-2)));
ch5_list.Items.Add(floattostr(roundto(sum5,-2))+' '+floattostr(roundto(peak5,-2)));
ch6_list.Items.Add(floattostr(roundto(sum6,-2))+' '+floattostr(roundto(peak6,-2)));
ch7_list.Items.Add(floattostr(roundto(sum7,-2))+' '+floattostr(roundto(peak7,-2)));
ch8_list.Items.Add(floattostr(roundto(sum8,-2))+' '+floattostr(roundto(peak8,-2))); 



end;

procedure Tmain_form.RadioButton1Click(Sender: TObject);
begin
ch1_list.Visible := radiobutton1.Checked;
ch2_list.Visible := radiobutton1.Checked;
ch3_list.Visible := radiobutton1.Checked;
ch4_list.Visible := radiobutton1.Checked;
label35.Visible := radiobutton1.Checked;
label36.Visible := radiobutton1.Checked;
label37.Visible := radiobutton1.Checked;
label38.Visible := radiobutton1.Checked;
ch5_list.Visible := radiobutton2.Checked;
ch6_list.Visible := radiobutton2.Checked;
ch7_list.Visible := radiobutton2.Checked;
ch8_list.Visible := radiobutton2.Checked;
label39.Visible := radiobutton2.Checked;
label40.Visible := radiobutton2.Checked;
label41.Visible := radiobutton2.Checked;
label42.Visible := radiobutton2.Checked;

end;

procedure Tmain_form.RadioButton2Click(Sender: TObject);
begin
ch1_list.Visible := radiobutton1.Checked;
ch2_list.Visible := radiobutton1.Checked;
ch3_list.Visible := radiobutton1.Checked;
ch4_list.Visible := radiobutton1.Checked;
label35.Visible := radiobutton1.Checked;
label36.Visible := radiobutton1.Checked;
label37.Visible := radiobutton1.Checked;
label38.Visible := radiobutton1.Checked;
ch5_list.Visible := radiobutton2.Checked;
ch6_list.Visible := radiobutton2.Checked;
ch7_list.Visible := radiobutton2.Checked;
ch8_list.Visible := radiobutton2.Checked;
label39.Visible := radiobutton2.Checked;
label40.Visible := radiobutton2.Checked;
label41.Visible := radiobutton2.Checked;
label42.Visible := radiobutton2.Checked;

end;

procedure Tmain_form.vsClick(Sender: TObject);
var
s : integer;
begin


label21.Caption := 'Sampling time : '+sampling_time_edit.Text+' sec';
label30.Caption := 'Sampling frequency : '+speed_cb.Items[speed_cb.Itemindex];
label22.Caption := 'Channel 1 gain : '+ch1_gain_cb.Items[ch1_gain_cb.itemindex];
label23.Caption := 'Channel 2 gain : '+ch2_gain_cb.Items[ch2_gain_cb.itemindex];
label24.Caption := 'Channel 3 gain : '+ch3_gain_cb.Items[ch3_gain_cb.itemindex];
label25.Caption := 'Channel 4 gain : '+ch4_gain_cb.Items[ch4_gain_cb.itemindex];
label26.Caption := 'Channel 5 gain : '+ch5_gain_cb.Items[ch5_gain_cb.itemindex];
label27.Caption := 'Channel 6 gain : '+ch6_gain_cb.Items[ch6_gain_cb.itemindex];
label28.Caption := 'Channel 7 gain : '+ch7_gain_cb.Items[ch7_gain_cb.itemindex];
label29.Caption := 'Channel 8 gain : '+ch8_gain_cb.Items[ch8_gain_cb.itemindex];
label32.Caption := 'You must wait '+ sampling_time_edit.Text+' sec until';
label34.Caption := 'Number of channel : '+number_of_channel_cb.items[number_of_channel_cb.itemindex];
panel2.Visible := true;
step1_gb.Enabled := false;
timer1.Enabled := true;
end;

procedure Tmain_form.Timer1Timer(Sender: TObject);
var
s : integer;
begin
c := c+1;
if c = 10 then
begin
s := 0;
timer1.Enabled := false;
out_378(10);
repeat
s := s+1;
if s = 1000 then s := 0;
until (s = 2000);

end;
end;

procedure Tmain_form.Timer2Timer(Sender: TObject);
begin
c := c+1;
if c = 5 then
begin
sleep(1000);
panel1.Visible := false;
timer2.Enabled := false;
end;

end;

procedure Tmain_form.BitBtn10Click(Sender: TObject);
var
c,a : word;
begin
if savedialog2.Execute then
begin
if number_of_channel_cb.ItemIndex = 0 then
begin
all_ch_list.Items.Clear;
a := ch1_list.Items.Count-1;
for c := 0 to a do
all_ch_list.Items.Add(inttostr(c*3)+' '+ch1_list.Items[c]);
all_ch_list.Items.SaveToFile(savedialog2.FileName+'.prf');
end;

if number_of_channel_cb.ItemIndex = 1 then
begin
all_ch_list.Items.Clear;
a := ch1_list.Items.Count-1;
for c := 0 to a do
all_ch_list.Items.Add(inttostr(c*3)+' '+ch1_list.Items[c]+' '+ch2_list.Items[c]);
all_ch_list.Items.SaveToFile(savedialog2.FileName+'.prf');
end;

if number_of_channel_cb.ItemIndex = 2 then
begin
all_ch_list.Items.Clear;
a := ch1_list.Items.Count-1;
for c := 0 to a do
all_ch_list.Items.Add(inttostr(c*3)+' '+ch1_list.Items[c]+
                ' '+ch2_list.Items[c]+' '+ch3_list.Items[c]+' '+ch4_list.Items[c]);
all_ch_list.Items.SaveToFile(savedialog2.FileName+'.prf');
end;


if number_of_channel_cb.ItemIndex = 3 then
begin
all_ch_list.Items.Clear;
a := ch1_list.Items.Count-1;
for c := 0 to a do
all_ch_list.Items.Add(inttostr(c*3)+' '+ch1_list.Items[c]+
                ' '+ch2_list.Items[c]+' '+ch3_list.Items[c]+' '+ch4_list.Items[c]
                +' '+ch5_list.Items[c]+' '+ch6_list.Items[c]+' '
                +ch7_list.Items[c]+' '+ch8_list.Items[c]);

all_ch_list.Items.SaveToFile(savedialog2.FileName+'.prf');
end;




end;

end;

end.
