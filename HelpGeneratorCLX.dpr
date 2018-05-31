program HelpGeneratorCLX;

uses
  FastMM4 in 'FastMM4.pas',
  QForms,
  frmHelpGeneratorCLX_Unit in 'frmHelpGeneratorCLX_Unit.pas' {frmHelpGenerator},
  WebUtils in 'WebUtils.pas',
  CustomProjectOptions in 'CustomProjectOptions.pas',
  RbwHelpViewer in 'RbwHelpViewer.pas',
  RbwInternetUtilities in 'RbwInternetUtilities.pas',
  frmAboutCLX_Unit in 'frmAboutCLX_Unit.pas' {frmAbout},
  ConsolProjectOptionsUnit in 'ConsolProjectOptionsUnit.pas';

{$R *.res}

begin
  {$IFDEF WIN32}
//  MemChk;
  {$ENDIF}
  Application.Initialize;
  Application.CreateForm(TfrmHelpGenerator, frmHelpGenerator);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
