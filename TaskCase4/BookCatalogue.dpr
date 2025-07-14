library BookCatalogue;

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  WebModuleUnit in 'WebModuleUnit.pas' {WebModule2: TWebModule},
  BookActionsUnit in 'BookActionsUnit.pas' {WebModule1: TWebModule};

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
//  Application.WebModuleClass := WebModuleClass;
  Application.WebModuleClass := TWebModule1;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
