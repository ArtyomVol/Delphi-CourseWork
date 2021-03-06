unit UnitAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TForm4 = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  NewHeight := 550;
  NewWidth := 770;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  Form4.Width := 770;
end;

end.
