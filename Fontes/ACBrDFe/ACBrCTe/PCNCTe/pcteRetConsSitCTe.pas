////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//              PCN - Projeto Cooperar CTe                                    //
//                                                                            //
//   Descri��o: Classes para gera��o/leitura dos arquivos xml da CTe          //
//                                                                            //
//        site: www.projetocooperar.org/cte                                   //
//       email: projetocooperar@zipmail.com.br                                //
//       forum: http://br.groups.yahoo.com/group/projeto_cooperar_cte/        //
//     projeto: http://code.google.com/p/projetocooperar/                     //
//         svn: http://projetocooperar.googlecode.com/svn/trunk/              //
//                                                                            //
// Coordena��o: (c) 2009 - Paulo Casagrande                                   //
//                                                                            //
//      Equipe: Vide o arquivo leiame.txt na pasta raiz do projeto            //
//                                                                            //
//      Vers�o: Vide o arquivo leiame.txt na pasta raiz do projeto            //
//                                                                            //
//     Licen�a: GNU Lesser General Public License (GNU LGPL)                  //
//                                                                            //
//              - Este programa � software livre; voc� pode redistribu�-lo    //
//              e/ou modific�-lo sob os termos da Licen�a P�blica Geral GNU,  //
//              conforme publicada pela Free Software Foundation; tanto a     //
//              vers�o 2 da Licen�a como (a seu crit�rio) qualquer vers�o     //
//              mais nova.                                                    //
//                                                                            //
//              - Este programa � distribu�do na expectativa de ser �til,     //
//              mas SEM QUALQUER GARANTIA; sem mesmo a garantia impl�cita de  //
//              COMERCIALIZA��O ou de ADEQUA��O A QUALQUER PROP�SITO EM       //
//              PARTICULAR. Consulte a Licen�a P�blica Geral GNU para obter   //
//              mais detalhes. Voc� deve ter recebido uma c�pia da Licen�a    //
//              P�blica Geral GNU junto com este programa; se n�o, escreva    //
//              para a Free Software Foundation, Inc., 59 Temple Place,       //
//              Suite 330, Boston, MA - 02111-1307, USA ou consulte a         //
//              licen�a oficial em http://www.gnu.org/licenses/gpl.txt        //
//                                                                            //
//    Nota (1): - Esta  licen�a  n�o  concede  o  direito  de  uso  do nome   //
//              "PCN  -  Projeto  Cooperar  NFe", n�o  podendo o mesmo ser    //
//              utilizado sem previa autoriza��o.                             //
//                                                                            //
//    Nota (2): - O uso integral (ou parcial) das units do projeto esta       //
//              condicionado a manuten��o deste cabe�alho junto ao c�digo     //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

{$I ACBr.inc}

unit pcteRetConsSitCTe;

interface

uses
  SysUtils, Classes, Contnrs,
  pcnAuxiliar, pcnConversao, pcnLeitor, pcteProcCTe,
  {pcteRetCancCTe,} pcteRetEnvEventoCTe;

type

  TRetEventoCTeCollectionItem = class;
  TRetConsSitCTe = class;

  TRetCancCTe = class(TObject)
  private
    Fversao: String;
    FId: String;
    FtpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FxMotivo: String;
    FcUF: Integer;
    FchCTe: String;
    FdhRecbto: TDateTime;
    FnProt: String;
  public
    property versao: String          read Fversao   write Fversao;
    property Id: String              read FId       write FId;
    property tpAmb: TpcnTipoAmbiente read FtpAmb    write FtpAmb;
    property verAplic: String        read FverAplic write FverAplic;
    property cStat: Integer          read FcStat    write FcStat;
    property xMotivo: String         read FxMotivo  write FxMotivo;
    property cUF: Integer            read FcUF      write FcUF;
    property chCTe: String           read FchCTe    write FchCTe;
    property dhRecbto: TDateTime     read FdhRecbto write FdhRecbto;
    property nProt: String           read FnProt    write FnProt;
  end;

  TRetEventoCTeCollection = class(TObjectList)
  private
    function GetItem(Index: Integer): TRetEventoCTeCollectionItem;
    procedure SetItem(Index: Integer; Value: TRetEventoCTeCollectionItem);
  public
    function Add: TRetEventoCTeCollectionItem; overload; deprecated {$IfDef SUPPORTS_DEPRECATED_DETAILS} 'Obsoleta: Use a fun��o New'{$EndIf};
    function New: TRetEventoCTeCollectionItem;
    property Items[Index: Integer]: TRetEventoCTeCollectionItem read GetItem write SetItem; default;
  end;

  TRetEventoCTeCollectionItem = class(TObject)
  private
    FRetEventoCTe: TRetEventoCTe;
  public
    constructor Create;
    destructor Destroy; override;
    property RetEventoCTe: TRetEventoCTe read FRetEventoCTe write FRetEventoCTe;
  end;

  TRetConsSitCTe = class(TObject)
  private
    FLeitor: TLeitor;
    Fversao: String;
    FtpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FxMotivo: String;
    FcUF: Integer;
    FchCTe: String;
    FprotCTe: TProcCTe;
    FretCancCTe: TRetCancCTe;
    FprocEventoCTe: TRetEventoCTeCollection;
    FXMLprotCTe: String;
  public
    constructor Create;
    destructor Destroy; override;
    function LerXml: boolean;
    property Leitor: TLeitor                        read FLeitor        write FLeitor;
    property versao: String                         read Fversao        write Fversao;
    property tpAmb: TpcnTipoAmbiente                read FtpAmb         write FtpAmb;
    property verAplic: String                       read FverAplic      write FverAplic;
    property cStat: Integer                         read FcStat         write FcStat;
    property xMotivo: String                        read FxMotivo       write FxMotivo;
    property cUF: Integer                           read FcUF           write FcUF;
    property chCTe: String                          read FchCTe         write FchCTe;
    property protCTe: TProcCTe                      read FprotCTe       write FprotCTe;
    property retCancCTe: TRetCancCTe                read FretCancCTe    write FretCancCTe;
    property procEventoCTe: TRetEventoCTeCollection read FprocEventoCTe write FprocEventoCTe;
    property XMLprotCTe: String                     read FXMLprotCTe    write FXMLprotCTe;
  end;

implementation

{ TRetConsSitCTe }

constructor TRetConsSitCTe.Create;
begin
  inherited Create;
  FLeitor     := TLeitor.Create;
  FprotCTe    := TProcCTe.create;
  FretCancCTe := TRetCancCTe.create;
end;

destructor TRetConsSitCTe.Destroy;
begin
  FLeitor.Free;
  FprotCTe.Free;
  FretCancCTe.Free;

  if Assigned(procEventoCTe) then
    procEventoCTe.Free;

  inherited;
end;

function TRetConsSitCTe.LerXml: boolean;
var
  ok: boolean;
  i: Integer;
begin
  Result := False;

  FcStat           := 0;
  protCTe.cStat    := 0;
  retCancCTe.cStat := 0;

  try
    if leitor.rExtrai(1, 'retConsSitCTe') <> '' then
    begin
      Fversao   := Leitor.rAtributo('versao', 'retConsSitCTe');
      FtpAmb    := StrToTpAmb(ok, leitor.rCampo(tcStr, 'tpAmb'));
      FverAplic := leitor.rCampo(tcStr, 'verAplic');
      FcStat    := leitor.rCampo(tcInt, 'cStat');
      FxMotivo  := leitor.rCampo(tcStr, 'xMotivo');
      FcUF      := leitor.rCampo(tcInt, 'cUF');

      // status 100 = Autorizado, 101 = Cancelado, 110 = Denegado, 301 = Denegado
      // A SEFAZ-MS esta retornando Status=129 como status de retorno da consulta
      // mas o status do CT-e consultado � 100
      if (FcStat in  [100, 101, 104, 110, 129]) or (FcStat = 301) then
      begin
        if (Leitor.rExtrai(1, 'protCTe') <> '') then
        begin
          // A propriedade XMLprotCTe contem o XML que traz o resultado do
          // processamento do CT-e.
          XMLprotCTe := Leitor.Grupo;

          if Leitor.rExtrai(2, 'infProt') <> '' then
          begin
            protCTe.Id       := Leitor.rAtributo('Id=', 'infProt');
            protCTe.tpAmb    := StrToTpAmb(ok, Leitor.rCampo(tcStr, 'tpAmb'));
            protCTe.verAplic := Leitor.rCampo(tcStr, 'verAplic');
            protCTe.chCTe    := Leitor.rCampo(tcStr, 'chCTe');
            protCTe.dhRecbto := Leitor.rCampo(tcDatHor, 'dhRecbto');
            protCTe.nProt    := Leitor.rCampo(tcStr, 'nProt');
            protCTe.digVal   := Leitor.rCampo(tcStr, 'digVal');
            protCTe.cStat    := Leitor.rCampo(tcInt, 'cStat');
            protCTe.xMotivo  := Leitor.rCampo(tcStr, 'xMotivo');
            FchCTe           := protCTe.chCTe;
          end;
        end;
      end;

      if FcStat = 101 then
      begin
        if Leitor.rExtrai(1, 'infCanc') <> '' then
        begin
          retCancCTe.Id       := Leitor.rAtributo('Id=', 'infCanc');
          retCancCTe.tpAmb    := StrToTpAmb(ok, Leitor.rCampo(tcStr, 'tpAmb'));
          retCancCTe.verAplic := Leitor.rCampo(tcStr, 'verAplic');
          retCancCTe.cStat    := Leitor.rCampo(tcInt, 'cStat');
          retCancCTe.xMotivo  := Leitor.rCampo(tcStr, 'xMotivo');
          retCancCTe.cUF      := Leitor.rCampo(tcInt, 'cUF');
          retCancCTe.chCTe    := Leitor.rCampo(tcStr, 'chCTe');
          retCancCTe.dhRecbto := Leitor.rCampo(tcDatHor, 'dhRecbto');
          retCancCTe.nProt    := Leitor.rCampo(tcStr, 'nProt');
          FchCTe              := retCancCTe.chCTe;
        end;
      end;

      if Assigned(procEventoCTe) then
        procEventoCTe.Free;

      procEventoCTe := TRetEventoCTeCollection.Create;
      i := 0;
      while Leitor.rExtrai(1, 'procEventoCTe', '', i + 1) <> '' do
      begin
        procEventoCTe.New;
        procEventoCTe.Items[i].RetEventoCTe.Leitor.Arquivo := Leitor.Grupo;
        procEventoCTe.Items[i].RetEventoCTe.XML := Leitor.Grupo;
        procEventoCTe.Items[i].RetEventoCTe.LerXml;
        inc(i);
      end;

      Result := True;
    end;
  except
    Result := False;
  end;
end;

{ TRetEventoCTeCollection }

function TRetEventoCTeCollection.Add: TRetEventoCTeCollectionItem;
begin
  Result := Self.New;
end;

function TRetEventoCTeCollection.GetItem(Index: Integer): TRetEventoCTeCollectionItem;
begin
  Result := TRetEventoCTeCollectionItem(inherited GetItem(Index));
end;

procedure TRetEventoCTeCollection.SetItem(Index: Integer; Value: TRetEventoCTeCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

function TRetEventoCTeCollection.New: TRetEventoCTeCollectionItem;
begin
  Result := TRetEventoCTeCollectionItem.Create;
  Self.Add(Result);
end;

{ TRetEventoCTeCollectionItem }

constructor TRetEventoCTeCollectionItem.Create;
begin
  inherited Create;
  FRetEventoCTe := TRetEventoCTe.Create;
end;

destructor TRetEventoCTeCollectionItem.Destroy;
begin
  FRetEventoCTe.Free;

  inherited;
end;

end.

