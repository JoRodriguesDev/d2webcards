unit uModel.Dashboard.Interfaces;

interface

uses
  System.Classes;

type
  EnumColors = (
    none, blue, indigo,
    purple, pink ,red,
    orange, yellow, green,
    teal, cyan, black,
    white, gray, graydark,
    gray100, gray200, gray300,
    gray400, gray500, gray600,
    gray700, gray800, gray900,
    primary, secondary, success,
    info, warning, danger,
    light, dark, transparent);

  TCardColor = EnumColors;

  iModelDashboardCard = interface;
  iModelDashboardFactory = interface;

  iModelDashboardCard = interface
    ['{7C4A8BFA-97DA-4A29-B713-19B1C2433D7B}']
    function Title(ATitle: string): iModelDashboardCard;
    function Value(AValue: string): iModelDashboardCard;
    function StartValue(AValue: double): iModelDashboardCard;
    function EndValue(AValue: double): iModelDashboardCard;
    function UseCountUp(AValue: Boolean = false): iModelDashboardCard;
    function BackgroundColor(AColor: TCardColor): iModelDashboardCard;
    function TextColor(AColor: TCardColor): iModelDashboardCard;
    function Icon(AIconClass: string): iModelDashboardCard;
    function LinkText(AText: string): iModelDashboardCard;
    function LinkUrl(AUrl: string): iModelDashboardCard;
    function OnClick(AValue: string): iModelDashboardCard;
    function Generate: string;
  end;

  iModelDashboardFactory = interface
    ['{BF992B4D-ACD3-4B3F-B21F-EB31F2A64471}']
    function DashboardCard: iModelDashboardCard;
  end;

implementation

end.

