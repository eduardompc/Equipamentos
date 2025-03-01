unit FuncoesDLL;

interface

  function AbreConexaoDisplay(porta: PAnsiChar):Integer; stdcall; external 'E1_PIX401.dll';

  function ObtemVersaoFirmware():Integer;	 stdcall; external 'E1_PIX401.dll';

  function DesconectarDisplay():Integer; stdcall; external 'E1_PIX401.dll';

  function InicializaDisplay():Integer; stdcall; external 'E1_PIX401.dll';

  function ReinicializaDisplay():Integer; stdcall; external 'E1_PIX401.dll';

  function CarregaImagemDisplay(fileName:PAnsiChar; filePath:PAnsiChar; largura:Integer; altura:Integer):Integer; stdcall; external 'E1_PIX401.dll';

  function ApresentaImagemDisplay (fileName:PAnsiChar; posH:integer; posV:Integer; tipo:Integer):Integer; stdcall; external 'E1_PIX401.dll';

  function ApresentaQrCode (qrCode:PAnsiChar; tamanho:Integer; posH:Integer; posV:Integer):Integer; stdcall; external 'E1_PIX401.dll';

  function ApresentaTextoColorido (texto:PAnsiChar; idTexto:Integer; tamanho:integer; posH:Integer; posV:Integer; hexadecimal:PAnsiChar):Integer; stdcall; external 'E1_PIX401.dll';

  procedure ApresentaListaCompras (descricao:PAnsiChar; valor:Integer); stdcall; external 'E1_PIX401.dll';

  procedure InicializaLayoutPagamento (subTotal:Integer; desconto:Integer; totalPagar:Integer); stdcall; external 'E1_PIX401.dll';

  function AdicionaFormaPagamento (tipoPagamento:Integer; valor:Integer):Integer; stdcall; external 'E1_PIX401.dll';

implementation

end.
