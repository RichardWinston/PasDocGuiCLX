unit ConsolProjectOptionsUnit;

interface

uses
{$IFDEF LINUX}
  Libc, QDialogs,
{$ENDIF}
{$IFDEF MSWINDOWS}
  Windows, ShellAPI,
{$ENDIF}
  SysUtils, Classes, JclSysUtils;

type
  TLineBreakQuality = (lbqStrict, lbqSloppy);
  TOutputType = (otWebPage, otHtmlHelp, otLatex, otLatex2Rtf);
  TLatexGraphicsPackage = (ltmNone, ltmPDF, ltmDVI);
  TSortOption = (soStructures, soConstants, soFunctions, soTypes, soVariables,
    soUsesClauses, soRecordFields, soNonRecordFields, soMethods, soProperties);
  TSortOptions = set of TSortOption;

  TCustomHelpOptions = class(TComponent)
  protected
    FFileDirectory: string;
    procedure Initialize; virtual;
  public
    procedure ReadFromComponentFile(const FileName: string);
    procedure SaveToComponentFile(const FileName: string);
  end;

  TConsolHelpProjectOptions = class(TCustomHelpOptions)
  private
//    function GetVisibilities: TVisibilities;
  protected
    FSourceFiles: TStrings;
    function GetChanged: boolean; virtual; abstract;
    function GetConclusion: string; virtual; abstract;
    function GetDirectives: TSTrings; virtual; abstract;
    function GetFooter: TStrings; virtual; abstract;
    function GetGraphVizDotLocation: string; virtual; abstract;
    function GetHeader: TStrings; virtual; abstract;
    function GetHtmlHelpContents: string; virtual; abstract;
//    function GetHtmlDocGeneratorComponent: THtmlDocGenerator; virtual;
//      abstract;
//    function GetHTMLHelpDocGeneratorComponent: THTMLHelpDocGenerator;
//      virtual; abstract;
    function GetHyphenatedWords: TStrings; virtual; abstract;
    function GetIncludeAutomated: boolean; virtual; abstract;
    function GetIncludeDirectories: TStrings; virtual; abstract;
    function GetIncludeImplicit: boolean; virtual; abstract;
    function GetIncludeStrictPrivate: boolean; virtual; abstract;
    function GetIncludePrivate: boolean; virtual; abstract;
    function GetIncludeStrictProtected: boolean; virtual; abstract;
    function GetIncludeProtected: boolean; virtual; abstract;
    function GetIncludePublic: boolean; virtual; abstract;
    function GetIncludePublished: boolean; virtual; abstract;
    function GetIntroduction: string; virtual; abstract;
    function GetLanguageString: string; virtual; abstract;
    function GetLatexGraphicsPackage: TLatexGraphicsPackage; virtual;
      abstract;
    function GetLineBreakQuality: TLineBreakQuality; virtual; abstract;
    function GetOutputDirectory: string; virtual; abstract;
    function GetOutputType: TOutputType; virtual; abstract;
//    function GetPasDocComponent: TPasDoc; virtual; abstract;
    function GetProjectName: string; virtual; abstract;
    function GetSourceFiles: TStrings; virtual; abstract;
    function GetSortOptions: TSortOptions; virtual; abstract;
    function GetSpellChecking: boolean; virtual; abstract;
    function GetSpellCheckIgnoreWords: TStrings; virtual; abstract;
    function GetSpellCheckLanguage: string; virtual; abstract;
    function GetSpellCheckLanguageCode: string; virtual; abstract;
//    function GetTexDocGeneratorComponent: TTexDocGenerator; virtual;
//      abstract;
    function GetTitle: string; virtual; abstract;
    function GetUseGraphVizClasses: boolean; virtual; abstract;
    function GetUseGraphVizUses: boolean; virtual; abstract;
    function GetVerbosity: integer; virtual; abstract;
    procedure Initialize; override;
    procedure Loaded; override;
    procedure SetChanged(const Value: boolean); virtual; abstract;
    procedure SetConclusion(const Value: string); virtual; abstract;
    procedure SetDefaultActivePage; virtual; abstract;
    procedure SetDirectives(const Value: TSTrings); virtual; abstract;
    procedure SetFooter(const Value: TStrings); virtual; abstract;
    procedure SetGraphVizDotLocation(const Value: string); virtual; abstract;
    procedure SetHeader(const Value: TStrings); virtual; abstract;
    procedure SetHtmlHelpContents(const AValue: string); virtual; abstract;
    procedure SetHyphenatedWords(const Value: TStrings); virtual; abstract;
    procedure SetIncludeAutomated(const Value: boolean); virtual; abstract;
    procedure SetIncludeDirectories(const Value: TStrings); virtual;
      abstract;
    procedure SetIncludeImplicit(const Value: boolean); virtual; abstract;
    procedure SetIncludeStrictPrivate(const Value: boolean); virtual; abstract;
    procedure SetIncludePrivate(const Value: boolean); virtual; abstract;
    procedure SetIncludeStrictProtected(const Value: boolean); virtual; abstract;
    procedure SetIncludeProtected(const Value: boolean); virtual; abstract;
    procedure SetIncludePublic(const Value: boolean); virtual; abstract;
    procedure SetIncludePublished(const Value: boolean); virtual; abstract;
    procedure SetIntroduction(const Value: string); virtual; abstract;
    procedure SetLanguageString(const Value: string); virtual; abstract;
    procedure SetLatexGraphicsPackage(const Value: TLatexGraphicsPackage);
      virtual; abstract;
    procedure SetLineBreakQuality(const Value: TLineBreakQuality); virtual;
      abstract;
    procedure SetOutputDirectory(const Value: string); virtual; abstract;
    procedure SetOutputType(const Value: TOutputType); virtual; abstract;
    procedure SetProjectName(const Value: string); virtual; abstract;
    procedure SetSortOptions(Const Value: TSortOptions); virtual; abstract;
    procedure SetSourceFiles(const Value: TStrings); virtual; abstract;
    procedure SetSpellChecking(const Value: boolean); virtual; abstract;
    procedure SetSpellCheckIgnoreWords(const Value: TStrings); virtual; abstract;
    procedure SetSpellCheckLanguage(const Value: string); virtual; abstract;
    procedure SetTitle(const Value: string); virtual; abstract;
    procedure SetUseGraphVizClasses(const Value: boolean); virtual; abstract;
    procedure SetUseGraphVizUses(const Value: boolean); virtual; abstract;
    procedure SetVerbosity(const Value: integer); virtual; abstract;
    function GetPasDocConsoleLocation: string; virtual; abstract;
  public
    class procedure DefaultDefines(Defines: TStrings);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function FullFileName(FileName: string): string;
    function RelativeFileName(FileName: string): string;
    procedure RunPasDocConsol(OutputLineCallback: TTextHandler);
    procedure RunProgram(AProgram: string; Arguments: TStringList);
    procedure RunVizGraph(OutputLineCallback: TTextHandler);
    procedure SetDefaults;
    property Changed: boolean read GetChanged write SetChanged;
{
    property HtmlDocGeneratorComponent: THtmlDocGenerator read
      GetHtmlDocGeneratorComponent;
    property HTMLHelpDocGeneratorComponent: THTMLHelpDocGenerator read
      GetHTMLHelpDocGeneratorComponent;
    property PasDocComponent: TPasDoc read GetPasDocComponent;
    property TexDocGeneratorComponent: TTexDocGenerator read
      GetTexDocGeneratorComponent;
}
//    property Visibilities: TVisibilities read GetVisibilities;
  published
    property ConclusionFileName: string read GetConclusion write SetConclusion
      stored True;
    property Directives: TSTrings read GetDirectives write SetDirectives
      stored True;
    property Footer: TStrings read GetFooter write SetFooter stored True;
    property GraphVizDotLocation: string read GetGraphVizDotLocation write
      SetGraphVizDotLocation stored False;
    property Header: TStrings read GetHeader write SetHeader stored True;
    property HtmlHelpContents: string read GetHtmlHelpContents
      write SetHtmlHelpContents stored True;
    property HyphenatedWords: TStrings read GetHyphenatedWords write
      SetHyphenatedWords stored True;
    property IncludeAutomated: boolean read GetIncludeAutomated write
      SetIncludeAutomated stored True;
    property IncludeDirectories: TStrings read GetIncludeDirectories write
      SetIncludeDirectories stored True;
    property IncludeStrictPrivate: boolean read GetIncludeStrictPrivate write SetIncludeStrictPrivate;
    property IncludePrivate: boolean read GetIncludePrivate write
      SetIncludePrivate stored True;
    property IncludeStrictProtected: boolean read GetIncludeStrictProtected write SetIncludeStrictProtected;
    property IncludeProtected: boolean read GetIncludeProtected write
      SetIncludeProtected stored True;
    property IncludePublic: boolean read GetIncludePublic write
      SetIncludePublic stored True;
    property IncludePublished: boolean read GetIncludePublished write
      SetIncludePublished stored True;
    property IncludeImplicit: boolean read GetIncludeImplicit write SetIncludeImplicit;
    property IntroductionFileName: string read GetIntroduction write
      SetIntroduction stored True;
    property LanguageString: string read GetLanguageString
      write SetLanguageString stored True;
    property LatexGraphicsPackage: TLatexGraphicsPackage read
      GetLatexGraphicsPackage write SetLatexGraphicsPackage stored True;
    property LineBreakQuality: TLineBreakQuality read GetLineBreakQuality
      write SetLineBreakQuality stored True;
    property OutputDirectory: string read GetOutputDirectory write
      SetOutputDirectory stored True;
    property OutputType: TOutputType read GetOutputType write SetOutputType
      stored True;
    property ProjectName: string read GetProjectName write SetProjectName
      stored True;
    property SortOptions: TSortOptions read GetSortOptions write SetSortOptions;
    property SourceFiles: TStrings read GetSourceFiles write SetSourceFiles
      stored True;
    property SpellChecking:  boolean read GetSpellChecking write SetSpellChecking;
    property SpellCheckIgnoreWords: TStrings read GetSpellCheckIgnoreWords
      write SetSpellCheckIgnoreWords;
    property SpellCheckLanguage: string read GetSpellCheckLanguage
      write SetSpellCheckLanguage;
    property SpellCheckLanguageCode: string read GetSpellCheckLanguageCode;
    property Title: string read GetTitle write SetTitle stored True;
    property UseGraphVizClasses: boolean read GetUseGraphVizClasses write
      SetUseGraphVizClasses stored True;
    property UseGraphVizUses: boolean read GetUseGraphVizUses write
      SetUseGraphVizUses stored True;
    property Verbosity: integer read GetVerbosity write SetVerbosity stored
      True;
  end;

  TCustomIniFile = class(TCustomHelpOptions)
  private
  protected
    function GetGraphVizDotLocation: string; virtual; abstract;
    procedure SetGraphVizDotLocation(const Value: string); virtual; abstract;
    function GetBrowserLocation: string; virtual; abstract;
    procedure SetBrowserLocation(const Value: string); virtual; abstract;
    function GetPasDocConsoleLocation: string; virtual; abstract;
    procedure SetPasDocConsoleLocation(const Value: string); virtual; abstract;
    procedure Initialize; override;
  published
    property GraphVizDotLocation: string read GetGraphVizDotLocation
      write SetGraphVizDotLocation stored True;
    property BrowserLocation: string read GetBrowserLocation
      write SetBrowserLocation stored True;
    property PasDocConsoleLocation: string read GetPasDocConsoleLocation
      write SetPasDocConsoleLocation stored True;
  end;

  TIniFileClass = class of TCustomIniFile;

procedure GetVisibilityNames(Names: TStrings);
function IniFileName: string;
procedure ReadIniFile(IniClass: TIniFileClass);
procedure WriteIniFile(IniClass: TIniFileClass);


const
{$IFDEF MSWINDOWS}
  ReadWritePermissions = 0;
{$ELSE}
  ReadWritePermissions = S_IREAD or S_IWRITE or S_IRGRP or S_IWGRP or
    S_IROTH;
{$ENDIF}

const
  GVUses = 'GVUses';
  GVClasses = 'GVClasses';
  GVImageExtension = 'png';

type
  LanguageRecord = record
    Name: string;
    Abbreviation: string;
  end;

const
  MaxLanguages = 20;
  Languages : array[0..MaxLanguages] of LanguageRecord = (
    (Name: 'Bosnian (Codepage 1250)'; Abbreviation: 'ba'),
    (Name: 'Brasilian'; Abbreviation: 'br'),
    (Name: 'Catalan'; Abbreviation: 'ct'),
    (Name: 'Chinese (Codepage 950)'; Abbreviation: 'big5'),
    (Name: 'Danish'; Abbreviation: 'dk'),
    (Name: 'Dutch'; Abbreviation: 'nl'),
    (Name: 'English'; Abbreviation: 'en'),
    (Name: 'French'; Abbreviation: 'fr'),
    (Name: 'German'; Abbreviation: 'de'),
    (Name: 'Hungarian (Codepage 1250)'; Abbreviation: 'hu.1250'),
    (Name: 'Indonesian'; Abbreviation: 'id'),
    (Name: 'Italian'; Abbreviation: 'it'),
    (Name: 'Javanese'; Abbreviation: 'jv'),
    (Name: 'Polish (Codepage CP1250)'; Abbreviation: ' pl.cp1250'),
    (Name: 'Polish (Codepage ISO 8859-2)'; Abbreviation: 'pl.iso-8859-2'),
    (Name: 'Russian (Codepage 1251)'; Abbreviation: 'ru.1251'),
    (Name: 'Russian (Codepage 866)'; Abbreviation: 'ru.866'),
    (Name: 'Russian (KOI-8)'; Abbreviation: 'ru.KOI8'),
    (Name: 'Spanish'; Abbreviation: 'es'),
    (Name: 'Swedish'; Abbreviation: 'se'),
    (Name: 'Slovak'; Abbreviation: 'sk')
    );
resourcestring
  kPublished = 'Published';
  kPublic = 'Public';
  kProtected = 'Protected';
  kStrictProtected = 'Strict Protected';
  kPrivate = 'Private';
  kStrictPrivate = 'Strict Private';
  kAutomated = 'Automated';
  kImplicit = 'Implicit';

implementation

uses StrUtils;

procedure GetVisibilityNames(Names: TStrings);
begin
  Names.Clear;
  // hard code names
  Names.Add(kPublished);
  Names.Add(kPublic);
  Names.Add(kProtected);
  Names.Add(kStrictProtected);
  Names.Add(kPrivate);
  Names.Add(kStrictPrivate);
  Names.Add(kAutomated);
  Names.Add(kImplicit);
end;

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
  Ini := IniClass.Create(nil);
  try
    if FileExists(FileName) then
    begin
      Ini.ReadFromComponentFile(FileName);
    end
    else
    begin
      FileName := ParamStr(0);
      FileName := ExpandFileName(FileName);
      FileName := ExtractFileDir(FileName) + PathDelim;
{$IFDEF LINUX}
      FileName := FileName + 'pasdoc';
{$ELSE}
      FileName := FileName + 'pasdoc.exe';
{$ENDIF}
      Ini.PasDocConsoleLocation := FileName;
    end;
  finally
    Ini.Free;
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


{ TCustomHelpOptions }

procedure TCustomHelpOptions.Initialize;
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
end;

procedure TCustomHelpOptions.SaveToComponentFile(const FileName: string);
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
end;

{ TConsolHelpProjectOptions }

constructor TConsolHelpProjectOptions.Create(AOwner: TComponent);
begin
  inherited;
  FSourceFiles := TStringList.Create;
end;

class procedure TConsolHelpProjectOptions.DefaultDefines(
  Defines: TStrings);
begin
  Defines.Clear;
{$IFDEF LINUX}
  Defines.Add('LINUX');
{$ENDIF}
{$IFDEF DEBUG}
  Defines.Add('DEBUG');
{$ENDIF}

{$IFDEF VER130}
  Defines.Add('VER130');
{$ENDIF}
{$IFDEF VER140}
  Defines.Add('VER140');
{$ENDIF}
{$IFDEF VER150}
  Defines.Add('VER150');
{$ENDIF}
{$IFDEF VER160}
  Defines.Add('VER160');
{$ENDIF}
{$IFDEF VER170}
  Defines.Add('VER170');
{$ENDIF}
{$IFDEF MSWINDOWS}
  Defines.Add('MSWINDOWS');
{$ENDIF}
{$IFDEF WIN32}
  Defines.Add('WIN32');
{$ENDIF}
{$IFDEF CPU386}
  Defines.Add('CPU386');
{$ENDIF}
{$IFDEF CONDITIONALEXPRESSIONS}
  Defines.Add('CONDITIONALEXPRESSIONS');
{$ENDIF}
end;

destructor TConsolHelpProjectOptions.Destroy;
begin
  FSourceFiles.Free;
  inherited;
end;

function TConsolHelpProjectOptions.FullFileName(FileName: string): string;
const
  WrongPathDelim  = {$IFDEF MSWINDOWS} '/' {$ELSE} '\' {$ENDIF};
begin
  if FileName = '' then
  begin
    result := '';
  end
  else
  begin
    result := ExpandFileName(AnsiReplaceStr(FileName, WrongPathDelim, PathDelim));
  end;
end;

procedure TConsolHelpProjectOptions.Initialize;
begin
  SpellCheckIgnoreWords.Clear;
  SpellCheckLanguage := '';
  ConclusionFileName := '';
  Directives.Clear;
  Footer.Clear;
  Header.Clear;
  HtmlHelpContents := '';
  IncludeDirectories.Clear;
  IntroductionFileName := '';
  OutputDirectory := '';
  ProjectName := '';
  SourceFiles.Clear;
  HyphenatedWords.Clear;
  Title := '';
end;

procedure TConsolHelpProjectOptions.Loaded;
var
  Index: integer;
  SpellWords : TStringList;
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
  SpellWords := TStringList.Create;
  try
    SpellWords.Duplicates := dupIgnore;
    SpellWords.CaseSensitive := True;
    SpellWords.AddStrings(SpellCheckIgnoreWords);
    for Index := 0 to SpellWords.Count -1 do
    begin
      SpellWords[Index] := Trim(SpellWords[Index]);
    end;
    SpellWords.Sorted := True;
    for Index := SpellWords.Count -2 downto 0 do
    begin
      if SpellWords[Index] = SpellWords[Index+1] then
      begin
        SpellWords.Delete(Index);
      end;
    end;

    SpellCheckIgnoreWords := SpellWords;
  finally
    SpellWords.Free;
  end;
end;

function TConsolHelpProjectOptions.RelativeFileName(
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
end;

procedure TConsolHelpProjectOptions.RunPasDocConsol(
  OutputLineCallback: TTextHandler);
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
  Lang: string;
  Abbreviation: string;
  VisibilityString: string;
  LatexHead: TStringList;
  LatexHeadPath: string;
  OptionString: string;
  CommandLine: string;
  CommandFile: TStringList;
  CommandFilePath: string;
  SpellCheckIgnoreWordsPath: string;
begin
  Options := TStringList.Create;
  try
    OutputDir := OutputDirectory;
    Assert(OutputDir <> '');
    if not DirectoryExists(OutputDir) then
    begin
      Assert(ForceDirectories(OutputDir));
    end;

    // --version option is not appropriate here so it isn't used.

    // --source option
    SourceFiles := TStringList.Create;
    try
      SourceFiles.Assign(self.SourceFiles);
      SourcePath := OutputDir + PathDelim + 'Sources.txt';
      SourceFiles.SaveToFile(SourcePath);
    finally
      SourceFiles.Free;
    end;
    SourcePath := '"' + SourcePath + '"';
    Options.Add('--source=' + SourcePath);

    // --output option
    Options.Add('--output=' + '"' + OutputDirectory + '"');

    // --verbosity option
    Options.Add('--verbosity=' + IntToStr(self.Verbosity));

    // --define option not used because --conditionals option used instead

    // --conditionals option
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
      Options.Add('--conditionals=' + ConditionalPath);
    end;

    // --description option not supported because it is broken.

    // --include option
    for Index := 0 to IncludeDirectories.Count -1 do
    begin
      Options.Add('--include=' + '"' + IncludeDirectories[Index] + '"');
    end;

    //  html-help-contents
    if (OutputType = otHtmlHelp) and (HtmlHelpContents <> '') then
    begin
      Options.Add('--html-help-contents=' + '"' + HtmlHelpContents + '"');
    end;

    // --name option
    if ProjectName <> '' then
    begin
      Options.Add('--name=' + '"' + ProjectName + '"');
    end;

    // --title option
    if Title <> '' then
    begin
      Options.Add('--title=' + '"' + Title + '"');
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
        Options.Add('--footer=' + FooterPath);
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
        Options.Add('--header=' + HeaderPath);
      end;
    end;

    // --format option
    case OutputType of
      otWebPage:
        begin
          Options.Add('--format=' + 'html');
        end;
      otHtmlHelp:
        begin
          Options.Add('--format=' + 'htmlhelp');
        end;
      otLatex:
        begin
          Options.Add('--format=' + 'latex');
        end;
      otLatex2Rtf:
        begin
          Options.Add('--format=' + 'latex2rtf');
        end;
    else Assert(False);
    end;

    // --exclude-generator option not supported.

    // --language option
    Abbreviation := '';
    Lang := self.LanguageString;
    for Index := 0 to Length(Languages) -1 do
    begin
      if Languages[Index].Name = Lang then
      begin
        Abbreviation := Languages[Index].Abbreviation;
        break;
      end;
    end;
    Assert(Abbreviation <> '');
    Options.Add('--language=' + Abbreviation);

    // --staronly option not supported.
    // --marker option not supported.
    // --marker-optional option not supported.
    //  --numericfilenames option not supported.

    // --visible-members
    VisibilityString := '';
    if self.IncludePublished then
    begin
      VisibilityString := VisibilityString + 'published,';
    end;
    if self.IncludePublic then
    begin
      VisibilityString := VisibilityString + 'public,';
    end;
    if self.IncludeProtected then
    begin
      VisibilityString := VisibilityString + 'protected,';
    end;
    if self.IncludeStrictProtected then
    begin
      VisibilityString := VisibilityString + 'strictprotected,';
    end;
    if self.IncludePrivate then
    begin
      VisibilityString := VisibilityString + 'private,';
    end;
    if self.IncludeStrictPrivate then
    begin
      VisibilityString := VisibilityString + 'strictprivate,';
    end;
    if self.IncludeAutomated then
    begin
      VisibilityString := VisibilityString + 'automated,';
    end;
    // not included in released version.
    if self.IncludeImplicit then
    begin
      VisibilityString := VisibilityString + 'implicit,';
    end;

    if Length(VisibilityString) > 0 then
    begin
      SetLength(VisibilityString, Length(VisibilityString) -1);
    end;
    Options.Add('--visible-members ' + VisibilityString);

    // --write-uses-list option always included
    Options.Add('--write-uses-list ');

    // --graphviz-uses and --link-gv-uses options
    if self.UseGraphVizUses then
    begin
      Options.Add('--graphviz-uses ');
      // only png format supported here.
      // dot can also make jpg files.
      Options.Add('--link-gv-uses png ');
    end;

    // --graphviz-classes and --link-gv-classes options
    if self.UseGraphVizClasses then
    begin
      Options.Add('--graphviz-classes ');
      // only png format supported here.
      // dot can also make jpg files.
      Options.Add('--link-gv-classes png ');
    end;

    // --abbreviations option not supported.

    // --aspell option not supported - not implemented in Delphi.
    // --spell-check-ignore-words option  not supported
    if SpellChecking then
    begin
      Options.Add('--aspell=' + SpellCheckLanguageCode);
      if SpellCheckIgnoreWords.Count > 0 then
      begin
        SpellCheckIgnoreWordsPath := OutputDir + PathDelim + 'ASpellIgnoreWords.txt';
        SpellCheckIgnoreWords.SaveToFile(SpellCheckIgnoreWordsPath);
        Options.Add('--spell-check-ignore-words=' + '"' + SpellCheckIgnoreWordsPath + '"');
      end;
    end;

    // --cache-dir option not supported

    // --link-look=stripped option set by default
    Options.Add('--link-look=stripped ');

    // --full-link option is deprecated

    // --auto-abstract option set by default
    Options.Add('--auto-abstract ');

    // --css option not supported.

    // --use-tipue-search is set by default for html output
    if self.OutputType = otWebPage then
    begin
      Options.Add('--use-tipue-search ');
    end;

    // --sort option not supported.

    // --introduction option
    if self.IntroductionFileName <> '' then
    begin
      Options.Add('--introduction=' + '"' + IntroductionFileName + '"');
    end;

    // --conclusion option
    if self.ConclusionFileName <> '' then
    begin
      Options.Add('--conclusion=' + '"' + ConclusionFileName + '"');
    end;

    // --latex-head option
    if self.OutputType in [otLatex, otLatex2Rtf] then
    begin
      LatexHead:= TStringList.Create;
      try
        if LineBreakQuality = lbqSloppy then
        begin
          LatexHead.Add('\sloppy');
        end;
        if HyphenatedWords.Count > 0 then
        begin
          LatexHead.Add('\hyphenation{');
          for Index := 0 to HyphenatedWords.Count - 1 do
          begin
            LatexHead.Add(HyphenatedWords[Index]);
          end;
          LatexHead.Add('}');
        end;
        case LatexGraphicsPackage of
          ltmNone:
            begin
              // do nothing
            end;
          ltmPDF:
            begin
              LatexHead.Add('\usepackage[pdftex]{graphicx}');
            end;
          ltmDVI:
            begin
              LatexHead.Add('\usepackage[dvips]{graphicx}');
            end;
        else Assert(False);
        end;
        if LatexHead.Count > 0 then
        begin
          LatexHeadPath := OutputDir + PathDelim + 'LatexHead.txt';
          LatexHead.SaveToFile(LatexHeadPath);
          Options.Add('--latex-head ' + '"' + LatexHeadPath + '"');
        end;
      finally
        LatexHead.Free;
      end;
    end;

    // --implicit-visibility=implicit option set by default
    Options.Add('--implicit-visibility=implicit ');

    OptionString := '';
    for Index := 0 to Options.Count -1 do
    begin
      OptionString := OptionString + Options[Index] + ' ';
    end;

    CommandLine := GetPasDocConsoleLocation;
    if CommandLine = '' then
    begin
      OutputLineCallback('Error: PasDoc console not specified');
      Exit;
    end;

    CommandLine := '"' + CommandLine + '"' + ' ' + OptionString;

    CommandFile := TStringList.Create;
    try
      CommandFile.Add(CommandLine);
      {$IFDEF WIN32}
      CommandFilePath := OutputDir + PathDelim + 'pasdoc.bat';
      {$ELSE}
      CommandFilePath := OutputDir + PathDelim + 'pasdoc.sh';
      {$ENDIF}
      CommandFile.SaveToFile(CommandFilePath);
    finally
      CommandFile.Free;
    end;

    Execute(CommandFilePath, OutputLineCallback);
//    Execute(CommandLine, OutputLineCallback);
  finally
    Options.Free;
  end;
end;

procedure TConsolHelpProjectOptions.RunProgram(AProgram: string;
  Arguments: TStringList);
var
{$IFDEF WIN32}
  Index: integer;
  ParamString: string;
{$ELSE}
  NewProcess: pid_t;
  open_max: Longint;
  i: Longint;
{$ENDIF}
begin
{$IFDEF WIN32}
  ParamString := '';
  for Index := 0 to Arguments.Count - 1 do
  begin
    ParamString := ParamString + Arguments[Index] + ' ';
  end;
  ParamString := Trim(ParamString);

  ShellExecute(0, 'open', PChar(AProgram),
    PChar(ParamString), nil, SW_SHOWNORMAL);
{$ELSE}
  { TODO : Test this }
  NewProcess := fork;
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
{$ENDIF}
end;

procedure TConsolHelpProjectOptions.RunVizGraph(OutputLineCallback: TTextHandler);
var
  GVInputFile: string;
  GVOutputFile: string;
  GVLocation: string;
  Arguments: TStringList;
  OptionString: string;
  Index: integer;
  CommandLine: string;
begin
  if (UseGraphVizUses or UseGraphVizClasses)
    and FileExists(GraphVizDotLocation) then
  begin
    OutputLineCallback('');
    OutputLineCallback('Starting GraphViz');
{ $IFDEF LINUX}
//    ShowMessage('You will have to run the GraphViz "dot" program from the '
//      + 'command line outside of Help Generator.');
{ $ELSE}
    GVLocation := '"' + GraphVizDotLocation + '"';
    Arguments := TStringList.Create;
    try

      if UseGraphVizUses then
      begin
        OutputLineCallback('Creating "Uses" diagram.');
        GVInputFile := OutputDirectory + PathDelim
          + GVUses + '.dot';
        GVOutputFile := '"' + OutputDirectory + PathDelim
          + GVUses + '.' + GVImageExtension + '"';

        if FileExists(GVInputFile) then
        begin
          GVInputFile := '"' + GVInputFile + '"';

          Arguments.Add('-T' + GVImageExtension);
          Arguments.Add(GVInputFile);
          Arguments.Add('-o');
          Arguments.Add(GVOutputFile);

          OptionString := '';
          for Index := 0 to Arguments.Count -1 do
          begin
            OptionString := OptionString + Arguments[Index] + ' ';
          end;
          if Length(OptionString) > 0 then
          begin
            SetLength(OptionString, Length(OptionString)-1);
          end;
          CommandLine := GVLocation + ' ' + OptionString;

          Execute(CommandLine, OutputLineCallback);

          //RunProgram(GVLocation, Arguments);
        end;
      end;

      if UseGraphVizClasses then
      begin
        OutputLineCallback('Creating "Classes" diagram.');

        GVInputFile := OutputDirectory + PathDelim
          + GVClasses + '.dot';
        GVOutputFile := '"' + OutputDirectory + PathDelim
          + GVClasses + '.' + GVImageExtension + '"';

        if FileExists(GVInputFile) then
        begin
          GVInputFile := '"' + GVInputFile + '"';

          Arguments.Clear;
          Arguments.Add('-T' + GVImageExtension);
          Arguments.Add(GVInputFile);
          Arguments.Add('-o');
          Arguments.Add(GVOutputFile);
          OptionString := '';
          
          for Index := 0 to Arguments.Count -1 do
          begin
            OptionString := OptionString + Arguments[Index] + ' ';
          end;
          if Length(OptionString) > 0 then
          begin
            SetLength(OptionString, Length(OptionString)-1);
          end;
          CommandLine := GVLocation + ' ' + OptionString;

          Execute(CommandLine, OutputLineCallback);
        end;

      end;
    finally
      Arguments.Free;
    end;
{ $ENDIF}

  end;
end;

procedure TConsolHelpProjectOptions.SetDefaults;
begin
  IncludePublished := True;
  IncludePublic := True;
  IncludeProtected := False;
  IncludePrivate := False;
  IncludeAutomated := False;
  IncludeImplicit := True;
  LanguageString := 'English';
  SetDefaultActivePage;
  Changed := False;
  SortOptions := [soStructures, soConstants, soFunctions, soTypes, soVariables,
    soNonRecordFields, soMethods, soProperties]
end;

{ TCustomIniFile }

procedure TCustomIniFile.Initialize;
begin
  GraphVizDotLocation := '';
  BrowserLocation := '';
end;


end.
