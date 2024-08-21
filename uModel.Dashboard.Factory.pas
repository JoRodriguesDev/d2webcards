unit uModel.Dashboard.Factory;

interface

uses
  uModel.Dashboard.Interfaces;

type
  TModelDashboardFactory = class(TInterfacedObject, iModelDashboardFactory)
  public
    function DashboardCard: iModelDashboardCard;
    class function New: iModelDashboardFactory ;
  end;

implementation

uses
  uModel.Dashboard.Card;

{ TModelDashboardFactory }

function TModelDashboardFactory.DashboardCard: iModelDashboardCard;
begin
  Result := TModelDashboardCard.Create;
end;

class function TModelDashboardFactory.New: iModelDashboardFactory;
begin
  Result := Self.Create;
end;

end.
