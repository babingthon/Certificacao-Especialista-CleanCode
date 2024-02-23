unit controller.factory.query;

interface

  uses
    interfaces.factoryquery, interfaces.conexao.firedac;

  type
    TFactoryQuery = class(TInterfacedObject, iFactoryQuery)
      private
      public
        constructor Create;
        destructor Destroy; override;
        class function New: iFactoryQuery;
        function query(Connection: iConexao): iQuery;
    end;

implementation

uses
  classe.query.firedac;

  { TFactoryQuery }

  constructor TFactoryQuery.Create;
    begin

    end;

  destructor TFactoryQuery.Destroy;
    begin

      inherited;
    end;

  class function TFactoryQuery.New: iFactoryQuery;
    begin
      Result := self.Create;
    end;

  function TFactoryQuery.query(Connection: iConexao): iQuery;
    begin
      Result := TQueryFiredac.New(Connection);
    end;

end.
