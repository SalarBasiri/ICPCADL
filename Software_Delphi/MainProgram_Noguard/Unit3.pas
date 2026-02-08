unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, math;

type
  file_of_byte = file of byte;
  integer_array = array [0..1000] of integer;
  extended_array = array [0..1000] of extended;

  Teoc_form = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    SaveDialog1: TSaveDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  eoc_form: Teoc_form;
  in_file : file_of_byte;
  final_output : text;
  out_ch1,out_ch2,out_ch3,out_ch4,out_ch5,out_ch6,out_ch7,out_ch8 : text;
  fir_ch1,fir_ch2,fir_ch3,fir_ch4,fir_ch5,fir_ch6,fir_ch7,fir_ch8 : text;
  c : int64;
implementation

uses Unit1, Unit2;

{$R *.dfm}

procedure Teoc_form.BitBtn1Click(Sender: TObject);
var
msb,lsb : byte;
var_int : integer;
data : string;
window_width : integer;
c : integer;
sum,scale : extended;
result,w_c : extended;
hamming_w : extended_array;
h_d : extended_array;
b_n : extended_array;
k : integer;
window_data : integer_array;
cutoff_frequency,sampling_frequency : word;

begin
progressbar1.Visible := true;
progressbar1.Position := progressbar1.Position+1;
assignfile(in_file,'c:/data.sal');
assignfile(out_ch1,'c:/out_ch1.sal');
assignfile(out_ch2,'c:/out_ch2.sal');
assignfile(out_ch3,'c:/out_ch3.sal');
assignfile(out_ch4,'c:/out_ch4.sal');
assignfile(out_ch5,'c:/out_ch5.sal');
assignfile(out_ch6,'c:/out_ch6.sal');
assignfile(out_ch7,'c:/out_ch7.sal');
assignfile(out_ch8,'c:/out_ch8.sal');
assignfile(fir_ch1,'c:/fir_ch1.sal');
assignfile(fir_ch2,'c:/fir_ch2.sal');
assignfile(fir_ch3,'c:/fir_ch3.sal');
assignfile(fir_ch4,'c:/fir_ch4.sal');
assignfile(fir_ch5,'c:/fir_ch5.sal');
assignfile(fir_ch6,'c:/fir_ch6.sal');
assignfile(fir_ch7,'c:/fir_ch7.sal');
assignfile(fir_ch8,'c:/fir_ch8.sal');
reset(in_file);
rewrite(out_ch1);
rewrite(out_ch2);
rewrite(out_ch3);
rewrite(out_ch4);
rewrite(out_ch5);
rewrite(out_ch6);
rewrite(out_ch7);
rewrite(out_ch8);
rewrite(fir_ch1);
rewrite(fir_ch2);
rewrite(fir_ch3);
rewrite(fir_ch4);
rewrite(fir_ch5);
rewrite(fir_ch6);
rewrite(fir_ch7);
rewrite(fir_ch8);
repeat
read(in_file,lsb);
read(in_file,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
writeln(out_ch1,inttostr(var_int));

read(in_file,lsb);
read(in_file,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
writeln(out_ch2,inttostr(var_int));

read(in_file,lsb);
read(in_file,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
writeln(out_ch3,inttostr(var_int));

read(in_file,lsb);
read(in_file,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
writeln(out_ch4,inttostr(var_int));

read(in_file,lsb);
read(in_file,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
writeln(out_ch5,inttostr(var_int));

read(in_file,lsb);
read(in_file,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
writeln(out_ch6,inttostr(var_int));

read(in_file,lsb);
read(in_file,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
writeln(out_ch7,inttostr(var_int));

read(in_file,lsb);
read(in_file,msb);
msb := msb and 120;
var_int := msb;
var_int := var_int shl 5;
var_int := var_int + lsb;
var_int := var_int - 2048;
writeln(out_ch8,inttostr(var_int));

until (eof(in_file));
closefile(in_file);
reset(out_ch1);
reset(out_ch2);
reset(out_ch3);
reset(out_ch4);
reset(out_ch5);
reset(out_ch6);
reset(out_ch7);
reset(out_ch8);
progressbar1.Position := progressbar1.Position+1;

cutoff_frequency := strtoint(main_form.ch1_fir_cb.Items[main_form.ch1_fir_cb.itemindex]);
sampling_frequency := strtoint(main_form.Speed_cb.Items[main_form.Speed_cb.itemindex]);
window_width := trunc(1.5*(sampling_frequency/cutoff_frequency));
w_c := 2*Pi*cutoff_frequency/sampling_frequency;
for k := 0 to window_width do
begin
result := 0.54 - 0.46 * cos((2*k*Pi)/(window_width-1));
hamming_w[k] := result;
end;
for k := 0 to window_width do
begin
if (k = window_width/2) then  result := 2*cutoff_frequency/sampling_frequency
else  result := (sin(w_c*(k-window_width/2))) / (Pi*(k-window_width/2));
h_d[k] := result;
end;
for k := 0 to window_width do
b_n[k] :=  hamming_w[k]*h_d[k];
for c := 0 to window_width do
  begin
   readln(out_ch1,data);
   window_data[c] := strtoint(data);
  end;
repeat
sum := 0;
for c :=  0 to window_width do
  sum := sum + b_n[c]*window_data[c];
writeln(fir_ch1,floattostr(roundto(sum,-2)));
readln(out_ch1,data);
for c :=  0 to window_width do
  window_data[c] := window_data[c+1];
window_data[window_width] := strtoint(data);
until (eof(out_ch1));
closefile(out_ch1);
closefile(fir_ch1);
progressbar1.Position := progressbar1.Position+1;


cutoff_frequency := strtoint(main_form.ch2_fir_cb.Items[main_form.ch2_fir_cb.itemindex]);
sampling_frequency := strtoint(main_form.Speed_cb.Items[main_form.Speed_cb.itemindex]);
window_width := trunc(1.5*(sampling_frequency/cutoff_frequency));
w_c := 2*Pi*cutoff_frequency/sampling_frequency;
for k := 0 to window_width do
begin
result := 0.54 - 0.46 * cos((2*k*Pi)/(window_width-1));
hamming_w[k] := result;
end;
for k := 0 to window_width do
begin
if (k = window_width/2) then  result := 2*cutoff_frequency/sampling_frequency
else  result := (sin(w_c*(k-window_width/2))) / (Pi*(k-window_width/2));
h_d[k] := result;
end;
for k := 0 to window_width do
b_n[k] :=  hamming_w[k]*h_d[k];
for c := 0 to window_width do
  begin
   readln(out_ch2,data);
   window_data[c] := strtoint(data);
  end;
repeat
sum := 0;
for c :=  0 to window_width do
  sum := sum + b_n[c]*window_data[c];
writeln(fir_ch2,floattostr(roundto(sum,-2)));
readln(out_ch2,data);
for c :=  0 to window_width do
  window_data[c] := window_data[c+1];
window_data[window_width] := strtoint(data);
until (eof(out_ch2));
closefile(out_ch2);
closefile(fir_ch2);
progressbar1.Position := progressbar1.Position+1;


cutoff_frequency := strtoint(main_form.ch3_fir_cb.Items[main_form.ch3_fir_cb.itemindex]);
sampling_frequency := strtoint(main_form.Speed_cb.Items[main_form.Speed_cb.itemindex]);
window_width := trunc(1.5*(sampling_frequency/cutoff_frequency));
w_c := 2*Pi*cutoff_frequency/sampling_frequency;
for k := 0 to window_width do
begin
result := 0.54 - 0.46 * cos((2*k*Pi)/(window_width-1));
hamming_w[k] := result;
end;
for k := 0 to window_width do
begin
if (k = window_width/2) then  result := 2*cutoff_frequency/sampling_frequency
else  result := (sin(w_c*(k-window_width/2))) / (Pi*(k-window_width/2));
h_d[k] := result;
end;
for k := 0 to window_width do
b_n[k] :=  hamming_w[k]*h_d[k];
for c := 0 to window_width do
  begin
   readln(out_ch3,data);
   window_data[c] := strtoint(data);
  end;
repeat
sum := 0;
for c :=  0 to window_width do
  sum := sum + b_n[c]*window_data[c];
writeln(fir_ch3,floattostr(roundto(sum,-2)));
readln(out_ch3,data);
for c :=  0 to window_width do
  window_data[c] := window_data[c+1];
window_data[window_width] := strtoint(data);
until (eof(out_ch3));
closefile(out_ch3);
closefile(fir_ch3);
progressbar1.Position := progressbar1.Position+1;


cutoff_frequency := strtoint(main_form.ch4_fir_cb.Items[main_form.ch4_fir_cb.itemindex]);
sampling_frequency := strtoint(main_form.Speed_cb.Items[main_form.Speed_cb.itemindex]);
window_width := trunc(1.5*(sampling_frequency/cutoff_frequency));
w_c := 2*Pi*cutoff_frequency/sampling_frequency;
for k := 0 to window_width do
begin
result := 0.54 - 0.46 * cos((2*k*Pi)/(window_width-1));
hamming_w[k] := result;
end;
for k := 0 to window_width do
begin
if (k = window_width/2) then  result := 2*cutoff_frequency/sampling_frequency
else  result := (sin(w_c*(k-window_width/2))) / (Pi*(k-window_width/2));
h_d[k] := result;
end;
for k := 0 to window_width do
b_n[k] :=  hamming_w[k]*h_d[k];
for c := 0 to window_width do
  begin
   readln(out_ch4,data);
   window_data[c] := strtoint(data);
  end;
repeat
sum := 0;
for c :=  0 to window_width do
  sum := sum + b_n[c]*window_data[c];
writeln(fir_ch4,floattostr(roundto(sum,-2)));
readln(out_ch4,data);
for c :=  0 to window_width do
  window_data[c] := window_data[c+1];
window_data[window_width] := strtoint(data);
until (eof(out_ch4));
closefile(out_ch4);
closefile(fir_ch4);
progressbar1.Position := progressbar1.Position+1;


cutoff_frequency := strtoint(main_form.ch5_fir_cb.Items[main_form.ch5_fir_cb.itemindex]);
sampling_frequency := strtoint(main_form.Speed_cb.Items[main_form.Speed_cb.itemindex]);
window_width := trunc(1.5*(sampling_frequency/cutoff_frequency));
w_c := 2*Pi*cutoff_frequency/sampling_frequency;
for k := 0 to window_width do
begin
result := 0.54 - 0.46 * cos((2*k*Pi)/(window_width-1));
hamming_w[k] := result;
end;
for k := 0 to window_width do
begin
if (k = window_width/2) then  result := 2*cutoff_frequency/sampling_frequency
else  result := (sin(w_c*(k-window_width/2))) / (Pi*(k-window_width/2));
h_d[k] := result;
end;
for k := 0 to window_width do
b_n[k] :=  hamming_w[k]*h_d[k];
for c := 0 to window_width do
  begin
   readln(out_ch5,data);
   window_data[c] := strtoint(data);
  end;
repeat
sum := 0;
for c :=  0 to window_width do
  sum := sum + b_n[c]*window_data[c];
writeln(fir_ch5,floattostr(roundto(sum,-2)));
readln(out_ch5,data);
for c :=  0 to window_width do
  window_data[c] := window_data[c+1];
window_data[window_width] := strtoint(data);
until (eof(out_ch5));
closefile(out_ch5);
closefile(fir_ch5);
progressbar1.Position := progressbar1.Position+1;


cutoff_frequency := strtoint(main_form.ch6_fir_cb.Items[main_form.ch6_fir_cb.itemindex]);
sampling_frequency := strtoint(main_form.Speed_cb.Items[main_form.Speed_cb.itemindex]);
window_width := trunc(1.5*(sampling_frequency/cutoff_frequency));
w_c := 2*Pi*cutoff_frequency/sampling_frequency;
for k := 0 to window_width do
begin
result := 0.54 - 0.46 * cos((2*k*Pi)/(window_width-1));
hamming_w[k] := result;
end;
for k := 0 to window_width do
begin
if (k = window_width/2) then  result := 2*cutoff_frequency/sampling_frequency
else  result := (sin(w_c*(k-window_width/2))) / (Pi*(k-window_width/2));
h_d[k] := result;
end;
for k := 0 to window_width do
b_n[k] :=  hamming_w[k]*h_d[k];
for c := 0 to window_width do
  begin
   readln(out_ch6,data);
   window_data[c] := strtoint(data);
  end;
repeat
sum := 0;
for c :=  0 to window_width do
  sum := sum + b_n[c]*window_data[c];
writeln(fir_ch6,floattostr(roundto(sum,-2)));
readln(out_ch6,data);
for c :=  0 to window_width do
  window_data[c] := window_data[c+1];
window_data[window_width] := strtoint(data);
until (eof(out_ch6));
closefile(out_ch6);
closefile(fir_ch6);
progressbar1.Position := progressbar1.Position+1;


cutoff_frequency := strtoint(main_form.ch7_fir_cb.Items[main_form.ch7_fir_cb.itemindex]);
sampling_frequency := strtoint(main_form.Speed_cb.Items[main_form.Speed_cb.itemindex]);
window_width := trunc(1.5*(sampling_frequency/cutoff_frequency));
w_c := 2*Pi*cutoff_frequency/sampling_frequency;
for k := 0 to window_width do
begin
result := 0.54 - 0.46 * cos((2*k*Pi)/(window_width-1));
hamming_w[k] := result;
end;
for k := 0 to window_width do
begin
if (k = window_width/2) then  result := 2*cutoff_frequency/sampling_frequency
else  result := (sin(w_c*(k-window_width/2))) / (Pi*(k-window_width/2));
h_d[k] := result;
end;
for k := 0 to window_width do
b_n[k] :=  hamming_w[k]*h_d[k];
for c := 0 to window_width do
  begin
   readln(out_ch7,data);
   window_data[c] := strtoint(data);
  end;
repeat
sum := 0;
for c :=  0 to window_width do
  sum := sum + b_n[c]*window_data[c];
writeln(fir_ch7,floattostr(roundto(sum,-2)));
readln(out_ch7,data);
for c :=  0 to window_width do
  window_data[c] := window_data[c+1];
window_data[window_width] := strtoint(data);
until (eof(out_ch7));
closefile(out_ch7);
closefile(fir_ch7);
progressbar1.Position := progressbar1.Position+1;


cutoff_frequency := strtoint(main_form.ch8_fir_cb.Items[main_form.ch8_fir_cb.itemindex]);
sampling_frequency := strtoint(main_form.Speed_cb.Items[main_form.Speed_cb.itemindex]);
window_width := trunc(1.5*(sampling_frequency/cutoff_frequency));
w_c := 2*Pi*cutoff_frequency/sampling_frequency;
for k := 0 to window_width do
begin
result := 0.54 - 0.46 * cos((2*k*Pi)/(window_width-1));
hamming_w[k] := result;
end;
for k := 0 to window_width do
begin
if (k = window_width/2) then  result := 2*cutoff_frequency/sampling_frequency
else  result := (sin(w_c*(k-window_width/2))) / (Pi*(k-window_width/2));
h_d[k] := result;
end;
for k := 0 to window_width do
b_n[k] :=  hamming_w[k]*h_d[k];
for c := 0 to window_width do
  begin
   readln(out_ch8,data);
   window_data[c] := strtoint(data);
  end;
repeat
sum := 0;
for c :=  0 to window_width do
  sum := sum + b_n[c]*window_data[c];
writeln(fir_ch8,floattostr(roundto(sum,-2)));
readln(out_ch8,data);
for c :=  0 to window_width do
  window_data[c] := window_data[c+1];
window_data[window_width] := strtoint(data);
until (eof(out_ch8));
closefile(out_ch8);
closefile(fir_ch8);
progressbar1.Position := progressbar1.Position+1;

showmessage('End of processing data');


end;

procedure Teoc_form.BitBtn2Click(Sender: TObject);
var
Scale,in_data,out_data : extended;
gain : integer;
begin
if savedialog1.Execute then
begin
scale := 0.041753313*strtofloat(calibration.edit1.text);
assignfile(final_output,savedialog1.FileName+'.adf');
assignfile(fir_ch1,'c:/fir_ch1.sal');
assignfile(fir_ch2,'c:/fir_ch2.sal');
assignfile(fir_ch3,'c:/fir_ch3.sal');
assignfile(fir_ch4,'c:/fir_ch4.sal');
assignfile(fir_ch5,'c:/fir_ch5.sal');
assignfile(fir_ch6,'c:/fir_ch6.sal');
assignfile(fir_ch7,'c:/fir_ch7.sal');
assignfile(fir_ch8,'c:/fir_ch8.sal');
rewrite(final_output);
reset(fir_ch1,'c:/fir_ch1.sal');
reset(fir_ch2,'c:/fir_ch2.sal');
reset(fir_ch3,'c:/fir_ch3.sal');
reset(fir_ch4,'c:/fir_ch4.sal');
reset(fir_ch5,'c:/fir_ch5.sal');
reset(fir_ch6,'c:/fir_ch6.sal');
reset(fir_ch7,'c:/fir_ch7.sal');
reset(fir_ch8,'c:/fir_ch8.sal');
if main_form.Number_of_channel_cb.ItemIndex = 0 then
begin
repeat
readln(fir_ch1,in_data);
gain := strtoint(main_form.ch1_gain_cb.Items[main_form.ch1_gain_cb.itemindex]);
out_data := scale * in_data / gain;
writeln(final_output,floattostr(roundto(out_data,-3)));
until (eof(fir_ch1));
end;


if main_form.Number_of_channel_cb.ItemIndex = 1 then
begin
repeat
readln(fir_ch1,in_data);
gain := strtoint(main_form.ch1_gain_cb.Items[main_form.ch1_gain_cb.itemindex]);
out_data := scale * in_data / gain;
write(final_output,floattostr(roundto(out_data,-3))+' ');

readln(fir_ch2,in_data);
gain := strtoint(main_form.ch2_gain_cb.Items[main_form.ch2_gain_cb.itemindex]);
out_data := scale * in_data / gain;
writeln(final_output,floattostr(roundto(out_data,-3)));
until (eof(fir_ch1));
end;


if main_form.Number_of_channel_cb.ItemIndex = 2 then
begin
repeat
readln(fir_ch1,in_data);
gain := strtoint(main_form.ch1_gain_cb.Items[main_form.ch1_gain_cb.itemindex]);
out_data := scale * in_data / gain;
write(final_output,floattostr(roundto(out_data,-3))+' ');

readln(fir_ch2,in_data);
gain := strtoint(main_form.ch2_gain_cb.Items[main_form.ch2_gain_cb.itemindex]);
out_data := scale * in_data / gain;
write(final_output,floattostr(roundto(out_data,-3))+' ');

readln(fir_ch3,in_data);
gain := strtoint(main_form.ch3_gain_cb.Items[main_form.ch3_gain_cb.itemindex]);
out_data := scale * in_data / gain;
write(final_output,floattostr(roundto(out_data,-3))+' ');

readln(fir_ch4,in_data);
gain := strtoint(main_form.ch4_gain_cb.Items[main_form.ch4_gain_cb.itemindex]);
out_data := scale * in_data / gain;
writeln(final_output,floattostr(roundto(out_data,-3)));
until (eof(fir_ch1));
end;


if main_form.Number_of_channel_cb.ItemIndex = 3 then
begin
repeat
readln(fir_ch1,in_data);
gain := strtoint(main_form.ch1_gain_cb.Items[main_form.ch1_gain_cb.itemindex]);
out_data := scale * in_data / gain;
write(final_output,floattostr(roundto(out_data,-3))+' ');

readln(fir_ch2,in_data);
gain := strtoint(main_form.ch2_gain_cb.Items[main_form.ch2_gain_cb.itemindex]);
out_data := scale * in_data / gain;
write(final_output,floattostr(roundto(out_data,-3))+' ');

readln(fir_ch3,in_data);
gain := strtoint(main_form.ch3_gain_cb.Items[main_form.ch3_gain_cb.itemindex]);
out_data := scale * in_data / gain;
write(final_output,floattostr(roundto(out_data,-3))+' ');

readln(fir_ch4,in_data);
gain := strtoint(main_form.ch4_gain_cb.Items[main_form.ch4_gain_cb.itemindex]);
out_data := scale * in_data / gain;
write(final_output,floattostr(roundto(out_data,-3))+' ');

readln(fir_ch5,in_data);
gain := strtoint(main_form.ch5_gain_cb.Items[main_form.ch5_gain_cb.itemindex]);
out_data := scale * in_data / gain;
write(final_output,floattostr(roundto(out_data,-3))+' ');

readln(fir_ch6,in_data);
gain := strtoint(main_form.ch6_gain_cb.Items[main_form.ch6_gain_cb.itemindex]);
out_data := scale * in_data / gain;
write(final_output,floattostr(roundto(out_data,-3))+' ');

readln(fir_ch7,in_data);
gain := strtoint(main_form.ch7_gain_cb.Items[main_form.ch7_gain_cb.itemindex]);
out_data := scale * in_data / gain;
write(final_output,floattostr(roundto(out_data,-3))+' ');

readln(fir_ch8,in_data);
gain := strtoint(main_form.ch8_gain_cb.Items[main_form.ch8_gain_cb.itemindex]);
out_data := scale * in_data / gain;
writeln(final_output,floattostr(roundto(out_data,-3)));
until (eof(fir_ch1));
end;



closefile(final_output);
closefile(fir_ch1);
closefile(fir_ch2);
closefile(fir_ch3);
closefile(fir_ch4);
closefile(fir_ch5);
closefile(fir_ch6);
closefile(fir_ch7);
closefile(fir_ch8);
end;
eoc_form.Close;

end;

end.
