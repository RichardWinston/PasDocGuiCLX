program HelpGenerator;

uses
  FastMM4 in 'FastMM4.pas',
  QBindings in 'QBindings.pas',
  QForms,
  frmHelpGeneratorUnit in 'frmHelpGeneratorUnit.pas' {frmHelpGenerator},
  WebUtils in 'WebUtils.pas',
  RbwHelpViewer in 'RbwHelpViewer.pas',
  RbwInternetUtilities in 'RbwInternetUtilities.pas',
  ConsolProjectOptionsUnit in 'ConsolProjectOptionsUnit.pas',
  ASpellLanguages in 'ASpellLanguages.pas',
  frmAboutUnit in 'frmAboutUnit.pas' {frmAbout};

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
