object Form7: TForm7
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1080#1089#1094#1080#1087#1083#1080#1085
  ClientHeight = 355
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 594
    Height = 270
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 37
      Top = 48
      Width = 108
      Height = 14
      Alignment = taRightJustify
      Caption = #1050#1086#1076' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 50
      Top = 95
      Width = 95
      Height = 28
      Alignment = taRightJustify
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object DBText1: TDBText
      Left = 160
      Top = 49
      Width = 225
      Height = 17
      DataField = 'Id'
      DataSource = DataSource1
    end
    object DBEdit2: TDBEdit
      Left = 160
      Top = 93
      Width = 137
      Height = 21
      DataField = 'Name'
      DataSource = DataSource1
      TabOrder = 0
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 311
    Width = 594
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Align = alBottom
    TabOrder = 1
    OnClick = DBNavigator1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 336
    Width = 594
    Height = 19
    Panels = <
      item
        Text = #1047#1072#1087#1080#1089#1100
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 41
    Align = alTop
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    Images = Form1.ImageList1
    Left = 8
    Top = 328
    object N1: TMenuItem
      Caption = #1053#1072#1079#1072#1076
      ImageIndex = 9
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 12
      OnClick = N2Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 72
    Top = 328
  end
  object ADODataSet1: TADODataSet
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    CommandText = 'SELECT * FROM Disciplines'
    CommandTimeout = 0
    Parameters = <>
    Left = 40
    Top = 328
  end
end
