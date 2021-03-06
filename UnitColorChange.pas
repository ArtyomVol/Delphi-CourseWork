unit UnitColorChange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VCLTee.Series;

type
  TForm3 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    ColorDialog1: TColorDialog;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    { Private declarations }
  public                        
    serieses: TList; // ?????? ???????????? ????????
  end;

var
  Form3: TForm3;   

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  series: TLineSeries;
begin
  if ComboBox1.Items.Count > 0 then begin
    if ColorDialog1.Execute then begin
      series := serieses.Items[ComboBox1.Items.IndexOf(ComboBox1.Text)];
      series.SeriesColor := ColorDialog1.Color;
    end;
  end
  else begin  
    MessageBox(0,'??? ????????.','??????',mb_Ok);  
  end;
end;

procedure TForm3.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #27;
end;

procedure TForm3.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin  
  NewHeight := 122;
  NewWidth := 285;  
end;

procedure TForm3.FormCreate(Sender: TObject);
begin       
  Form3.Color := rgb(250, 246, 205);
end;

procedure TForm3.FormShow(Sender: TObject);
var
  i: integer;
  series: TLineSeries;
begin
  ComboBox1.Items.Clear;
  ComboBox1.Text := '';
  if serieses.Count > 0 then begin
    for i := 0 to serieses.Count - 1 do begin
      series := serieses.Items[i];
      ComboBox1.Items.Add(series.Title);
    end;    
    ComboBox1.Text := ComboBox1.Items[0];
  end;
end;

end.


