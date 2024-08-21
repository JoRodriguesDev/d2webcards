unit uModel.Dashboard.Card;

interface

uses
  uModel.Dashboard.Interfaces,
  System.SysUtils;

type
  TModelDashboardCard = class(TInterfacedObject, iModelDashboardCard)
  private
    FTitle            : string;
    FValue            : string;
    FStartValue       : Double;
    FEndValue         : Double;
    FUseCountUp       : Boolean;
    FBackgroundColor  : EnumColors;
    FTextColor        : EnumColors;
    FIconClass        : string;
    FLinkText         : string;
    FLinkUrl          : string;
    FOnClick          : string;
  public
    function Title(ATitle: string): iModelDashboardCard;
    function Value(AValue: string): iModelDashboardCard;
    function StartValue(AValue: double): iModelDashboardCard;
    function EndValue(AValue: double): iModelDashboardCard;
    function UseCountUp(AValue: Boolean = false): iModelDashboardCard;
    function BackgroundColor(AColor: EnumColors): iModelDashboardCard;
    function TextColor(AColor: EnumColors): iModelDashboardCard;
    function Icon(AIconClass: string): iModelDashboardCard;
    function LinkText(AText: string): iModelDashboardCard;
    function LinkUrl(AUrl: string): iModelDashboardCard;
    function OnClick(AValue: string): iModelDashboardCard;
    function Generate: string;
    class function New: iModelDashboardCard;
    constructor Create;
  end;

implementation

uses
  System.TypInfo,
  uModel.CountUp;

{ TModelDashboardCard }

constructor TModelDashboardCard.Create;
begin
  FTitle := '';
  FValue := '0';
  FBackgroundColor := primary;
  FTextColor := white;
  FIconClass := '';
  FLinkText := 'Visualizar';
  FLinkUrl := '#';
end;

function TModelDashboardCard.EndValue(AValue: double): iModelDashboardCard;
begin
  result := Self;
  FEndValue := AValue;
end;

function TModelDashboardCard.Title(ATitle: string): iModelDashboardCard;
begin
  FTitle := ATitle;
  Result := Self;
end;

function TModelDashboardCard.UseCountUp(AValue: Boolean): iModelDashboardCard;
begin
  result := Self;
  FUseCountUp := AValue;
end;

function TModelDashboardCard.StartValue(AValue: double): iModelDashboardCard;
begin
  result := Self;
  FStartValue := AValue;
end;

function TModelDashboardCard.Value(AValue: string): iModelDashboardCard;
begin
  FValue := AValue;
  Result := Self;
end;

function TModelDashboardCard.BackgroundColor(AColor: EnumColors): iModelDashboardCard;
begin
  FBackgroundColor := AColor;
  Result := Self;
end;

function TModelDashboardCard.TextColor(AColor: EnumColors): iModelDashboardCard;
begin
  FTextColor := AColor;
  Result := Self;
end;

function TModelDashboardCard.Icon(AIconClass: string): iModelDashboardCard;
begin
  FIconClass := AIconClass;
  Result := Self;
end;

function TModelDashboardCard.LinkText(AText: string): iModelDashboardCard;
begin
  FLinkText := AText;
  Result := Self;
end;

function TModelDashboardCard.LinkUrl(AUrl: string): iModelDashboardCard;
begin
  FLinkUrl := AUrl;
  Result := Self;
end;

class function TModelDashboardCard.New: iModelDashboardCard;
begin
  Result := Self.Create;
end;

function TModelDashboardCard.OnClick(AValue: string): iModelDashboardCard;
begin
  FOnClick := AValue;
  Result := Self;
end;

function TModelDashboardCard.Generate: string;
begin
  var LBGColorClass    := 'bg-'    + GetEnumName(TypeInfo(EnumColors), Ord(FBackgroundColor)).ToLower;
  var LTextColorClass  := 'text-'  + GetEnumName(TypeInfo(EnumColors), Ord(FTextColor)).ToLower;
  var LUniqueID        := Format('card%s', [IntToStr(Random(MaxInt))]);

  Result :=
    '<div class="card ' + LBGColorClass + ' ' + LTextColorClass +'">' +
    '  <div class="card-body">' +
    '    <div class="d-flex justify-content-between align-items-center">' +
    '      <div class="me-3">' +
    '        <div class="small">'+ FTitle +'</div>' +
    '        <div id="'+ LUniqueID +'" class="text-lg fw-bold">' + FValue + '</div>' +
    '      </div>' +
    '      <i class="'+ FIconClass +'"></i>' +
    '    </div>' +
    '  </div>' +
    '  <div class="card-footer d-flex align-items-center justify-content-between small">' +
    '    <a class="'+ LTextColorClass +' stretched-link" href="' + FLinkUrl + '" onclick="' + FOnClick+'">' + FLinkText + '</a>' +
    '    <div class="fas fa-angle-right '+ LTextColorClass +'"></div>' +
    '  </div>' +
    '</div> ';

    if FUseCountUp then
    begin
      Result := Result + '<script>' +
      'document.addEventListener("DOMContentLoaded", () => {' +

        TModelCountUp.New
          .TargetElement(LUniqueID)
          .StartValue(FStartValue)
          .EndValue(FEndValue)
          .DecimalPlaces(2)
          .Duration(1.5)
          .UseEasing(True)
          .UseGrouping(True)
          .Separator('.')
          .Decimal(',')
          .Prefix('R$ ')
          .Suffix('')
          .Generate +

      '});' +
      '</script>';
    end;
end;

end.

