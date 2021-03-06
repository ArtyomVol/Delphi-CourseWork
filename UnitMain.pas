unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons, Vcl.ComCtrls, Vcl.ToolWin,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, DecomposingTimeProcess, ComboBoxActions, IniFiles,
  Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList, ActiveX, ComObj,
  Word_TLB, Excel_TLB, PowerPoint_TLB, COMDecomposingTimeProcess_TLB, ShellAPI,
  UnitTableView, UnitAbout, UnitColorChange;

type
  TForm1 = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Chart1: TChart;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Edit1: TEdit;
    Image1: TImage;
    ImageList1: TImageList;
    Ini2: TMenuItem;
    ini3: TMenuItem;
    ini4: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Word1: TMenuItem;
    Excel1: TMenuItem;
    PowerPoint1: TMenuItem;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    SaveDialog3: TSaveDialog;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    UpDown1: TUpDown;
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox5KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox6KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ini1Click(Sender: TObject);
    procedure ini3Click(Sender: TObject);
    procedure ini4Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure Word1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure PowerPoint1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LoadFromIni();
    // загрузка элементов комбобоксов из ini файла
    procedure LoadComboBoxFromIni(ComboBox: TComboBox; Section: String);
    // загрузка иформации одного комбобокса из ini-файл
    procedure SaveToIni();
    // сохранение элементов комбобоксов в ini файл
    procedure SaveComboBoxToIni(ComboBox: TComboBox; Section: String);
    // сохранение иформации из одного комбобокса в ini-файл
    procedure ResetIniFile();
    // сбросить исхожные данные и ini файл

    procedure SaveToWord();
    // сохранение информации в MsWord
    procedure PrintTitleInMsWord(MsWord: Variant);
    // печать заголовка в MsWord
    procedure PrintTextRepresentationInMsWord(MsWord: Variant);
    // сохранение текстового представления графиков и их точек в MsWord
    procedure PrintTableRepresentationInMsWord(MsWord: Variant);
    // сохранение табличного представления исходных данных в MsWord
    procedure PrintGraphicRepresentationInMsWord(MsWord: Variant);
    // сохранение графического представления графиков в MsWord

    procedure SaveToExcel();
    // сохранение информации в MsExcel
    procedure PrintGraphsInMsExcel(MsExcel: Variant);
    // сохранение графиков в виде таблиц и графиков из Excel в MsExcel
    procedure PrintDiagramInMsExcel(MsExcel: Variant);
    // сохранение графического представления графиков в MsExcel

    procedure SaveToPowerPoint();
    // сохранение графического представления графиков в MsExcel

    procedure CreateDefaultSeries(omega: String; Series: TLineSeries);
    // создание основного графика
    procedure CreateSeries(Series: TLineSeries);
    // создание основного графика

    procedure ClearComboBoxes();
    // очистка элементов комбобоксов

    procedure UpdateComboBoxesItems();
    // занесение набранного текста из комбобоксов в их элементы
    procedure ResetToDefaultComboBoxesItems();
    // сбросить элементы комбобоксов до начальных данных
    procedure ResetToDefaultComboBoxesTexts();
    // сбросить тексты комбобоксов до начальных данных

    procedure LeaveFirstNSerieses(Chart: TChart; N: integer);
    // удалить из Chart все Serieses кроме первых N
    procedure ClearChart(Chart: TChart);
    // очистка всех Serieses из Chart
    procedure Checkbox2Checked();
    // действия в случае CheckBox2.Checked
    procedure ResetChart(Chart: TChart);
    // оставить Chart пустой с 3-мя основными Serieses

    procedure EnableComboBoxes(IsEnabled: Boolean);
    // переключения доступа комбобоксов в IsEnabled

    procedure COMDrawDecomposingToTrigonometricRow(Series: TLineSeries;
    isAnimated: boolean);
  end;

var
  Form1: TForm1;
  DecomposingTimeProcess: TDecomposingTimeProcess;
  Ini: TIniFile;
  iniFileAddress: String;
  graphsData: TStringList;
  // список с текстовым представлением характеристик временного процесса
  serieses: TList; // список нарисованных графиков
  COMDecomposingTimeProcess: ICOMDecomposingTimeProcess;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ResetToDefaultComboBoxesTexts;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  CreateDefaultSeries('1', Series1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  CreateDefaultSeries('3', Series2);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  CreateDefaultSeries('5', Series3);
end;

procedure TForm1.CreateDefaultSeries(omega: string; Series: TLineSeries);
begin
  if not Series.Legend.Visible or CheckBox2.Checked then
  begin
    ComboBox6.Text := omega;
    CheckBox2Checked;
    CreateSeries(Series);
    Series.Legend.Visible := True;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  series: TLineSeries;
begin
  UpdateComboBoxesItems;
  Series := TLineSeries.Create(Chart1);
  CheckBox2Checked;
  Series.Title := 'f' + IntToStr(Chart1.SeriesCount - 2);
  Chart1.AddSeries(Series);
  CreateSeries(Series);
end;

procedure TForm1.CreateSeries(Series: TLineSeries);
begin
  if Checkbox4.Checked then begin
    COMDecomposingTimeProcess := CreateComObject(
      CLASS_COMDecomposingTimeProcess_) as ICOMDecomposingTimeProcess;
    COMDecomposingTimeProcess.Create(StrToFloat(ComboBox1.Text),
      StrToFloat(ComboBox2.Text), StrToFloat(ComboBox3.Text),
      StrToFloat(ComboBox4.Text), StrToFloat(ComboBox5.Text),
      StrToFloat(ComboBox6.Text), StrToInt(Edit1.Text));
    COMDrawDecomposingToTrigonometricRow(Series, CheckBox3.Checked);
    COMDecomposingTimeProcess := nil;
  end
  else begin
    DecomposingTimeProcess := TDecomposingTimeProcess.Create(
      StrToFloat(ComboBox1.Text), StrToFloat(ComboBox2.Text),
      StrToFloat(ComboBox3.Text), StrToFloat(ComboBox4.Text),
      StrToFloat(ComboBox5.Text), StrToFloat(ComboBox6.Text),
      StrToInt(Edit1.Text));
    DecomposingTimeProcess.DrawDecomposingToTrigonometricRow(Series, Form1,
      CheckBox3.Checked);
    DecomposingTimeProcess := nil;
  end;
  Serieses.Add(Series);
  graphsData.Add(Series.Title + '§' + ComboBox1.Text + '§' + ComboBox2.Text +
    '§' + ComboBox3.Text + '§' + ComboBox4.Text + '§' + ComboBox5.Text + '§' +
    ComboBox6.Text);
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  mainSeriesesCount: integer;
begin           
  mainSeriesesCount := 3;
  LeaveFirstNSerieses(Chart1, mainSeriesesCount);
  ClearChart(Chart1);
  serieses.Clear;
  graphsData.Clear;
end;

procedure TForm1.ClearChart(Chart: TChart);
var            
  i: integer;
begin     
  for i := 0 to chart.SeriesCount - 1 do begin
    chart.Series[i].Clear;
    chart.Series[i].Legend.Visible := False; 
  end;
end;

procedure TForm1.Checkbox2Checked();
begin
  if CheckBox2.Checked then begin
    ResetChart(Chart1);
    serieses.Clear;
    graphsData.Clear;
  end;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  Edit1.Enabled := CheckBox3.Checked;
  UpDown1.Enabled := CheckBox3.Checked;
end;

procedure TForm1.ResetChart(Chart: TChart);
var
  mainSeriesesCount: integer;
begin
  mainSeriesesCount := 3;
  LeaveFirstNSerieses(Chart1, mainSeriesesCount);
  ClearChart(Chart1);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then begin
    EnableComboBoxes(True);
                                 
    Button2.Enabled := False;
    Button3.Enabled := False;
    Button4.Enabled := False;          
    Button5.Enabled := True; 
  end
  else begin
    EnableComboBoxes(False);
       
    Button2.Enabled := True;
    Button3.Enabled := True;
    Button4.Enabled := True; 
    Button5.Enabled := False;        
    
    Button1.Click;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if length(Edit1.Text) > 0 then begin
    if strToInt(Edit1.Text) > UpDown1.Max then begin
      Edit1.Text := intToStr(UpDown1.Max);
    end
    else if strToInt(Edit1.Text) = 0 then
    begin
      Edit1.Text := '1';
    end;
  end
  else begin
    Edit1.Text := '1';
  end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#08]) then begin
    Key := #27;
  end
end;

procedure TForm1.EnableComboBoxes(IsEnabled: Boolean);
begin
  ComboBox1.Enabled := IsEnabled;
  ComboBox2.Enabled := IsEnabled;
  ComboBox3.Enabled := IsEnabled;
  ComboBox4.Enabled := IsEnabled;
  ComboBox5.Enabled := IsEnabled;
  ComboBox6.Enabled := IsEnabled;
end;

procedure TForm1.Excel1Click(Sender: TObject);
begin
  SaveToExcel();
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  ComboBoxChange(ComboBox1);
end;

procedure TForm1.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := ComboBoxKeyPress(ComboBox1, Key, ComboBox2, Form1);
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  ComboBoxChange(ComboBox2);
end;

procedure TForm1.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  Key := ComboBoxKeyPress(ComboBox2, Key, ComboBox3, Form1);
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
  ComboBoxChange(ComboBox3);
end;

procedure TForm1.ComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
  Key := ComboBoxKeyPress(ComboBox3, Key, ComboBox4, Form1);
end;

procedure TForm1.ComboBox4Change(Sender: TObject);
begin
  ComboBoxChange(ComboBox4);
end;

procedure TForm1.ComboBox4KeyPress(Sender: TObject; var Key: Char);
begin
  Key := ComboBoxKeyPress(ComboBox4, Key, ComboBox5, Form1);
end;

procedure TForm1.ComboBox5Change(Sender: TObject);
begin
  ComboBoxChange(ComboBox5);
end;

procedure TForm1.ComboBox5KeyPress(Sender: TObject; var Key: Char);
begin
  Key := ComboBoxKeyPress(ComboBox5, Key, ComboBox6, Form1);
end;

procedure TForm1.ComboBox6Change(Sender: TObject);
begin
  ComboBoxChange(ComboBox6);
end;

procedure TForm1.ComboBox6KeyPress(Sender: TObject; var Key: Char);
begin
  Key := ComboBoxKeyPress(ComboBox6, Key, Button5, Form1);
end;

procedure TForm1.UpdateComboBoxesItems;
begin
  UpdateComboBoxItems(ComboBox1);
  UpdateComboBoxItems(ComboBox2);
  UpdateComboBoxItems(ComboBox3);
  UpdateComboBoxItems(ComboBox4);
  UpdateComboBoxItems(ComboBox5);
  UpdateComboBoxItems(ComboBox6);
end;

procedure TForm1.Word1Click(Sender: TObject);
begin
  SaveToWord();
end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  NewHeight := 550;
  NewWidth := 770;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveToIni;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Color := rgb(250, 246, 205);
  iniFileAddress := 'D:\Моё\Лабараторные\2 Курс\РПВС\курсовая\\Inform.ini';
  LoadFromIni;
  ResetToDefaultComboBoxesTexts;
  Chart1.Axes.Left.Title.Angle := 0;
  serieses := TList.Create;
  graphsData := TStringList.Create;
end;

procedure TForm1.FormShow(Sender: TObject);
var
Time:extended;
begin
  Time := GetTickCount()/1000; //запомнить время
  Form4.BitBtn1.Visible := False;
  Form4.Show;
  Form4.Repaint;
  while GetTickCount/1000<Time+3 do;
  Form4.Close;
  Form4.BitBtn1.Visible := True;
end;

procedure TForm1.ini1Click(Sender: TObject);
var
  f: File;
begin
  ClearComboBoxes;
  ResetToDefaultComboBoxesItems;
  ResetToDefaultComboBoxesTexts;
  DeleteFile(iniFileAddress);
  Ini.Destroy;
  AssignFile(f, iniFileAddress);
  Rewrite(f);
  CloseFile(f);
  Ini := TIniFile.Create(iniFileAddress);
  SaveToIni;
end;

procedure TForm1.ini3Click(Sender: TObject);
begin
  resetIniFile();
end;

procedure TForm1.ini4Click(Sender: TObject);
begin
  SaveToIni;
end;

procedure TForm1.ResetToDefaultComboBoxesItems;
begin
  ComboBox1.Items.Add('500');
  ComboBox2.Items.Add('5');
  ComboBox3.Items.Add('0');
  ComboBox4.Items.Add('100');
  ComboBox5.Items.Add('0,5');
  ComboBox6.Items.Add('1');
  ComboBox6.Items.Add('2');
  ComboBox6.Items.Add('3');
end;

procedure TForm1.ResetToDefaultComboBoxesTexts;
begin
  ComboBox1.Text := '500';
  ComboBox2.Text := '5';
  ComboBox3.Text := '0';
  ComboBox4.Text := '100';
  ComboBox5.Text := '0,5';
  ComboBox6.Text := '1';
end;

procedure TForm1.ClearComboBoxes;
begin
  ComboBox1.Clear;
  ComboBox2.Clear;
  ComboBox3.Clear;
  ComboBox4.Clear;
  ComboBox5.Clear;
  ComboBox6.Clear;
end;

procedure TForm1.LeaveFirstNSerieses(Chart: TChart; N: Integer);
var
  i: integer;
begin
  for i := N to Chart.SeriesCount - 1 do begin
    Chart.Series[N].Destroy;
  end;
end;

procedure TForm1.LoadFromIni;
var
  f: File;
begin
  if FileExists(iniFileAddress) then
  begin
    Ini := TIniFile.Create(iniFileAddress);
    LoadComboBoxFromIni(ComboBox1, 'ComboBox1 (P)');
    LoadComboBoxFromIni(ComboBox2, 'ComboBox2 (x)');
    LoadComboBoxFromIni(ComboBox3, 'ComboBox3 (t0)');
    LoadComboBoxFromIni(ComboBox4, 'ComboBox4 (tk)');
    LoadComboBoxFromIni(ComboBox5, 'ComboBox5 (h)');
    LoadComboBoxFromIni(ComboBox6, 'ComboBox6 (omega)');
  end
  else
  begin
    //  Создание ini-файла
    AssignFile(f, iniFileAddress);
    Rewrite(f);
    CloseFile(f);
    Ini := TIniFile.Create(iniFileAddress);
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'D:\Моё\Лабараторные\2 Курс\РПВС\Курсовая\Help.chm',
  nil, nil, SW_SHOW);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  Form2.serieses := serieses;
  Form2.ShowModal;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  Form3.serieses := serieses;
  Form3.ShowModal;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Form4.ShowModal;
end;

procedure TForm1.LoadComboBoxFromIni(ComboBox: TComboBox; Section: string);
var
  count, i: integer;
begin
  count := Ini.ReadInteger(Section, 'count', 0);
  for i := 1 to count do
  begin
    ComboBox.Items.Add(Ini.ReadString(Section, 'Строка ' + IntToStr(i), '0'));
  end;
end;

procedure TForm1.SaveToIni;
begin
  SaveComboBoxToIni(ComboBox1, 'ComboBox1 (P)');
  SaveComboBoxToIni(ComboBox2, 'ComboBox2 (x)');
  SaveComboBoxToIni(ComboBox3, 'ComboBox3 (t0)');
  SaveComboBoxToIni(ComboBox4, 'ComboBox4 (tk)');
  SaveComboBoxToIni(ComboBox5, 'ComboBox5 (h)');
  SaveComboBoxToIni(ComboBox6, 'ComboBox6 (omega)');
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  Form2.serieses := serieses;
  Form2.ShowModal;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  SaveToIni;
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
  resetIniFile();
end;

procedure TForm1.ToolButton6Click(Sender: TObject);
begin
  SaveToWord();
end;

procedure TForm1.ToolButton7Click(Sender: TObject);
begin
  SaveToExcel();
end;

procedure TForm1.ToolButton8Click(Sender: TObject);
begin
  SaveToPowerPoint();
end;

procedure TForm1.SaveComboBoxToIni(ComboBox: TComboBox; Section: string);
var
  i: integer;
begin
  Ini.WriteString(Section, 'count',
                  IntToStr(ComboBox.Items.Count));
  for i:=0 to ComboBox.Items.Count - 1 do
  begin
    Ini.WriteString(Section, 'Строка ' + IntToStr(i+1),
    ComboBox.Items[i]);
  end;
end;

procedure TForm1.resetIniFile;
var
  f: File;
begin
  ClearComboBoxes;
  ResetToDefaultComboBoxesItems;
  ResetToDefaultComboBoxesTexts;
  DeleteFile(iniFileAddress);
  Ini.Destroy;
  AssignFile(f, iniFileAddress);
  Rewrite(f);
  CloseFile(f);
  Ini := TIniFile.Create(iniFileAddress);
  SaveToIni;
end;

procedure TForm1.SaveToWord;
var
  ServerIsRunning: Boolean;
  Unknow: IInterface;
  Result: HResult;
  AppProgID: String;
  MsWord: Variant;
begin
  AppProgID := 'Word.Application';
  ServerIsRunning := False;
  Result := GetActiveObject(ProgIDToClassID(AppProgID), nil, Unknow);
  if (Result = MK_E_UNAVAILABLE) then begin
    //создать 1 экземпляр сервера
    MsWord := CreateOleObject(AppProgID);
  end
  else begin
    // соединить с уже запущенной копией сервера
    MsWord := GetActiveOleObject(AppProgID);
    ServerIsRunning := True;
  end;
  MsWord.Documents.Add;

  MsWord.Visible := True;

  PrintTitleInMsWord(MsWord);
  PrintTextRepresentationInMsWord(MsWord);
  PrintTableRepresentationInMsWord(MsWord);
  PrintGraphicRepresentationInMsWord(MsWord);

  if SaveDialog1.Execute then begin
    MSWord.ActiveDocument.SaveAs(SaveDialog1.FileName);
  end;

  if not ServerIsRunning then begin
    MsWord.Quit;
  end;
  MsWord := Unassigned;
end;

procedure TForm1.PrintTitleInMsWord(MsWord: Variant);
begin
  MsWord.Selection.ParagraphFormat.Alignment := wdAlignParagraphCenter;
  MsWord.Selection.Font.Bold := wdToggle;
  MsWord.Selection.Font.Name := 'Times New Roman';
  MsWord.Selection.TypeText('РАЗЛОЖЕНИЕ ВРЕМЕННОГО ПРОЦЕССА В ' +
    'ТРИГОНАМЕТРИЧЕСКИЙ РЯД');
  MsWord.Selection.TypeParagraph;
  MsWord.Selection.Font.Bold := wdToggle;
end;

procedure TForm1.PrintTextRepresentationInMsWord(MsWord: Variant);
var
  i, j: integer;
  series: TLineSeries;
  str: string;
begin
  MsWord.Selection.Font.Bold := wdToggle;
  MsWord.Selection.TypeText('ТЕКСТОВОЕ ПРЕДСТАВЛЕНИЕ');
  MsWord.Selection.TypeParagraph;
  MsWord.Selection.ParagraphFormat.Alignment := wdAlignParagraphJustify;
  if serieses.Count > 0 then begin
    for i := 0 to serieses.Count - 1 do begin
      series := serieses.Items[i];
      MsWord.Selection.TypeText(#9'Временной процесс: ' + series.Title);
      MsWord.Selection.Font.Bold := wdToggle;
      MsWord.Selection.TypeParagraph;
      str := '';
      for j := 0 to series.XValues.Count - 1 do begin
        str := str + IntToStr(j+1) + ') t = ' + FloatToStr(Series.XValue[j]) +
          '    F(t) = ' + FloatToStr(Series.YValue[j]) + #13;
      end;
      MsWord.Selection.TypeText(str);
      MsWord.Selection.Font.Bold := wdToggle;
    end;
  end
  else begin
    MsWord.Selection.TypeText(#9'Временных процессов нет.');
  end;
  MsWord.Selection.Font.Bold := wdToggle;
end;

procedure TForm1.PrintTableRepresentationInMsWord(MsWord: Variant);
var
  Rng, WordTable: Variant;
  i: integer;
begin
  MsWord.Selection.EndKey(wdStory);
  MSWord.Selection.InsertBreak(wdColumnBreak);
  MsWord.Selection.ParagraphFormat.Alignment := wdAlignParagraphCenter;
  MsWord.Selection.Font.Bold := wdToggle;
  MsWord.Selection.TypeText('ИСХОДНЫЕ ДАННЫЕ ВРЕМЕННЫХ ПРОЦЕССОВ');
  MsWord.Selection.Font.Bold := wdToggle;
  MsWord.Selection.TypeParagraph;
  if serieses.Count > 0 then begin
    Rng := MSWord.Selection.Range;
    Rng.Collapse(wdCollapseEnd);
    // § = alt + 21
    Rng.InsertAfter('Имя§P§x§T0§Tk§h§ω');
    Rng.InsertParagraphAfter;
    for i := 0 to serieses.Count - 1 do begin
      Rng.InsertAfter(graphsData[i]);
      Rng.InsertParagraphAfter;
    end;
    Rng.ConvertToTable('§');
    WordTable := MsWord.ActiveDocument.Tables.Item(1);
    WordTable.Style := 'Сетка таблицы'; // делаем линии чёрными
  end
  else begin
    MsWord.Selection.TypeText(#9'Временных процессов нет.');
  end;
end;

procedure TForm1.PrintGraphicRepresentationInMsWord(MsWord: Variant);
begin
  MsWord.Selection.EndKey(wdStory);
  MSWord.Selection.InsertBreak(wdColumnBreak);
  MsWord.Selection.ParagraphFormat.Alignment := wdAlignParagraphCenter;
  MsWord.Selection.Font.Bold := wdToggle;
  MsWord.Selection.TypeText('ГРАФИЧЕСКОЕ ПРЕДСТАВЛЕНИЕ');
  MsWord.Selection.Font.Bold := wdToggle;
  MsWord.Selection.TypeParagraph;
  Chart1.CopyToClipboardBitmap;
  MsWord.Selection.Paste;
end;

procedure TForm1.SaveToExcel;
var
  ServerIsRunning: Boolean;
  Unknow: IInterface;
  Result: HResult;
  AppProgID: String;
  MsExcel: Variant;
begin
  AppProgID := 'Excel.Application';
  ServerIsRunning := False;
  Result := GetActiveObject(ProgIDToClassID(AppProgID), nil, Unknow);
  if (Result = MK_E_UNAVAILABLE) then begin
    //создать 1 экземпляр сервера
    MsExcel := CreateOleObject(AppProgID);
  end
  else begin
    // соединить с уже запущенной копией сервера
    MsExcel := GetActiveOleObject(AppProgID);
    ServerIsRunning := True;
  end;

  MsExcel.WorkBooks.Add;
  MsExcel.Visible := True;

  PrintDiagramInMsExcel(MsExcel);
  PrintGraphsInMsExcel(MsExcel);

  if SaveDialog2.Execute then begin
    MsExcel.ActiveWorkBook.SaveAs(SaveDialog2.FileName);
  end;

  if not ServerIsRunning then begin
    MsExcel.Quit;
  end;
  MsExcel := Unassigned;
end;

procedure TForm1.PrintGraphsInMsExcel(MsExcel: Variant);
var
  i1, i2, j1, j2: integer;
  Sheet, AdditionalSheet: Variant;
  series: TLineSeries;
begin
  Sheet := MsExcel.ActiveSheet; // главный лист
  Sheet.Name := 'Временные процессы';
  j1 := 11;
  j2 := 12;
  if serieses.Count > 0 then begin
    AdditionalSheet := MsExcel.Sheets.Add(emptyparam, Sheet); // лист с 1-им графиком
    for i1 := 0 to serieses.Count - 1 do begin
      Series := Serieses.Items[i1];

      Sheet.Cells[1,j1] := series.Title;
      Sheet.Cells[2,j1] := 't';
      Sheet.Cells[2,j2] := 'F(t)';

      AdditionalSheet.Name := series.Title;
      AdditionalSheet.Cells[1,1] := 't';
      AdditionalSheet.Cells[1,2] := 'F(t)';

      for i2 := 0 to Series.XValues.Count - 1 do begin
        Sheet.Cells[i2 + 3,j1] := Series.XValues[i2];
        Sheet.Cells[i2 + 3,j2] := Series.YValues[i2];
        AdditionalSheet.Cells[i2 + 2, 1] := Series.XValues[i2];
        AdditionalSheet.Cells[i2 + 2, 2] := Series.YValues[i2];
      end;

      MsExcel.ActiveSheet.Shapes.AddChart2(227, xlXYScatterSmoothNoMarkers).Select;
      MsExcel.ActiveChart.ChartTitle.Text := series.Title;
      MsExcel.ActiveChart.FullSeriesCollection(1).Select;
      MsExcel.Selection.Format.Line.ForeColor.RGB := Series.SeriesColor;
      Inc(j1);
      Inc(j1);
      Inc(j2);
      Inc(j2);
      AdditionalSheet := MsExcel.Sheets.Add(emptyparam, AdditionalSheet);
    end;
    AdditionalSheet.Delete;
  end;
end;

procedure TForm1.PowerPoint1Click(Sender: TObject);
begin
  SaveToPowerPoint();
end;

procedure TForm1.PrintDiagramInMsExcel(MsExcel: Variant);
begin
  Chart1.CopyToClipboardBitmap;
  MsExcel.ActiveSheet.Paste;
end;

procedure TForm1.SaveToPowerPoint;
var
  ServerIsRunning: Boolean;
  Unknow: IInterface;
  Result: HResult;
  AppProgID: String;
  MsPowerPoint: Variant;
begin
  AppProgID := 'PowerPoint.Application';
  ServerIsRunning := False;
  Result := GetActiveObject(ProgIDToClassID(AppProgID), nil, Unknow);
  if (Result = MK_E_UNAVAILABLE) then begin
    //создать 1 экземпляр сервера
    MsPowerPoint := CreateOleObject(AppProgID);
  end
  else begin
    // соединить с уже запущенной копией сервера
    MsPowerPoint := GetActiveOleObject(AppProgID);
    ServerIsRunning := True;
  end;

  MsPowerPoint.Presentations.Add;
  MsPowerPoint.Visible := True;

  MsPowerPoint.ActivePresentation.Slides.Add(1,ppLayoutBlank);
  MsPowerPoint.ActivePresentation.SlideMaster.ColorScheme.Colors(ppBackGround).RGB :=
    rgb(250, 246, 205);
  Chart1.CopyToClipboardBitmap;
  MsPowerPoint.ActivePresentation.Slides.Item(1).Shapes.Paste.Select;
  MsPowerPoint.ActiveWindow.Selection.ShapeRange.Top := 0;
//  MsPowerPoint.ActiveWindow.Selection.ShapeRange.Width := 960;
  MsPowerPoint.ActiveWindow.Selection.ShapeRange.Height := 540;
  MsPowerPoint.ActiveWindow.Selection.ShapeRange.Left :=
    (960 - MsPowerPoint.ActiveWindow.Selection.ShapeRange.Width) / 2;

  if SaveDialog3.Execute then begin
    MsPowerPoint.ActivePresentation.SaveAs(SaveDialog3.FileName);
  end;

  if not ServerIsRunning then begin
    MsPowerPoint.Quit;
  end;
  MsPowerPoint := Unassigned;
end;

procedure TForm1.COMDrawDecomposingToTrigonometricRow(Series: TLineSeries;
isAnimated: Boolean);
var
  repaintCount: integer;
  endTimeMoment, intialTimeMoment, timeChangeStep,
  time,
  dTime, // сколько прошло тиков после перерисования формы
  dTimeMax: real; // макс. кол-во тиков без перерисования формы
begin
  repaintCount := COMDecomposingTimeProcess.ARepaintCount;
  endTimeMoment := COMDecomposingTimeProcess.AEndTimeMoment;
  intialTimeMoment := COMDecomposingTimeProcess.AIntialTimeMoment;
  timeChangeStep := COMDecomposingTimeProcess.ATimeChangeStep;
  dTime := 0;
  dTimeMax := (endTimeMoment - intialTimeMoment) / repaintCount;
  Series.Clear;
  time := intialTimeMoment;
  while time <= endTimeMoment do begin
    if isAnimated then
    begin
      dTime := dTime + timeChangeStep;
      if dTime >= dTimeMax then begin
        dTime := 0;
        Form1.Repaint;
        Sleep(0);
      end;
    end;
    Series.AddXY(time, COMDecomposingTimeProcess.CalculateFunction(time));
    time := time + timeChangeStep;
  end;
  if time < endTimeMoment + timeChangeStep/2 then begin
    Series.AddXY(endTimeMoment,
    COMDecomposingTimeProcess.CalculateFunction(endTimeMoment));
  end;
end;

end.
