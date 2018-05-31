object frmHelpGenerator: TfrmHelpGenerator
  Left = 406
  Top = 162
  Width = 699
  Height = 695
  HelpType = htKeyword
  HelpKeyword = 'HelpGeneratorVCL'
  Caption = 'Help Generator'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 20
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 691
    Height = 645
    ActivePage = tabGenerate
    Align = alClient
    TabOrder = 0
    OnChange = pcMainChange
    OnChanging = pcMainChanging
    object tabOptions: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'HelpGeneratorVCL#Options_Tab'
      Caption = 'Options'
      ImageIndex = 2
      DesignSize = (
        683
        610)
      object Label1: TLabel
        Left = 455
        Top = 8
        Width = 207
        Height = 40
        Anchors = [akTop, akRight]
        Caption = 'Properties, Methods, Events, and Fields to include'
        WordWrap = True
      end
      object Label2: TLabel
        Left = 8
        Top = 120
        Width = 423
        Height = 20
        Caption = 'Language (This is the language used in the documentation.)'
      end
      object Label3: TLabel
        Left = 8
        Top = 256
        Width = 557
        Height = 20
        Caption = 
          'Output Directory (This is the directory where the documentation ' +
          'will be created.)'
      end
      object Label6: TLabel
        Left = 8
        Top = 8
        Width = 411
        Height = 40
        Caption = 
          'Project Name (The Project Name is used to name some of the gener' +
          'ated documentation.'
        WordWrap = True
      end
      object Label7: TLabel
        Left = 136
        Top = 435
        Width = 465
        Height = 60
        Caption = 
          'Message Level (This controls what sort of messages will apear on' +
          ' the Generate tab when the documentation is created.  The higher' +
          ' the number, the more messages will be shown.)'
        WordWrap = True
      end
      object Label11: TLabel
        Left = 336
        Top = 508
        Width = 87
        Height = 20
        Caption = 'Output Type'
      end
      object Label13: TLabel
        Left = 8
        Top = 312
        Width = 85
        Height = 20
        Caption = 'Introduction'
      end
      object Label14: TLabel
        Left = 8
        Top = 376
        Width = 78
        Height = 20
        Caption = 'Conclusion'
      end
      object Label17: TLabel
        Left = 8
        Top = 192
        Width = 29
        Height = 20
        Caption = 'Title'
      end
      object Label19: TLabel
        Left = 8
        Top = 536
        Width = 117
        Height = 20
        Caption = 'Browser location'
      end
      object clbMethodVisibility: TCheckListBox
        Left = 455
        Top = 57
        Width = 223
        Height = 136
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Properties_Methods_Events_and_Fields'
        OnClickCheck = clbMethodVisibilityClickCheck
        Anchors = [akTop, akRight]
        ItemHeight = 20
        Items.Strings = (
          'Published'
          'Public'
          'Protected'
          'Private'
          'Automated')
        TabOrder = 2
      end
      object comboLanguages: TComboBox
        Left = 8
        Top = 152
        Width = 440
        Height = 28
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Language'
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 0
        TabOrder = 1
        OnChange = comboLanguagesChange
      end
      object edOutput: TEdit
        Left = 8
        Top = 280
        Width = 583
        Height = 28
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Output_Directory'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        OnChange = edProjectNameChange
      end
      object btnBrowseOutputDirectory: TButton
        Left = 598
        Top = 282
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Browse'
        TabOrder = 5
        OnClick = btnBrowseOutputDirectoryClick
      end
      object edProjectName: TEdit
        Left = 8
        Top = 56
        Width = 432
        Height = 28
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Project_Name'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = edProjectNameChange
      end
      object seVerbosity: TSpinEdit
        Left = 8
        Top = 450
        Width = 121
        Height = 31
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Message_Level'
        MaxValue = 6
        MinValue = 0
        TabOrder = 10
        Value = 2
        OnChange = edProjectNameChange
      end
      object comboGenerateFormat: TComboBox
        Left = 8
        Top = 504
        Width = 321
        Height = 28
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Output_Type'
        Style = csDropDownList
        ItemHeight = 20
        ItemIndex = 0
        TabOrder = 11
        Text = 'Generate Web pages'
        OnChange = comboGenerateFormatChange
        Items.Strings = (
          'Generate Web pages'
          'Generate HTML Help Workshop project'
          'Generate LaTex documentation.'
          'Generate Latex for Latex2Rtf')
      end
      object edIntroduction: TEdit
        Left = 8
        Top = 336
        Width = 583
        Height = 28
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Introduction'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        OnChange = edProjectNameChange
      end
      object btnIntroduction: TButton
        Left = 598
        Top = 338
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Browse'
        TabOrder = 7
        OnClick = btnIntroductionClick
      end
      object edConclusion: TEdit
        Left = 8
        Top = 400
        Width = 583
        Height = 28
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Conclusion'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        OnChange = edProjectNameChange
      end
      object btnConclusion: TButton
        Left = 598
        Top = 402
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Browse'
        TabOrder = 9
        OnClick = btnConclusionClick
      end
      object edTitle: TEdit
        Left = 8
        Top = 216
        Width = 664
        Height = 28
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Title'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        OnChange = edProjectNameChange
      end
      object edBrowser: TEdit
        Left = 8
        Top = 560
        Width = 583
        Height = 28
        Cursor = crIBeam
        HelpKeyword = 'HelpGeneratorCLX#Output_Directory'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 12
        OnChange = edProjectNameChange
      end
      object Button1: TButton
        Left = 598
        Top = 560
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Browse'
        TabOrder = 13
        OnClick = Button1Click
      end
    end
    object tabMoreOptions: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'HelpGeneratorVCL#More_Options_Tab'
      Caption = 'More Options'
      ImageIndex = 6
      DesignSize = (
        683
        610)
      object Label15: TLabel
        Left = 8
        Top = 320
        Width = 260
        Height = 20
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#'
        Caption = 'Location of GraphViz "Dot" Program.'
      end
      object Label16: TLabel
        Left = 120
        Top = 384
        Width = 355
        Height = 20
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#'
        Caption = 'Hyph-en-at-ed Words (only English letters allowed)'
      end
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 394
        Height = 20
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#'
        Caption = 'Header (This text will appear at the top of the web page)'
      end
      object Label5: TLabel
        Left = 8
        Top = 136
        Width = 415
        Height = 20
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#'
        Caption = 'Footer (This text will appear at the bottom of the web page)'
      end
      object Label18: TLabel
        Left = 376
        Top = 256
        Width = 181
        Height = 20
        Caption = 'LaTeX Graphics Package'
      end
      object cbUseGraphVizClasses: TCheckBox
        Left = 8
        Top = 288
        Width = 345
        Height = 17
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#GraphVizClasses'
        Caption = 'Create and Use GraphViz Classes Diagram'
        TabOrder = 3
        OnClick = cbUseGraphVizClick
      end
      object cbUseGraphVizUses: TCheckBox
        Left = 8
        Top = 264
        Width = 345
        Height = 17
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#GraphVizUses'
        Caption = 'Create and Use GraphViz Uses Diagram'
        TabOrder = 2
        OnClick = cbUseGraphVizClick
      end
      object edGraphVizDotLocation: TEdit
        Left = 8
        Top = 344
        Width = 568
        Height = 28
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Location_of_GraphViz_Dot_Program'
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        Enabled = False
        TabOrder = 4
        OnChange = edGraphVizDotLocationChange
      end
      object btnVizGraph: TButton
        Left = 591
        Top = 346
        Width = 75
        Height = 25
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#'
        Anchors = [akTop, akRight]
        Caption = 'Browse'
        Enabled = False
        TabOrder = 5
        OnClick = btnVizGraphClick
      end
      object memoHyphenatedWords: TMemo
        Left = 120
        Top = 408
        Width = 552
        Height = 192
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Hyph-en-at-ed_Words'
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clBtnFace
        Enabled = False
        TabOrder = 7
      end
      object rgLineBreakQuality: TRadioGroup
        Left = 8
        Top = 400
        Width = 105
        Height = 81
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Line_Breaks'
        Caption = 'Line Breaks'
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          'strict'
          'sloppy')
        TabOrder = 6
      end
      object memoHeader: TMemo
        Left = 8
        Top = 40
        Width = 663
        Height = 81
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Header'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        WordWrap = False
        OnChange = edProjectNameChange
      end
      object memoFooter: TMemo
        Left = 8
        Top = 168
        Width = 663
        Height = 81
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Footer'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        WordWrap = False
        OnChange = edProjectNameChange
      end
      object comboLatexGraphics: TComboBox
        Left = 376
        Top = 280
        Width = 137
        Height = 28
        Style = csDropDownList
        Color = clBtnFace
        Enabled = False
        ItemHeight = 20
        ItemIndex = 0
        TabOrder = 8
        Text = 'None'
        OnChange = edProjectNameChange
        Items.Strings = (
          'None'
          'PDF'
          'DVI')
      end
    end
    object tabSourceFiles: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'HelpGeneratorVCL#Source_Files_Tab'
      Caption = 'Source Files'
      ImageIndex = 3
      object memoFiles: TMemo
        Left = 0
        Top = 121
        Width = 683
        Height = 442
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Source_Files_Tab'
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
        OnChange = edProjectNameChange
      end
      object Panel3: TPanel
        Left = 0
        Top = 563
        Width = 683
        Height = 41
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#'
        Align = alBottom
        TabOrder = 2
        object btnBrowseSourceFiles: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          HelpType = htKeyword
          HelpKeyword = 'HelpGeneratorVCL#Source_Files_Tab'
          Caption = 'Browse'
          TabOrder = 0
          OnClick = btnBrowseSourceFilesClick
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 683
        Height = 121
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#'
        Align = alTop
        TabOrder = 0
        DesignSize = (
          683
          121)
        object Label8: TLabel
          Left = 8
          Top = 8
          Width = 645
          Height = 60
          HelpType = htKeyword
          HelpKeyword = 'HelpGeneratorVCL#'
          Anchors = [akLeft, akTop, akRight]
          Caption = 
            'Add the full paths of all the source files you wish to include i' +
            'n your project. The directories for each file will be automatica' +
            'lly added to the "Include" directories if you use the "Browse" b' +
            'utton to add the source files.'
          WordWrap = True
        end
      end
    end
    object tabIncludeDirectories: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'HelpGeneratorVCL#Include_Directories_Tab'
      Caption = 'Include Directories'
      ImageIndex = 4
      object memoIncludeDirectories: TMemo
        Left = 0
        Top = 121
        Width = 683
        Height = 442
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Include_Directories_Tab'
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
        OnChange = edProjectNameChange
      end
      object Panel2: TPanel
        Left = 0
        Top = 563
        Width = 683
        Height = 41
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#'
        Align = alBottom
        TabOrder = 2
        object btnBrowseIncludeDirectory: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          HelpType = htKeyword
          HelpKeyword = 'HelpGeneratorVCL#Include_Directories_Tab'
          Caption = 'Browse'
          TabOrder = 0
          OnClick = btnBrowseIncludeDirectoryClick
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 683
        Height = 121
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#'
        Align = alTop
        TabOrder = 0
        DesignSize = (
          683
          121)
        object Label9: TLabel
          Left = 8
          Top = 8
          Width = 633
          Height = 60
          HelpType = htKeyword
          HelpKeyword = 'HelpGeneratorVCL#'
          Anchors = [akLeft, akTop, akRight]
          Caption = 
            'If any of you source files have include files, you need to give ' +
            'the directory where those include files are located.  (See the D' +
            'elphi help on $I if you don'#39't know what and include file is.)'
          WordWrap = True
        end
      end
    end
    object tabDefines: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'HelpGeneratorVCL#Defines_Tab'
      Caption = 'Defines'
      ImageIndex = 5
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 683
        Height = 113
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#'
        Align = alTop
        TabOrder = 0
        DesignSize = (
          683
          113)
        object Label12: TLabel
          Left = 8
          Top = 8
          Width = 650
          Height = 60
          HelpType = htKeyword
          HelpKeyword = 'HelpGeneratorVCL#'
          Anchors = [akLeft, akTop, akRight]
          Caption = 
            'If any "conditonal defines" are used in your program, list them ' +
            'here.  Your compiler may have some "conditional defines" already' +
            ' defined.  For example "VER150" is predefined in Delphi 7.  See ' +
            'the help on "conditional compilation" in your compiler for more ' +
            'information.'
          WordWrap = True
        end
      end
      object memoDefines: TMemo
        Left = 0
        Top = 113
        Width = 683
        Height = 497
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Defines_Tab'
        Align = alClient
        Lines.Strings = (
          'VER150'
          'MSWINDOWS'
          'WIN32'
          'CPU386'
          'CONDITIONALEXPRESSIONS')
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
        OnChange = edProjectNameChange
      end
    end
    object tabGenerate: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'HelpGeneratorVCL#Generate_Tab'
      Caption = 'Generate'
      object memoMessages: TMemo
        Left = 0
        Top = 137
        Width = 683
        Height = 432
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Generate_Tab'
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
      object Panel1: TPanel
        Left = 0
        Top = 569
        Width = 683
        Height = 41
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#'
        Align = alBottom
        TabOrder = 2
        object btnGenerate: TButton
          Left = 8
          Top = 8
          Width = 185
          Height = 25
          HelpType = htKeyword
          HelpKeyword = 'HelpGeneratorVCL#Generate_Tab'
          Caption = 'Generate Documentation'
          TabOrder = 0
          OnClick = btnGenerateClick
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 683
        Height = 137
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#'
        Align = alTop
        TabOrder = 0
        DesignSize = (
          683
          137)
        object Label10: TLabel
          Left = 8
          Top = 8
          Width = 642
          Height = 120
          HelpType = htKeyword
          HelpKeyword = 'HelpGeneratorVCL#'
          Anchors = [akLeft, akTop, akRight]
          Caption = 
            'When you click the "Generate Documentation" button, Help Generat' +
            'or will begin to process your input files and create documentati' +
            'on for them.  Messages describing what is happening will appear ' +
            'in the area below.  You can control how many messages appear usi' +
            'ng the "Message Level" on the Options tab. If you are generating' +
            ' web pages as the documentation, a preview of the web pages will' +
            ' appear on the "Web Page" tab when they have been created.'
          WordWrap = True
        end
      end
    end
    object tabWebPage: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'HelpGeneratorVCL#Web_Page_Tab'
      Caption = 'Web Page'
      ImageIndex = 1
      object WebBrowser1: TWebBrowser
        Left = 0
        Top = 41
        Width = 683
        Height = 524
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Web_Page_Tab'
        Align = alClient
        TabOrder = 1
        OnCommandStateChange = WebBrowser1CommandStateChange
        OnNavigateComplete2 = WebBrowser1NavigateComplete2
        ControlData = {
          4C00000079380000532B00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 683
        Height = 41
        HelpType = htKeyword
        HelpKeyword = 'HelpGeneratorVCL#Web_Page_Tab'
        Align = alTop
        TabOrder = 0
        object sbBack: TSpeedButton
          Left = 8
          Top = 8
          Width = 23
          Height = 22
          HelpType = htKeyword
          HelpKeyword = 'HelpGeneratorVCL#'
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333FF3333333333333003333333333333F77F33333333333009033
            333333333F7737F333333333009990333333333F773337FFFFFF330099999000
            00003F773333377777770099999999999990773FF33333FFFFF7330099999000
            000033773FF33777777733330099903333333333773FF7F33333333333009033
            33333333337737F3333333333333003333333333333377333333333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = sbBackClick
        end
        object sbForward: TSpeedButton
          Left = 40
          Top = 8
          Width = 23
          Height = 22
          HelpType = htKeyword
          HelpKeyword = 'HelpGeneratorVCL#Web_Page_Tab'
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333FF3333333333333003333
            3333333333773FF3333333333309003333333333337F773FF333333333099900
            33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
            99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
            33333333337F3F77333333333309003333333333337F77333333333333003333
            3333333333773333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = sbForwardClick
        end
        object lblURL: TLabel
          Left = 72
          Top = 8
          Width = 4
          Height = 20
        end
      end
    end
  end
  object PasDoc1: TPasDoc
    OnWarning = PasDoc1Warning
    OnMessage = PasDoc1Warning
    StarStyleOnly = True
    CommentMarkers.Strings = (
      '**'
      '**')
    MarkerOptional = True
    Generator = HtmlDocGenerator
    ShowVisibilities = []
    ImplicitVisibility = ivImplicit
    Left = 224
    Top = 384
  end
  object HtmlDocGenerator: THTMLDocGenerator
    AutoAbstract = False
    LinkLook = llStripped
    WriteUsesClause = True
    CSS = 
      'body { font-family: Verdana,Arial; '#13#10'  color: black; background-' +
      'color: white; '#13#10'  font-size: 12px; }'#13#10'body.navigationframe { fon' +
      't-family: Verdana,Arial; '#13#10'  color: white; background-color: #78' +
      '7878; '#13#10'  font-size: 12px; }'#13#10#13#10'img { border:0px; }'#13#10#13#10'a:link {c' +
      'olor:#C91E0C; text-decoration: none; }'#13#10'a:visited {color:#7E5C31' +
      '; text-decoration: none; }'#13#10'a:hover {text-decoration: underline;' +
      ' }'#13#10'a:active {text-decoration: underline; }'#13#10#13#10'a.navigation:link' +
      ' { color: white; text-decoration: none; font-size: 12px;}'#13#10'a.nav' +
      'igation:visited { color: white; text-decoration: none; font-size' +
      ': 12px;}'#13#10'a.navigation:hover { color: white; font-weight: bold; ' +
      #13#10'  text-decoration: none; font-size: 12px; }'#13#10'a.navigation:acti' +
      've { color: white; text-decoration: none; font-size: 12px;}'#13#10#13#10'a' +
      '.bold:link {color:#C91E0C; text-decoration: none; font-weight:bo' +
      'ld; }'#13#10'a.bold:visited {color:#7E5C31; text-decoration: none; fon' +
      't-weight:bold; }'#13#10'a.bold:hover {text-decoration: underline; font' +
      '-weight:bold; }'#13#10'a.bold:active {text-decoration: underline; font' +
      '-weight:bold; }'#13#10#13#10'a.section {color: green; text-decoration: non' +
      'e; font-weight: bold; }'#13#10'a.section:hover {color: green; text-dec' +
      'oration: underline; font-weight: bold; }'#13#10#13#10'ul.useslist a:link {' +
      'color:#C91E0C; text-decoration: none; font-weight:bold; }'#13#10'ul.us' +
      'eslist a:visited {color:#7E5C31; text-decoration: none; font-wei' +
      'ght:bold; }'#13#10'ul.useslist a:hover {text-decoration: underline; fo' +
      'nt-weight:bold; }'#13#10'ul.useslist a:active {text-decoration: underl' +
      'ine; font-weight:bold; }'#13#10#13#10'ul.hierarchy { list-style-type:none;' +
      ' }'#13#10'ul.hierarchylevel { list-style-type:none; }'#13#10#13#10'p.unitlink a:' +
      'link {color:#C91E0C; text-decoration: none; font-weight:bold; }'#13 +
      #10'p.unitlink a:visited {color:#7E5C31; text-decoration: none; fon' +
      't-weight:bold; }'#13#10'p.unitlink a:hover {text-decoration: underline' +
      '; font-weight:bold; }'#13#10'p.unitlink a:active {text-decoration: und' +
      'erline; font-weight:bold; }'#13#10#13#10'tr.list { background: #FFBF44; }'#13 +
      #10'tr.list2 { background: #FFC982; }'#13#10'tr.listheader { background: ' +
      '#C91E0C; color: white; }'#13#10#13#10'table { border-spacing:2px; padding:' +
      '4px; width:100%; }'#13#10#13#10'table.markerlegend { width:auto; }'#13#10'table.' +
      'markerlegend td.legendmarker { text-align:center; }'#13#10#13#10'table.sec' +
      'tions { background:white; }'#13#10'table.sections td {background:light' +
      'gray; }'#13#10#13#10'table.summary td.itemcode { width:100%; }'#13#10'table.deta' +
      'il td.itemcode { width:100%; }'#13#10#13#10'td { vertical-align:top; paddi' +
      'ng:4px; }'#13#10#13#10'td.itemname {white-space:nowrap; }'#13#10'td.itemunit {wh' +
      'ite-space:nowrap; }'#13#10'td.itemdesc { width:100%; }'#13#10#13#10'div.nodescri' +
      'ption {color:red;}'#13#10'dl.parameters {;}'#13#10'dl.parameters dt {color:b' +
      'lue;}'#13#10'dl.parameters dd {;}'#13#10#13#10'/* Style applied to Pascal code i' +
      'n documentation '#13#10'   (e.g. produced by @longcode tag) } */'#13#10'span' +
      '.pascal_string { color: #000080; }'#13#10'span.pascal_keyword { font-w' +
      'eight: bolder; }'#13#10'span.pascal_comment { color: #000080; font-sty' +
      'le: italic; }'#13#10'span.pascal_compiler_comment { color: #008000; }'#13 +
      #10'span.pascal_numeric { }'#13#10'span.pascal_hex { }'#13#10#13#10'p.hint_directiv' +
      'e { color: red; }'#13#10#13#10'input#search_text { }'#13#10'input#search_submit_' +
      'button { }'#13#10#13#10'acronym.mispelling { background-color: #ffa; }'#13#10
    UseTipueSearch = True
    Left = 288
    Top = 400
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      'Delphi source files *.pas|*.pas|Free Pascal source files *.pp|*.' +
      'pp|All Pascal source files *.pas, *.pp|*.pas;*.pp|All Files *.*|' +
      '*.*'
    FilterIndex = 3
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofFileMustExist, ofEnableSizing]
    Left = 144
    Top = 399
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.hgs'
    Filter = 'Help Generator Settings (*.hgs)|*.hgs'
    Left = 324
    Top = 399
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = '.hgs'
    Filter = 'Help Generator Settings (*.hgs)|*.hgs'
    Left = 252
    Top = 383
  end
  object MainMenu: TMainMenu
    Left = 180
    Top = 399
    object miFile: TMenuItem
      Caption = '&File'
      object New1: TMenuItem
        Caption = '&New'
        OnClick = New1Click
      end
      object Open1: TMenuItem
        Caption = '&Open'
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = '&Save'
        OnClick = Save1Click
      end
      object Exit1: TMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object miHelp: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
      object Help2: TMenuItem
        Caption = 'Help'
        OnClick = Help2Click
      end
    end
  end
  object TexDocGenerator: TTexDocGenerator
    AutoAbstract = False
    LinkLook = llStripped
    WriteUsesClause = True
    Latex2rtf = True
    Left = 364
    Top = 399
  end
  object HTMLHelpDocGenerator: THTMLHelpDocGenerator
    AutoAbstract = False
    LinkLook = llDefault
    CSS = 
      'body { font-family: Verdana,Arial; '#13#10'  color: black; background-' +
      'color: white; '#13#10'  font-size: 12px; }'#13#10'body.navigationframe { fon' +
      't-family: Verdana,Arial; '#13#10'  color: white; background-color: #78' +
      '7878; '#13#10'  font-size: 12px; }'#13#10#13#10'img { border:0px; }'#13#10#13#10'a:link {c' +
      'olor:#C91E0C; text-decoration: none; }'#13#10'a:visited {color:#7E5C31' +
      '; text-decoration: none; }'#13#10'a:hover {text-decoration: underline;' +
      ' }'#13#10'a:active {text-decoration: underline; }'#13#10#13#10'a.navigation:link' +
      ' { color: white; text-decoration: none; font-size: 12px;}'#13#10'a.nav' +
      'igation:visited { color: white; text-decoration: none; font-size' +
      ': 12px;}'#13#10'a.navigation:hover { color: white; font-weight: bold; ' +
      #13#10'  text-decoration: none; font-size: 12px; }'#13#10'a.navigation:acti' +
      've { color: white; text-decoration: none; font-size: 12px;}'#13#10#13#10'a' +
      '.bold:link {color:#C91E0C; text-decoration: none; font-weight:bo' +
      'ld; }'#13#10'a.bold:visited {color:#7E5C31; text-decoration: none; fon' +
      't-weight:bold; }'#13#10'a.bold:hover {text-decoration: underline; font' +
      '-weight:bold; }'#13#10'a.bold:active {text-decoration: underline; font' +
      '-weight:bold; }'#13#10#13#10'a.section {color: green; text-decoration: non' +
      'e; font-weight: bold; }'#13#10'a.section:hover {color: green; text-dec' +
      'oration: underline; font-weight: bold; }'#13#10#13#10'ul.useslist a:link {' +
      'color:#C91E0C; text-decoration: none; font-weight:bold; }'#13#10'ul.us' +
      'eslist a:visited {color:#7E5C31; text-decoration: none; font-wei' +
      'ght:bold; }'#13#10'ul.useslist a:hover {text-decoration: underline; fo' +
      'nt-weight:bold; }'#13#10'ul.useslist a:active {text-decoration: underl' +
      'ine; font-weight:bold; }'#13#10#13#10'ul.hierarchy { list-style-type:none;' +
      ' }'#13#10'ul.hierarchylevel { list-style-type:none; }'#13#10#13#10'p.unitlink a:' +
      'link {color:#C91E0C; text-decoration: none; font-weight:bold; }'#13 +
      #10'p.unitlink a:visited {color:#7E5C31; text-decoration: none; fon' +
      't-weight:bold; }'#13#10'p.unitlink a:hover {text-decoration: underline' +
      '; font-weight:bold; }'#13#10'p.unitlink a:active {text-decoration: und' +
      'erline; font-weight:bold; }'#13#10#13#10'tr.list { background: #FFBF44; }'#13 +
      #10'tr.list2 { background: #FFC982; }'#13#10'tr.listheader { background: ' +
      '#C91E0C; color: white; }'#13#10#13#10'table { border-spacing:2px; padding:' +
      '4px; width:100%; }'#13#10#13#10'table.markerlegend { width:auto; }'#13#10'table.' +
      'markerlegend td.legendmarker { text-align:center; }'#13#10#13#10'table.sec' +
      'tions { background:white; }'#13#10'table.sections td {background:light' +
      'gray; }'#13#10#13#10'table.summary td.itemcode { width:100%; }'#13#10'table.deta' +
      'il td.itemcode { width:100%; }'#13#10#13#10'td { vertical-align:top; paddi' +
      'ng:4px; }'#13#10#13#10'td.itemname {white-space:nowrap; }'#13#10'td.itemunit {wh' +
      'ite-space:nowrap; }'#13#10'td.itemdesc { width:100%; }'#13#10#13#10'div.nodescri' +
      'ption {color:red;}'#13#10'dl.parameters {;}'#13#10'dl.parameters dt {color:b' +
      'lue;}'#13#10'dl.parameters dd {;}'#13#10#13#10'/* Style applied to Pascal code i' +
      'n documentation '#13#10'   (e.g. produced by @longcode tag) } */'#13#10'span' +
      '.pascal_string { color: #000080; }'#13#10'span.pascal_keyword { font-w' +
      'eight: bolder; }'#13#10'span.pascal_comment { color: #000080; font-sty' +
      'le: italic; }'#13#10'span.pascal_compiler_comment { color: #008000; }'#13 +
      #10'span.pascal_numeric { }'#13#10'span.pascal_hex { }'#13#10#13#10'p.hint_directiv' +
      'e { color: red; }'#13#10#13#10'input#search_text { }'#13#10'input#search_submit_' +
      'button { }'#13#10#13#10'acronym.mispelling { background-color: #ffa; }'#13#10
    Left = 412
    Top = 399
  end
  object odExtraFiles: TOpenDialog
    Filter = '*.txt|*.txt|*.*|*.*'
    Left = 452
    Top = 399
  end
  object odDotLocation: TOpenDialog
    Filter = 'dot.exe|dot.exe'
    Left = 492
    Top = 399
  end
  object BrowserDialog: TOpenDialog
    Filter = 'Programs (*.exe)|*.exe'
    FilterIndex = 0
    Left = 524
    Top = 400
  end
end
