unit DynamicallyCreatingFormComponents;

interface

uses
  Vcl.Graphics, System.Classes, Vcl.Controls, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, VCLTee.Chart, VCLTee.Series, Vcl.Buttons,
  Vcl.Grids;

  procedure initializeBevel(Bevel: TBevel; Parent: TWinControl; Left, Top,
  Width, Height: Integer; Shape: TBevelShape);

  procedure initializeEdit(Edit: TEdit; Parent: TWinControl; Left, Top, Width,
  Height: Integer;
  Text: TCaption);

  procedure initializePageControl(PageControl: TPageControl;
  Parent: TWinControl; Left, Top, Width, Height: Integer);

  procedure initializeTabSheet(TabSheet: TTabSheet; PageControl: TPageControl;
  Left, Top, Width, Height: Integer; Caption: TCaption);

  procedure initializeLabel(Label0: TLabel; Parent: TWinControl; Left,
  Top: Integer; Caption: TCaption; FontSize: Integer; AutoSize: Boolean;
  Width, Height: Integer; Aligment: TAlignment);

  procedure initializeColorBox(ColorBox: TColorBox; Parent: TWinControl; Left,
  Top, Width, Height: Integer; color: TColor);

  procedure initializeButton(Button: TButton; Parent: TWinControl; Left, Top,
  Width, Height: Integer; Caption: TCaption);

  procedure initializeBitBtn(BitBtn: TBitBtn; Parent: TWinControl; Left, Top,
  Width, Height: Integer; Caption: TCaption; Kind: TBitBtnKind);

  procedure initializeImage(Image: TImage; Parent: TWinControl; Left, Top,
  Width, Height: Integer; FileName: string; Proportional: Boolean);

  procedure initializeChart(Chart: TChart; Parent: TWinControl; Left, Top,
  Width, Height: Integer; Title: string; LegendVisible: Boolean;
  View3D: Boolean);

  procedure initializeLineSeries(Series: TLineSeries; Chart: TChart;
  Title: string);

  procedure initializeAreaSeries(Series: TAreaSeries; Chart: TChart;
  Title: string; UseYOrigin: Boolean; AreaLinesPenVisible: Boolean);

  procedure initializeCheckBox(CheckBox: TCheckBox; Parent: TWinControl; Left,
  Top, Width, Height: Integer; Caption: TCaption; Checked: Boolean);

  procedure initializeRadioGroup(RadioGroup: TRadioGroup; Parent: TWinControl;
  Left, Top, Width, Height: Integer; Caption: TCaption; Items: TStringList;
  ItemIndex: Integer);

  procedure initializeStringGrid(StringGrid: TStringGrid; Parent: TWinControl;
  Left, Top, Width, Height, ColCount, RowCount: Integer);

implementation

procedure initializeBevel(Bevel: TBevel; Parent: TWinControl; Left: Integer;
Top: Integer; Width: Integer; Height: Integer; Shape: TBevelShape);
begin
  Bevel.Parent := Parent;
  Bevel.Left := Left;
  Bevel.Top := Top;
  Bevel.Width := Width;
  Bevel.Height := Height;
  Bevel.Shape := Shape;
end;

procedure initializeEdit(Edit: TEdit; Parent: TWinControl; Left: Integer;
Top: Integer; Width: Integer; Height: Integer; Text: TCaption);
begin
  Edit.Parent := Parent;
  Edit.Left := Left;
  Edit.Top := Top;
  Edit.Width := Width;
  Edit.Height := Height;
  Edit.Text := Text;
end;

procedure initializePageControl(PageControl: TPageControl;
Parent: TWinControl; Left: Integer; Top: Integer; Width: Integer;
Height: Integer);
begin
  PageControl.Parent := Parent;
  PageControl.Left := Left;
  PageControl.Top := Top;
  PageControl.Width := Width;
  PageControl.Height := Height;
end;


procedure initializeTabSheet(TabSheet: TTabSheet; PageControl: TPageControl;
Left: Integer; Top: Integer; Width: Integer; Height: Integer;
Caption: TCaption);
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

procedure initializeLabel(Label0: TLabel; Parent: TWinControl; Left: Integer;
Top: Integer; Caption: TCaption; FontSize: Integer; AutoSize: Boolean;
Width: Integer; Height: Integer; Aligment: TAlignment);
begin
  Label0.Parent := Parent;
  Label0.Left := Left;
  Label0.Top := Top;
  label0.Font.Size := FontSize;
  label0.AutoSize := AutoSize;
  label0.Width := Width;
  label0.Height := Height;
  label0.Alignment := Aligment;
  Label0.Caption := Caption;
end;

procedure initializeColorBox(ColorBox: TColorBox; Parent: TWinControl;
Left: Integer; Top: Integer; Width: Integer; Height: Integer; color: TColor);
begin
  ColorBox.Parent := Parent;
  ColorBox.Left := Left;
  ColorBox.Top := Top;
  ColorBox.Width := Width;
  ColorBox.Height := Height;
  ColorBox.Selected := Color;
end;

procedure initializeButton(Button: TButton; Parent: TWinControl; Left: Integer;
Top: Integer; Width: Integer; Height: Integer; Caption: TCaption);
begin
  Button.Parent := Parent;
  Button.Left := Left;
  Button.Top := Top;
  Button.Width := Width;
  Button.Height := Height;
  Button.Caption := Caption;
end;

procedure initializeBitBtn(BitBtn: TBitBtn; Parent: TWinControl; Left, Top,
Width, Height: Integer; Caption: TCaption; Kind: TBitBtnKind);
begin
  BitBtn.Parent := Parent;
  BitBtn.Left := Left;
  BitBtn.Top := Top;
  BitBtn.Width := Width;
  BitBtn.Height := Height;
  BitBtn.Caption := Caption;
  BitBtn.Kind := Kind;
end;

procedure initializeImage(Image: TImage; Parent: TWinControl; Left: Integer;
Top: Integer; Width: Integer; Height: Integer; FileName: string;
Proportional: Boolean);
begin
  Image.Parent := Parent;
  Image.Left := Left;
  Image.Top := Top;
  Image.Width := Width;
  Image.Height := Height;
  Image.Picture.LoadFromFile(FileName);
  Image.Proportional := Proportional;
end;

procedure initializeChart(Chart: TChart; Parent: TWinControl; Left: Integer;
Top: Integer; Width: Integer; Height: Integer; Title: string;
legendVisible: boolean; View3D: Boolean);
begin
  Chart.Parent := Parent;
  Chart.Left := Left;
  Chart.Top := Top;
  Chart.Width := Width;
  Chart.Height := Height;
  Chart.Title.Caption := Title;
  Chart.Legend.Visible := LegendVisible;
  Chart.View3D := View3D;
end;

procedure initializeLineSeries(Series: TLineSeries; Chart: TChart;
Title: string);
begin
  Series.ParentChart := Chart;
  Series.Title := Title;
end;

procedure initializeAreaSeries(Series: TAreaSeries; Chart: TChart;
Title: string; UseYOrigin: Boolean; AreaLinesPenVisible: Boolean);
begin
  Series.ParentChart := Chart;
  Series.Title := Title;
  Series.UseYOrigin := UseYOrigin;
  Series.AreaLinesPen.Visible := AreaLinesPenVisible;
end;

procedure initializeCheckBox(CheckBox: TCheckBox; Parent: TWinControl; Left,
Top, Width, Height: Integer; Caption: TCaption; Checked: Boolean);
begin
  CheckBox.Parent := Parent;
  CheckBox.Left := Left;
  CheckBox.Top := Top;
  CheckBox.Width := Width;
  CheckBox.Height := Height;
  CheckBox.Caption := Caption;
  CheckBox.Checked := Checked;
end;

procedure initializeRadioGroup(RadioGroup: TRadioGroup; Parent: TWinControl;
Left, Top, Width, Height: Integer; Caption: TCaption; Items: TStringList;
ItemIndex: Integer);
begin
  RadioGroup.Parent := Parent;
  RadioGroup.Left := Left;
  RadioGroup.Top := Top;
  RadioGroup.Width := Width;
  RadioGroup.Height := Height;
  RadioGroup.Caption := Caption;
  RadioGroup.Items := Items;
  RadioGroup.ItemIndex := ItemIndex;
end;

procedure initializeStringGrid(StringGrid: TStringGrid; Parent: TWinControl;
  Left, Top, Width, Height, ColCount, RowCount: Integer);
begin
  StringGrid.Parent := Parent;
  StringGrid.Left := Left;
  StringGrid.Top := Top;
  StringGrid.Width := Width;
  StringGrid.Height := Height;
  StringGrid.ColCount := ColCount;
  StringGrid.RowCount := RowCount;
end;

end.
