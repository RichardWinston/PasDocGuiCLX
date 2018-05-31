unit CustomProjectOptions;

interface

uses
{$IFDEF LINUX}
  Libc,
{$ENDIF}
{$IFDEF MSWINDOWS}
  Windows, ShellAPI, //Qt,
{$ENDIF}
  SysUtils, Classes, QDialogs, PasDoc_Base, PasDoc_Languages, PasDoc_GenHtml,
  PasDoc_GenLatex, PasDoc_GenHtmlHelp, PasDoc_Items, ConsolProjectOptionsUnit;

{type
  TLineBreakQuality = (lbqStrict, lbqSloppy);
  TOutputType = (otWebPage, otHtmlHelp, otLatex, otLatex2Rtf);
  TLatexGraphicsPackage = (ltmNone, ltmPDF, ltmDVI); }

type
{  TCustomHelpOptions = class(TComponent)
  protected
    FFileDirectory: string;
    procedure Initialize; virtual;
  public
    procedure ReadFromComponentFile(const FileName: string);
    procedure SaveToComponentFile(const FileName: string);
  end;  }

{  TCustomIniFile = class(TCustomHelpOptions)
  protected
    function GetGraphVizDotLocation: string; virtual; abstract;
    procedure SetGraphVizDotLocation(const Value: string); virtual; abstract;
    function GetBrowserLocation: string; virtual; abstract;
    procedure SetBrowserLocation(const Value: string); virtual; abstract;
    procedure Initialize; override;
  published
    property GraphVizDotLocation: string read GetGraphVizDotLocation
      write SetGraphVizDotLocation stored True;
    property BrowserLocation: string read GetBrowserLocation
      write SetBrowserLocation stored True;
  end;

  TIniFileClass = class of TCustomIniFile; }

  TCustomHelpProjectOptions = class(TConsolHelpProjectOptions)
  private
    FHtmlHelpContents: string;
    FSortOptions: TSortOptions;
    FSpellChecking: boolean;
    FSpellCheckIgnoreWords: TStrings;
    FSpellCheckLanguage: string;
    FSpellCheckLanguageCode: string;
    function GetVisibilities: TVisibilities;
  protected
    function GetHtmlDocGeneratorComponent: THtmlDocGenerator; virtual;
      abstract;
    function GetHTMLHelpDocGeneratorComponent: THTMLHelpDocGenerator;
      virtual; abstract;
    function GetLanguage: TLanguageID; virtual; abstract;
    function GetLanguageString: string; override;
    function GetPasDocComponent: TPasDoc; virtual; abstract;
    function GetTexDocGeneratorComponent: TTexDocGenerator; virtual;
      abstract;
    procedure SetLanguage(const Value: TLanguageID); virtual; abstract;
    procedure SetLanguageString(const Value: string); override;
    function GetPasDocConsoleLocation: string; override;
    // do nothing procedures
    function GetHtmlHelpContents: string; override;
    function GetSortOptions: TSortOptions; override;
    function GetSpellChecking: boolean; override;
    function GetSpellCheckIgnoreWords: TStrings; override;
    function GetSpellCheckLanguage: string; override;
    function GetSpellCheckLanguageCode: string; override;
    procedure SetHtmlHelpContents(const AValue: string); override;
    procedure SetSortOptions(Const Value: TSortOptions); override;
    procedure SetSpellChecking(const Value: boolean); override;
    procedure SetSpellCheckIgnoreWords(const Value: TStrings); override;
    procedure SetSpellCheckLanguage(const Value: string); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RunPasDoc;
    property HtmlDocGeneratorComponent: THtmlDocGenerator read
      GetHtmlDocGeneratorComponent;
    property HTMLHelpDocGeneratorComponent: THTMLHelpDocGenerator read
      GetHTMLHelpDocGeneratorComponent;
    property PasDocComponent: TPasDoc read GetPasDocComponent;
    property TexDocGeneratorComponent: TTexDocGenerator read
      GetTexDocGeneratorComponent;
    property Visibilities: TVisibilities read GetVisibilities;
  published
    property Language: TLanguageID read GetLanguage write SetLanguage stored
      False;
  end;

procedure GetVisibilityNames(Names: TStrings);


{$IFDEF MSWINDOWS}
{function IniFileName: string;
procedure ReadIniFile(IniClass: TIniFileClass);
procedure WriteIniFile(IniClass: TIniFileClass);  }
{$ENDIF}

implementation

uses TypInfo, {Utils,} StrUtils {, JclSysUtils};

{ $IFDEF MSWINDOWS}
{
function IniFileName: string;
const
  IniName = 'HelpGenerator.ini';
begin
  result := ExtractFileDir(ParamStr(0)) + PathDelim + IniName;
end;

procedure ReadIniFile(IniClass: TIniFileClass);
var
  Ini: TCustomIniFile;
  FileName: string;
begin
  FileName := IniFileName;
  if FileExists(FileName) then
  begin
    Ini := IniClass.Create(nil);
    try
      Ini.ReadFromComponentFile(FileName);
    finally
      Ini.Free;
    end;
  end;
end;

procedure WriteIniFile(IniClass: TIniFileClass);
var
  Ini: TCustomIniFile;
begin
  Ini := IniClass.Create(nil);
  try
    Ini.SaveToComponentFile(IniFileName);
  finally
    Ini.Free;
  end;
end;
}
{ $ENDIF}

{ TCustomHelpProjectOptions }

{procedure TCustomHelpProjectOptions.Initialize;
begin
  ConclusionFileName := '';
  Directives.Clear;
  Footer.Clear;
  Header.Clear;
  IncludeDirectories.Clear;
  IntroductionFileName := '';
  OutputDirectory := '';
  ProjectName := '';
  SourceFiles.Clear;
  HyphenatedWords.Clear;
  Title := '';
end;  }

{procedure TCustomHelpOptions.Initialize;
begin
  // do nothing
end;

procedure TCustomHelpOptions.ReadFromComponentFile(const FileName: string);
var
  FileStream: TFileStream;
  BinaryStream: TMemoryStream;
  ObjectStream: TMemoryStream;
begin
  FFileDirectory := ExtractFileDir(FileName) + PathDelim;
  try
    Initialize;
    FileStream := TFileStream.Create(FileName,
      fmOpenRead or fmShareDenyWrite, ReadWritePermissions);
    try
      FileStream.Position := 0;
      BinaryStream := TMemoryStream.Create;
      ObjectStream := TMemoryStream.Create;
      try
        BinaryStream.CopyFrom(FileStream, FileStream.Size);
        BinaryStream.Position := 0;
        ObjectTextToBinary(BinaryStream, ObjectStream);
        ObjectStream.Position := 0;
        ObjectStream.ReadComponent(self);
      finally
        BinaryStream.Free;
        ObjectStream.Free;
      end;
    finally
      FileStream.Free;
    end;
  finally
    FFileDirectory := '';
  end;
end;  }

procedure TCustomHelpProjectOptions.RunPasDoc;
var
  Files: TStringList;
  Index: integer;
begin
  case OutputType of
    otWebPage:
      begin
        PasDocComponent.Generator := HtmlDocGeneratorComponent;
        HtmlDocGeneratorComponent.Header := Header.Text;
        HtmlDocGeneratorComponent.Footer := Footer.Text;
      end;
    otHtmlHelp:
      begin
        PasDocComponent.Generator := HTMLHelpDocGeneratorComponent;
        HTMLHelpDocGeneratorComponent.Header := Header.Text;
        HTMLHelpDocGeneratorComponent.Footer := Footer.Text;
      end;
    otLatex, otLatex2Rtf:
      begin
        PasDocComponent.Generator := TexDocGeneratorComponent;
        TexDocGeneratorComponent.Latex2rtf := OutputType = otLatex2Rtf;
        TexDocGeneratorComponent.LatexHead.Clear;
        if LineBreakQuality = lbqSloppy then
        begin
          TexDocGeneratorComponent.LatexHead.Add('\sloppy');
        end;
        if HyphenatedWords.Count > 0 then
        begin
          TexDocGeneratorComponent.LatexHead.Add('\hyphenation{');
          for Index := 0 to HyphenatedWords.Count - 1 do
          begin
            TexDocGeneratorComponent.LatexHead.Add(HyphenatedWords[Index]);
          end;
          TexDocGeneratorComponent.LatexHead.Add('}');
        end;
        case LatexGraphicsPackage of
          ltmNone:
            begin
              // do nothing
            end;
          ltmPDF:
            begin
              TexDocGeneratorComponent.LatexHead.Add('\usepackage[pdftex]{graphicx}');
            end;
          ltmDVI:
            begin
              TexDocGeneratorComponent.LatexHead.Add('\usepackage[dvips]{graphicx}');
            end;
        else Assert(False);
        end;

      end;
  else Assert(False);
  end;

  PasDocComponent.ShowVisibilities := Visibilities;

  PasDocComponent.Generator.Language := Language;

  PasDocComponent.Generator.DestinationDirectory := OutputDirectory;
  if not DirectoryExists(PasDocComponent.Generator.DestinationDirectory) then
  begin
    CreateDir(PasDocComponent.Generator.DestinationDirectory);
  end;

  PasDocComponent.ProjectName := ProjectName;
  PasDocComponent.Title := Title;
  PasDocComponent.IntroductionFileName := IntroductionFileName;
  PasDocComponent.ConclusionFileName := ConclusionFileName;
  Files := TStringList.Create;
  try
    Files.AddStrings(SourceFiles);
    PasDocComponent.SourceFileNames.Clear;
    PasDocComponent.AddSourceFileNames(Files);

    Files.Clear;
    Files.AddStrings(IncludeDirectories);
    PasDocComponent.IncludeDirectories.Assign(Files);

    Files.Clear;
    Files.AddStrings(Directives);
    PasDocComponent.Directives.Assign(Files);
  finally
    Files.Free;
  end;

  PasDocComponent.Verbosity := Verbosity;
  if (OutputType in [otWebPage, otHtmlHelp]) and
    FileExists(PasDocComponent.Generator.DestinationDirectory + 'pasdoc.css')
    then
  begin
    DeleteFile(PasDocComponent.Generator.DestinationDirectory +
      'pasdoc.css');
  end;

  PasDocComponent.Generator.OutputGraphVizUses := UseGraphVizUses;
  PasDocComponent.Generator.OutputGraphVizClassHierarchy
    := UseGraphVizClasses;
  if PasDocComponent.Generator.OutputGraphVizUses then
  begin
    PasDocComponent.Generator.LinkGraphVizUses := GVImageExtension;
  end
  else
  begin
    PasDocComponent.Generator.LinkGraphVizUses := '';
  end;
  if PasDocComponent.Generator.OutputGraphVizClassHierarchy then
  begin
    PasDocComponent.Generator.LinkGraphVizClasses := GVImageExtension;
  end
  else
  begin
    PasDocComponent.Generator.LinkGraphVizClasses := '';
  end;

  PasDocComponent.Execute;
end;

{procedure TCustomHelpOptions.SaveToComponentFile(const FileName: string);
var
  FileStream: TFileStream;
  BinaryStream: TMemoryStream;
  ObjectStream: TMemoryStream;
begin
  FFileDirectory := ExtractFileDir(FileName) + PathDelim;
  try
    BinaryStream := TMemoryStream.Create;
    ObjectStream := TMemoryStream.Create;
    try
      BinaryStream.WriteComponent(self);
      BinaryStream.Position := 0;
      ObjectBinaryToText(BinaryStream, ObjectStream);

      FileStream := TFileStream.Create(FileName,
        fmCreate or fmShareDenyWrite, ReadWritePermissions);
      try
        ObjectStream.Position := 0;
        FileStream.CopyFrom(ObjectStream, ObjectStream.Size)
      finally
        FileStream.Free;
      end;
    finally
      BinaryStream.Free;
      ObjectStream.Free;
    end;
  finally
    FFileDirectory := '';
  end;
end;  }

{procedure TCustomHelpProjectOptions.RunProgram(AProgram: string;
  Arguments: TStringList);
var
{ $IFDEF WIN32}
{  Index: integer;
  ParamString: string;
{ $ELSE}
{  NewProcess: pid_t;
  open_max: Longint;
  i: Longint;
{ $ENDIF}
//begin
{ $IFDEF WIN32}
{  ParamString := '';
  for Index := 0 to Arguments.Count - 1 do
  begin
    ParamString := ParamString + Arguments[Index] + ' ';
  end;
  ParamString := Trim(ParamString);

  ShellExecute(0, 'open', PChar(AProgram),
    PChar(ParamString), nil, SW_SHOWNORMAL);
{ $ELSE}
  { TODO : Test this }
{  NewProcess := fork;
  case NewProcess of
    -1: begin
        raise Exception.Create('fork failed');
      end;

    0: begin
        open_max := sysconf(_SC_OPEN_MAX);
        for i := Succ(STDERR_FILENO) to open_max do
        begin
          fcntl(i, F_SETFD, FD_CLOEXEC);
        end;

        // Yes, I know there is a better way to do this.
        case Arguments.Count of
          0:
            begin
              execlp(PChar(AProgram), nil);
            end;
          1:
            begin
              execlp(PChar(AProgram), PChar(Arguments[0]), nil);
            end;
          2:
            begin
              execlp(PChar(AProgram),
                PChar(Arguments[0]),
                PChar(Arguments[1]),
                nil);
            end;
          3:
            begin
              execlp(PChar(AProgram),
                PChar(Arguments[0]),
                PChar(Arguments[1]),
                PChar(Arguments[2]),
                nil);
            end;
          4:
            begin
              execlp(PChar(AProgram),
                PChar(Arguments[0]),
                PChar(Arguments[1]),
                PChar(Arguments[2]),
                PChar(Arguments[3]),
                nil);
            end;
        else
          begin
            Assert(False);
          end;
        end;
      end;
  end;
{ $ENDIF}
//end;

{procedure TCustomHelpProjectOptions.RunVizGraph;
var
  GVInputFile: string;
  GVOutputFile: string;
  GVLocation: string;
  Arguments: TStringList;
begin
  if (UseGraphVizUses or UseGraphVizClasses)
    and FileExists(GraphVizDotLocation) then
  begin }
{$IFDEF LINUX}
//    ShowMessage('You will have to run the GraphViz "dot" program from the '
//      + 'command line outside of Help Generator.');
{$ELSE}
{    GVLocation := '"' + GraphVizDotLocation + '"';
    Arguments := TStringList.Create;
    try

      if UseGraphVizUses then
      begin
        GVInputFile := PasDocComponent.Generator.DestinationDirectory
          + GVUses + '.dot';
        GVOutputFile := '"' + PasDocComponent.Generator.DestinationDirectory
          + GVUses + '.' + GVImageExtension + '"';

        if FileExists(GVInputFile) then
        begin
          GVInputFile := '"' + GVInputFile + '"';

          Arguments.Add('-T' + GVImageExtension);
          Arguments.Add(GVInputFile);
          Arguments.Add('-o');
          Arguments.Add(GVOutputFile);
          RunProgram(GVLocation, Arguments);
        end;
      end;

      if UseGraphVizClasses then
      begin

        GVInputFile := PasDocComponent.Generator.DestinationDirectory
          + GVClasses + '.dot';
        GVOutputFile := '"' + PasDocComponent.Generator.DestinationDirectory
          + GVClasses + '.' + GVImageExtension + '"';

        if FileExists(GVInputFile) then
        begin
          GVInputFile := '"' + GVInputFile + '"';

          Arguments.Clear;
          Arguments.Add('-T' + GVImageExtension);
          Arguments.Add(GVInputFile);
          Arguments.Add('-o');
          Arguments.Add(GVOutputFile);
          RunProgram(GVLocation, Arguments);
        end;

      end;
    finally
      Arguments.Free;
    end;  }
{$ENDIF}
{
  end;
end;}

//function TCustomHelpProjectOptions.FullFileName(FileName: string): string;
//const
//  WrongPathDelim  = {$IFDEF MSWINDOWS} '/'; {$ELSE} '\'; {$ENDIF}
{begin
  if FileName = '' then
  begin
    result := '';
  end
  else
  begin
    result := ExpandFileName(AnsiReplaceStr(FileName, WrongPathDelim, PathDelim));
  end;
end;

function TCustomHelpProjectOptions.RelativeFileName(
  FileName: string): string;
begin
  if FileName = '' then
  begin
    result := '';
  end
  else
  begin
    result := ExtractRelativePath(FFileDirectory, FileName);
  end;
end;  }

{procedure TCustomHelpProjectOptions.Loaded;
var
  Index: integer;
begin
  inherited;
  for Index := 0 to SourceFiles.Count - 1 do
  begin
    SourceFiles[Index] := FullFileName(SourceFiles[Index]);
  end;
  ConclusionFileName := FullFileName(ConclusionFileName);
  IntroductionFileName := FullFileName(IntroductionFileName);
  for Index := 0 to IncludeDirectories.Count - 1 do
  begin
    IncludeDirectories[Index] := FullFileName(IncludeDirectories[Index]);
  end;
  OutputDirectory := FullFileName(OutputDirectory);
end; }

function TCustomHelpProjectOptions.GetVisibilities: TVisibilities;
begin
  result := [];
  if IncludePublished then
  begin
    Include(result, viPublished);
  end;
  if IncludePublic then
  begin
    Include(result, viPublic);
  end;
  if IncludeProtected then
  begin
    Include(result, viProtected);
  end;
  if IncludeStrictProtected then
  begin
    Include(result, viStrictProtected);
  end;
  if IncludePrivate then
  begin
    Include(result, viPrivate);
  end;
  if IncludeStrictPrivate then
  begin
    Include(result, viStrictPrivate);
  end;
  if IncludeAutomated then
  begin
    Include(result, viAutomated);
  end;
  if IncludeImplicit then
  begin
    Include(result, viImplicit);
  end;


end;

{procedure TCustomHelpProjectOptions.SetDefaults;
begin
  IncludePublished := True;
  IncludePublic := True;
  IncludeProtected := False;
  IncludePrivate := False;
  IncludeAutomated := False;
  IncludeImplicit := True;
  Language := lgEnglish;
  SetDefaultActivePage;
  Changed := False;
end;   }

{constructor TCustomHelpProjectOptions.Create(AOwner: TComponent);
begin
  inherited;
  FSourceFiles := TStringList.Create;
end;

destructor TCustomHelpProjectOptions.Destroy;
begin
  FSourceFiles.Free;
  inherited;
end; }

procedure ListEnum(pti: PTypeInfo; sList: TSTrings);
var
  I: integer;
begin
  with GetTypeData(pti)^ do
  begin
    for I := MinValue to MaxValue do
    begin
      sList.Add(GetEnumName(pti, I));
    end;
  end;
end;

procedure GetVisibilityNames(Names: TStrings);
var
  VisNameTypeInfo: PTypeInfo;
  Index: integer;
begin
  Names.Clear;
  VisNameTypeInfo := TypeInfo(TVisibility);
  Assert(VisNameTypeInfo^.Kind  = tkEnumeration);
  ListEnum(VisNameTypeInfo, Names);
  for Index := 0 to Names.Count -1 do
  begin
    if Copy(Names[Index], 1, 2) = 'vi' then
    begin
      Names[Index] := Copy(Names[Index], 3, MAXINT);
    end;
  end;
end;

{procedure TCustomHelpProjectOptions.RunPasDocConsol;
var
  Options: TStringList;
  OutputDir: string;
  Conditionals: TStringList;
  ConditionalPath: string;
  Index: integer;
  SourceFiles: TStringList;
  SourcePath: string;
  FooterFile: TStringList;
  FooterPath: string;
  HeaderFile: TStringList;
  HeaderPath: string;
begin
  Options := TStringList.Create;
  try
    // Always show version;
    Options.Add('--version');

    // Set the defines.
    OutputDir := OutputDirectory;
    if Directives.Count > 0 then
    begin
      Conditionals := TStringList.Create;
      try
        Conditionals.Assign(Directives);
        ConditionalPath := OutputDir + PathDelim + 'Conditionals.txt';
        Conditionals.SaveToFile(ConditionalPath);
      finally
        Conditionals.Free;
      end;
      ConditionalPath := '"' + ConditionalPath + '"';
      Options.Add('--conditionals ' + ConditionalPath);
    end;

    // Description option not supported.

    // includes option
    for Index := 0 to IncludeDirectories.Count -1 do
    begin
      Options.Add('--includes ' + '"' + IncludeDirectories[Index] + '"');
    end;

    // Set the source files.
    SourceFiles := TStringList.Create;
    try
      SourceFiles.Assign(self.SourceFiles);
      SourcePath := OutputDir + PathDelim + 'Sources.txt';
      SourceFiles.SaveToFile(SourcePath);
    finally
      SourceFiles.Free;
    end;
    SourcePath := '"' + SourcePath + '"';
    Options.Add('--source ' + SourcePath);

    //  html-help-contents not supported.

    // --name option
    if ProjectName <> '' then
    begin
      Options.Add('--name ' + '"' + ProjectName + '"');
    end;

    // --title option
    if Title <> '' then
    begin
      Options.Add('--title ' + '"' + Title + '"');
    end;

    if OutputType in [otWebPage, otHtmlHelp] then
    begin
      //  --footer option
      if Footer.Count > 0 then
      begin
        // Set the footer file.
        FooterFile := TStringList.Create;
        try
          FooterFile.Assign(self.Footer);
          FooterPath := OutputDir + PathDelim + 'Footer.txt';
          FooterFile.SaveToFile(FooterPath);
        finally
          FooterFile.Free;
        end;
        FooterPath := '"' + FooterPath + '"';
        Options.Add('--footer ' + FooterPath);
      end;

      //  --header option
      if Header.Count > 0 then
      begin
        // Set the footer file.
        HeaderFile := TStringList.Create;
        try
          HeaderFile.Assign(self.Header);
          HeaderPath := OutputDir + PathDelim + 'Header.txt';
          HeaderFile.SaveToFile(HeaderPath);
        finally
          HeaderFile.Free;
        end;
        HeaderPath := '"' + HeaderPath + '"';
        Options.Add('--header ' + HeaderPath);
      end;
    end;

    // --format option
    case OutputType of
      otWebPage:
        begin
          Options.Add('--format ' + 'html');
        end;
      otHtmlHelp:
        begin
          Options.Add('--format ' + 'htmlhelp');
        end;
      otLatex:
        begin
          Options.Add('--format ' + 'latex');
        end;
      otLatex2Rtf:
        begin
          Options.Add('--format ' + 'latex2rtf');
        end;
    else Assert(False);
    end;

    // --output option
    Options.Add('--output ' + '"' + OutputDirectory + '"');

    // --exclude-generator option not supported.

    // --language option

  finally
    Options.Free;
  end;

end;  }

{ TCustomIniFile }

{procedure TCustomIniFile.Initialize;
begin
  GraphVizDotLocation := '';
  BrowserLocation := '';
end;  }

function TCustomHelpProjectOptions.GetLanguageString: string;
begin
  result := LANGUAGE_ARRAY[GetLanguage].Name;
end;

procedure TCustomHelpProjectOptions.SetLanguageString(const Value: string);
var
  LangIndex: TLanguageID;
begin
  for LangIndex := Low(TLanguageID) to High(TLanguageID) do
  begin
    if LANGUAGE_ARRAY[LangIndex].Name = Value then
    begin
      SetLanguage(LangIndex);
      Exit;
    end;
  end;
  Assert(False);
end;

function TCustomHelpProjectOptions.GetPasDocConsoleLocation: string;
begin
  // unused dummy function
  result := ''
end;

function TCustomHelpProjectOptions.GetHtmlHelpContents: string;
begin
  result := FHtmlHelpContents;
end;

function TCustomHelpProjectOptions.GetSortOptions: TSortOptions;
begin
  result := FSortOptions;
end;

function TCustomHelpProjectOptions.GetSpellCheckIgnoreWords: TStrings;
begin
  result := FSpellCheckIgnoreWords;
end;

function TCustomHelpProjectOptions.GetSpellChecking: boolean;
begin
  result := FSpellChecking;
end;

function TCustomHelpProjectOptions.GetSpellCheckLanguage: string;
begin
  result := FSpellCheckLanguage;
end;

function TCustomHelpProjectOptions.GetSpellCheckLanguageCode: string;
begin
  result := FSpellCheckLanguageCode;
end;

procedure TCustomHelpProjectOptions.SetHtmlHelpContents(
  const AValue: string);
begin
  FHtmlHelpContents := AValue;
end;

procedure TCustomHelpProjectOptions.SetSortOptions(
  const Value: TSortOptions);
begin
  FSortOptions := Value;
end;

procedure TCustomHelpProjectOptions.SetSpellCheckIgnoreWords(
  const Value: TStrings);
begin
  FSpellCheckIgnoreWords.Assign(Value);
end;

procedure TCustomHelpProjectOptions.SetSpellChecking(const Value: boolean);
begin
  FSpellChecking := Value;
end;

procedure TCustomHelpProjectOptions.SetSpellCheckLanguage(
  const Value: string);
begin
  FSpellCheckLanguage := Value;
end;

constructor TCustomHelpProjectOptions.Create(AOwner: TComponent);
begin
  inherited;
  FSpellCheckLanguageCode := 'en';
  FSpellCheckIgnoreWords := TStringList.Create;
end;

destructor TCustomHelpProjectOptions.Destroy;
begin
  FSpellCheckIgnoreWords.Free;
  inherited;
end;

end.
