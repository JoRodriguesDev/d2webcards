unit uModel.CountUp.Interfaces;

interface

uses
  System.Classes;

type
  iModelCountUp = interface
    ['{74D8E1F4-EC8D-49B1-BD4B-0A2FBC67318B}']
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

end.

