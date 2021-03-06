unit DecomposingTimeProcess;

interface

uses
  Vcl.Forms, Winapi.Windows, VCLTee.Series, System.SysUtils;

type
  TDecomposingTimeProcess = class
    private P: real; // сила P (в ньютонах)
    private x: real; // расстояние, на котором приложена сила x (в метрах)
    private intialTimeMoment: real; // начальный момент времени (в секундах)
    private endTimeMoment: real; // конечный момент времени (в секундах)
    private timeChangeStep: real; // шаг изменения времени (в секундах)
    private omega: real; // переменная омега
    private repaintCount: integer;
    // количество перерисовок (обновление формы) при анимации

    private function getP(): real; // получить силу
    private procedure setP(AP: real); // установить силу
    public Property AP: real read getP write setP;
    private function getX(): real; // получить расстояние
    private procedure setX(AX: real); // установить расстояние
    public Property AX: real read getX write setX;
    private function getIntialTimeMoment(): real;
    // получить начальный момент времени
    private procedure setIntialTimeMoment(AIntialTimeMoment: real);
    // установить начальный момент времени
    public Property AIntialTimeMoment: real read getIntialTimeMoment
     write setIntialTimeMoment;
    private function getEndTimeMoment(): real;
    // получить конечный момент времени
    private procedure setEndTimeMoment(AEndTimeMoment: real);
    // установить конечный момент времени
    public Property AEndTimeMoment: real read getEndTimeMoment
     write setEndTimeMoment;
    private function getTimeChangeStep(): real;
    // получить шаг изменения времени
    private procedure setTimeChangeStep(ATimeChangeStep: real);
    // установить шаг изменения времени
    public Property ATimeChangeStep: real read getTimeChangeStep
     write setTimeChangeStep;
    private function getOmega(): real; // получить омега
    private procedure setOmega(AOmega: real); // установить омега
    public Property AOmega: real read getOmega write setOmega;    
    private function getRepaintCount(): integer;
    // получить количество перерисовок
    private procedure setRepaintCount(ARepaintCount: integer);
    // установить количество перерисовок
    public Property ARepaintCount: integer read getRepaintCount
     write setRepaintCount;

    public constructor Create(AP, AX, AIntialTimeMoment, AEndTimeMoment,
      ATimeChangeStep, AOmega: real; ARepaintCount: integer);

    private procedure CheckTimeMoments();
    // проверка правильности заданных границ времени
    public procedure DrawDecomposingToTrigonometricRow(Series: TLineSeries;
    Form: TForm; isAnimated: boolean);
    // строит разложение функции временного процесса в тригонометрический ряд
    public function CalculateFunction(time: real): real;
    // вычисление функции временного процесса
  end;

implementation

function TDecomposingTimeProcess.getP;
begin
  result := P;
end;

procedure TDecomposingTimeProcess.setP(AP: Real);
begin
  if AP > 0 then begin
    P := AP;
  end
  else begin
    MessageBox(0,'P должно быть положительным.','Ошибка',mb_Ok);
  end;
end;

function TDecomposingTimeProcess.getX;
begin
  result := x;
end;

procedure TDecomposingTimeProcess.setX(AX: Real);
begin
  if AX > 0 then begin
    x := AX;
  end
  else begin
    MessageBox(0,'X должен быть положительным.','Ошибка',mb_Ok);
  end;
end;

function TDecomposingTimeProcess.getIntialTimeMoment;
begin
  result := IntialTimeMoment;
end;

procedure TDecomposingTimeProcess.setIntialTimeMoment(AIntialTimeMoment: Real);
begin
  if AIntialTimeMoment > 0 then begin
    IntialTimeMoment := AIntialTimeMoment;
  end
  else begin
    MessageBox(0,'Начальное время должно быть положительным.','Ошибка',mb_Ok);
  end;
end;

function TDecomposingTimeProcess.getEndTimeMoment;
begin
  result := EndTimeMoment;
end;

procedure TDecomposingTimeProcess.setEndTimeMoment(AEndTimeMoment: Real);
begin
  if AEndTimeMoment > 0 then begin
    EndTimeMoment := AEndTimeMoment;
  end
  else begin
    MessageBox(0,'Конечное время должно быть положительным.','Ошибка',mb_Ok);
  end;
end;

function TDecomposingTimeProcess.getTimeChangeStep;
begin
  result := TimeChangeStep;
end;

procedure TDecomposingTimeProcess.setTimeChangeStep(ATimeChangeStep: Real);
begin
  if ATimeChangeStep > 0 then begin
    TimeChangeStep := ATimeChangeStep;
  end
  else begin
    MessageBox(0, 'Шаг изменения времени должен быть положительным.', 'Ошибка',
     mb_Ok);
  end;
end;

function TDecomposingTimeProcess.getOmega;
begin
  result := Omega;
end;

procedure TDecomposingTimeProcess.setOmega(AOmega: Real);
begin
  if AOmega > 0 then begin
    Omega := AOmega;
  end
  else begin
    MessageBox(0,'ω должна быть положительной.','Ошибка',mb_Ok);
  end;
end;

function TDecomposingTimeProcess.getRepaintCount;
begin
  result := RepaintCount;
end;

procedure TDecomposingTimeProcess.setRepaintCount(ARepaintCount: integer);
begin
  if ARepaintCount > 0 then begin
    RepaintCount := ARepaintCount;
  end  
  else begin
    MessageBox(0,
    'Количество перерисовок при анимации должно быть положительным.', 'Ошибка',
    mb_Ok);
  end;
end;

constructor TDecomposingTimeProcess.Create(AP: Real; AX: Real;
AIntialTimeMoment: Real; AEndTimeMoment: Real; ATimeChangeStep: Real;
AOmega: Real; ARepaintCount: integer);
begin
  P := AP;
  X := AX;
  IntialTimeMoment := AIntialTimeMoment;
  EndTimeMoment := AEndTimeMoment;
  CheckTimeMoments();
  TimeChangeStep := ATimeChangeStep;
  Omega := AOmega;
  RepaintCount := ARepaintCount;
end;

procedure TDecomposingTimeProcess.CheckTimeMoments;
var
  buffer: real;
begin
  if IntialTimeMoment > EndTimeMoment then begin
    buffer := IntialTimeMoment;
    IntialTimeMoment := EndTimeMoment;
    EndTimeMoment := buffer;
    MessageBox(0,'Т.к. начальное время было больше конечного, они были ' +
     'переставлены местами.', 'Ошибка',mb_Ok);
  end;
end;

procedure TDecomposingTimeProcess.DrawDecomposingToTrigonometricRow(
Series: TLineSeries; Form: TForm; isAnimated: boolean);
var
  time,
  dTime, // сколько прошло тиков после перерисования формы
  dTimeMax: real; // макс. кол-во тиков без перерисования формы
begin
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
        Form.Repaint;
        Sleep(0);
      end;
    end;
    Series.AddXY(time, CalculateFunction(time));
    time := time + timeChangeStep;
  end;
  if time < endTimeMoment + timeChangeStep/2 then begin
    Series.AddXY(endTimeMoment, CalculateFunction(endTimeMoment));
  end;
end;

function TDecomposingTimeProcess.CalculateFunction(time: Real): real;
begin
  result := 2*P/x * (sin(omega*time) - 1/2*sin(2*omega*time) +
   1/3*sin(3*omega*time) - 1/4*sin(4*omega*time));
end;

end.
