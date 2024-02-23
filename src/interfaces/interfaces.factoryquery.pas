unit interfaces.factoryquery;

interface

  uses
    interfaces.conexao.firedac;

  type
    iFactoryQuery = interface
      function Query(Connection: iConexao): iQuery;
    end;

implementation

end.
