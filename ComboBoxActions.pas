unit ComboBoxActions;

interface
uses
  Vcl.StdCtrls, Vcl.Controls, System.SysUtils, Vcl.Forms;

  procedure ComboBoxChange(ComboBox: TComboBox);
  function ComboBoxKeyPress(ComboBox: TComboBox; Key: Char;
  NextFormComponent: TWinControl; Form: TForm): char;
  function ComboBoxKeyIsEnter(ComboBox: TComboBox;
  NextFormComponent: TWinControl; Form: TForm): char;
  function ComboBoxKeyIsComma(ComboBox: TComboBox): char;

  procedure UpdateComboBoxItems(ComboBox: TComboBox);

implementation

procedure ComboBoxChange(ComboBox: TComboBox);
var
  str, newStr: String;
  i : integer;
begin
  str := Combobox.Text;
  if (Pos(',', str) = 1) then begin
    for i := 1 to str.Length do begin
      newStr := newStr + str.Chars[i];
    end;
    Combobox.Text := newStr;
  end
end;

function ComboBoxKeyPress(ComboBox: TComboBox; Key: Char;
NextFormComponent: TWinControl; Form: TForm): Char;
var
  str: String;
begin
  str := Combobox.Text;
  if (Key = #13) and (Length(str)>0) then begin
    result := ComboBoxKeyIsEnter(ComboBox, NextFormComponent, Form);
  end
  else if (Key = ',') then begin
    result := ComboBoxKeyIsComma(ComboBox);
  end
  else if not (Key in ['0'..'9',#08]) then begin
    result := #27;
  end
  else begin
    result := Key;
  end;
end;

function ComboBoxKeyIsEnter(ComboBox: TComboBox;
NextFormComponent: TWinControl; Form: TForm): Char;
var
  str: String;
begin
  str := ComboBox.Text;
  if Pos(',', str) = str.Length then begin
    str := str + '0';
    ComboBox.Text := str;
  end;
  if ComboBox.Items.IndexOf(str)<0 then begin
    ComboBox.Items.Add(str);
  end;
  Form.ActiveControl := NextFormComponent;
  result := #27;
end;

function ComboBoxKeyIsComma(ComboBox: TComboBox): Char;
var
  str: String;
begin
  str := Combobox.Text;
  if (Length(str) = 0) then begin
    result := #27;
  end
  else if Pos(',', str) > 0 then begin
    result := #27;
  end
  else begin
    result := ',';
  end;
end;

procedure UpdateComboBoxItems(ComboBox: TComboBox);
var
  str: String;
begin
  str := ComboBox.Text;
  if ComboBox.Items.IndexOf(str)<0 then begin
    ComboBox.Items.Add(str);
  end;
end;

end.
