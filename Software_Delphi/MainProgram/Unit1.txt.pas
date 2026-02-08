unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg;

type
 array_of_byte = array [1..10] of byte;
   file_of_byte = file of byte;
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
    BitBtn9: TBitBtn;
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
    Panel2: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    read_timer: TTimer;
    GroupBox5: TGroupBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    ListBox5: TListBox;
    ListBox6: TListBox;
    ListBox7: TListBox;
    ListBox8: TListBox;
    ListBox9: TListBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    BitBtn10: TBitBtn;
    ListBox10: TListBox;
    BitBtn11: TBitBtn;
    Label43: TLabel;
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
    procedure BitBtn11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

implementation

uses Unit2;
                  
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
begin
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
step1_timer.Enabled := true;
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
step2_gb.Left := step1_gb.Width+20;
step3_gb.Left := step1_gb.Width+20;

end;

procedure Tmain_form.BitBtn4Click(Sender: TObject);
begin
step1_gb.Left := 10;
step2_gb.Left := step1_gb.Width+20;
step3_gb.Left := step1_gb.Width+20;
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
read_timer.Enabled := true;



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
listbox1.Items.SaveToFile(savedialog1.FileName+'.CFG');


end;



end;

procedure Tmain_form.BitBtn8Click(Sender: TObject);
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
panel1.Visible := true;
c := 0;
write_timer.Enabled := true;


end;

procedure Tmain_form.Write_timerTimer(Sender: TObject);
begin
c := c+1;
if c = 10 then
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
sleep(4000);

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
step2_timer.Enabled := true;





end;
end;

procedure Tmain_form.BitBtn11Click(Sender: TObject);
begin
calibration.show;
end;

procedure Tmain_form.FormCreate(Sender: TObject);
begin
main_form.Height := 574;
main_form.Left := -4;
main_form.Top := -4;
main_form.Width := 808;
step1_gb.Left := welcome_gb.Width+20;
step1_gb.Top := welcome_gb.Top;
step1_gb.Width := welcome_gb.Width;
step1_gb.Height := welcome_gb.Height;
step2_gb.Left := welcome_gb.Width+20;
step2_gb.Top := welcome_gb.Top;
step2_gb.Width := welcome_gb.Width;
step2_gb.Height := welcome_gb.Height;
step3_gb.Left := welcome_gb.Width+20;
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


//start;

end;

end.
