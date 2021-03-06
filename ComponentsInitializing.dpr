library ComponentsInitializing;

uses
  System.SysUtils,
  System.Classes,
  Vcl.Grids,
  Vcl.Controls,
  Vcl.ComCtrls;

{$R *.res}

procedure InitializeStringGrid(StringGrid: TStringGrid; Parent: TWinControl;
  Left, Top, Width, Height, ColCount, RowCount: Integer); stdcall;
begin
  StringGrid.Parent := Parent;
  StringGrid.Left := Left;
  StringGrid.Top := Top;
  StringGrid.Width := Width;
  StringGrid.Height := Height;
  StringGrid.ColCount := ColCount;
  StringGrid.RowCount := RowCount;
end;

procedure InitializeTabSheet(TabSheet: TTabSheet; PageControl: TPageControl;
Left: Integer; Top: Integer; Width: Integer; Height: Integer;
Caption: TCaption); stdcall;
begin
  TabSheet.Parent := PageControl;
  TabSheet.PageControl := PageControl;
  PageControl.SelectNextPage(True);
  TabSheet.Left := Left;
  TabSheet.Top := Top;
  TabSheet.Width := Width;
  TabSheet.Height := Height;
  TabSheet.Caption := Caption;
end;

exports InitializeStringGrid, InitializeTabSheet;

begin
end.
