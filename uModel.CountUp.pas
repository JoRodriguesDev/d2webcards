unit uModel.CountUp;

interface

uses
  uModel.CountUp.Interfaces, System.SysUtils;

type
  TModelCountUp = class(TInterfacedObject, iModelCountUp)
  private
    FTargetElement: string;
    FStartValue: Double;
    FEndValue: Double;
    FDecimalPlaces: Integer;
    FDuration: Double;
    FUseEasing: Boolean;
    FUseGrouping: Boolean;
    FSeparator: string;
    FDecimal: string;
    FPrefix: string;
    FSuffix: string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelCountUp;

    function TargetElement(AId: string): iModelCountUp;
    function StartValue(AValue: Double): iModelCountUp;
    function EndValue(AValue: Double): iModelCountUp;
    function DecimalPlaces(AValue: Integer): iModelCountUp;
    function Duration(AValue: Double): iModelCountUp;
    function UseEasing(AValue: Boolean): iModelCountUp;
    function UseGrouping(AValue: Boolean): iModelCountUp;
    function Separator(AValue: string): iModelCountUp;
    function Decimal(AValue: string): iModelCountUp;
    function Prefix(AValue: string): iModelCountUp;
    function Suffix(AValue: string): iModelCountUp;
    function Generate: string;
  end;

implementation

{ TModelCountUp }

constructor TModelCountUp.Create;
begin
  FUseEasing := True;
  FUseGrouping := True;
  FSeparator := '.';
  FDecimal := ',';
  FPrefix := '';
  FSuffix := '';
end;

destructor TModelCountUp.Destroy;
begin
  inherited;
end;

function TModelCountUp.TargetElement(AId: string): iModelCountUp;
begin
  FTargetElement := AId;
  Result := Self;
end;

function TModelCountUp.StartValue(AValue: Double): iModelCountUp;
begin
  FStartValue := AValue;
  Result := Self;
end;

function TModelCountUp.EndValue(AValue: Double): iModelCountUp;
begin
  FEndValue := AValue;
  Result := Self;
end;

function TModelCountUp.DecimalPlaces(AValue: Integer): iModelCountUp;
begin
  FDecimalPlaces := AValue;
  Result := Self;
end;

function TModelCountUp.Duration(AValue: Double): iModelCountUp;
begin
  FDuration := AValue;
  Result := Self;
end;

function TModelCountUp.UseEasing(AValue: Boolean): iModelCountUp;
begin
  FUseEasing := AValue;
  Result := Self;
end;

function TModelCountUp.UseGrouping(AValue: Boolean): iModelCountUp;
begin
  FUseGrouping := AValue;
  Result := Self;
end;

function TModelCountUp.Separator(AValue: string): iModelCountUp;
begin
  FSeparator := AValue;
  Result := Self;
end;

function TModelCountUp.Decimal(AValue: string): iModelCountUp;
begin
  FDecimal := AValue;
  Result := Self;
end;

function TModelCountUp.Prefix(AValue: string): iModelCountUp;
begin
  FPrefix := AValue;
  Result := Self;
end;

function TModelCountUp.Suffix(AValue: string): iModelCountUp;
begin
  FSuffix := AValue;
  Result := Self;
end;

function TModelCountUp.Generate: string;
begin
  Result := Format(
    'var countUp = new CountUp(''%s'', %s, %s, %d, %s, {' +
    'useEasing: %s, useGrouping: %s, separator: ''%s'', decimal: ''%s'', prefix: ''%s'', suffix: ''%s''});' + sLineBreak +
    'countUp.start();',
    [
      FTargetElement,
      StringReplace(FloatToStr(FStartValue), ',', '.', [rfReplaceAll]),
      StringReplace(FloatToStr(FEndValue), ',', '.', [rfReplaceAll]),
      FDecimalPlaces,
      StringReplace(FloatToStr(FDuration), ',', '.', [rfReplaceAll]),
      BoolToStr(FUseEasing, True).ToLower,
      BoolToStr(FUseGrouping, True).ToLower,
      FSeparator,
      FDecimal,
      FPrefix,
      FSuffix
    ]
  );
end;

class function TModelCountUp.New: iModelCountUp;
begin
  Result := self.Create;
end;

end.

