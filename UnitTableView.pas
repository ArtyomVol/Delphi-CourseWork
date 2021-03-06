unit UnitTableView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Grids, Vcl.StdCtrls, VclTee.Series;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormShow(Sender: TObject);
  private
    procedure loadProcedureFromDLL();
  public
    serieses: TList; // ?????? ???????????? ????????
    procedure AddNewSheet(Series: TLineSeries);
    { Public declarations }
  end;
  TInitializeStringGrid = procedure (StringGrid: TStringGrid;
  Parent: TWinControl; Left, Top, Width, Height, ColCount,
  RowCount: Integer); stdcall;
  TInitializeTabSheet = procedure (TabSheet: TTabSheet;
  PageControl: TPageControl; Left: Integer; Top: Integer; Width: Integer;
  Height: Integer; Caption: TCaption); stdcall;

var
  Form2: TForm2;
  HLib: THandle;
  AInitializeStringGrid: TInitializeStringGrid;
  AInitializeTabSheet: TInitializeTabSheet;

implementation

{$R *.dfm}

procedure TForm2.AddNewSheet(Series: TLineSeries);
var
  TabSheet: TTabSheet;
  StringGrid: TStringGrid;
  i: integer;
begin
  TabSheet := TTabSheet.Create(PageControl1);
  AInitializeTabSheet(TabSheet, PageControl1, 4, 24, 1085, 101, Series.Title);
  StringGrid := TStringGrid.Create(TabSheet);
  AInitializeStringGrid(StringGrid, TabSheet, 3, 3, 1085, 97,
    Series.XValues.Count + 1, 3);
  StringGrid.Cells[0,1] := 'x';
  StringGrid.Cells[0,2] := 'y';
  for i:=1 to Series.XValues.Count + 1 do
  begin
    StringGrid.Cells[i, 0] := intToStr(i);
    StringGrid.Cells[i, 1] := floatToStrf(Series.XValues[i-1], ffFixed, 8, 3);
    StringGrid.Cells[i, 2] := floatToStrf(Series.YValues[i-1], ffFixed, 8, 3);
  end;
end;

procedure TForm2.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  NewHeight := 174;
  NewWidth := 1121;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  for i := 0 to PageControl1.PageCount - 1 do
  begin
    PageControl1.Pages[0].Destroy;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form2.Color := rgb(250, 246, 205);
end;

procedure TForm2.FormShow(Sender: TObject);
var
  i: integer;
begin
  loadProcedureFromDLL();
  for i := 0 to serieses.Count - 1 do
  begin
    Form2.AddNewSheet(serieses.Items[i]);
  end;
  FreeLibrary(HLib);
end;

procedure TForm2.loadProcedureFromDLL;
begin
  // ???????? DLL
  HLib := 0;
  HLib := LoadLibrary('ComponentsInitializing.dll');
  if HLib = 0 then
  begin
    MessageBox(0,'?????????? ComponentsInitializing.dll ?? ???????', '??????',
     mb_Ok);
    Form2.CloseModal;
    Exit;
  end;
  @AInitializeStringGrid := GetProcAddress(HLib, 'InitializeStringGrid');
  if not Assigned(AInitializeStringGrid) then
  begin
    MessageBox(0, '????? InitializeStringGrid ? ?????????? ' +
    'ComponentsInitializing.dll ?? ??????', '??????', mb_Ok);
    Form2.Close;
  end;
  @AInitializeTabSheet := GetProcAddress(HLib, 'InitializeTabSheet');
  if not Assigned(AInitializeTabSheet) then
  begin
    MessageBox(0, '????? InitializeTabSheet ? ?????????? ' +
    'ComponentsInitializing.dll ?? ??????', '??????', mb_Ok);
    Form2.Close;
  end;
end;

end.
