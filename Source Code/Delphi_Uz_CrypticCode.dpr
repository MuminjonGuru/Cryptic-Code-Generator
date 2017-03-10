program Delphi_Uz_CrypticCode;

uses
  Vcl.Forms,
  Delphi.Uz.CrypticCode in 'Delphi.Uz.CrypticCode.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amakrits');
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
