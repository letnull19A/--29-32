object Form11: TForm11
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1076#1072#1085#1080#1103
  ClientHeight = 345
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Content: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 316
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -1
    ExplicitTop = -5
    object Label2: TLabel
      Left = 24
      Top = 113
      Width = 71
      Height = 14
      Caption = #1057#1083#1086#1078#1085#1086#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 44
      Width = 87
      Height = 14
      Caption = #1050#1086#1076' '#1089#1090#1091#1076#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 145
      Width = 47
      Height = 14
      Caption = #1054#1094#1077#1085#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Image1: TImage
      Left = 344
      Top = 42
      Width = 209
      Height = 213
    end
    object Label1: TLabel
      Left = 24
      Top = 77
      Width = 87
      Height = 14
      Caption = #1050#1086#1076' '#1089#1090#1091#1076#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 125
      Top = 78
      Width = 116
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1086#1090#1095#1077#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object DBComboBox1: TDBComboBox
      Left = 125
      Top = 42
      Width = 180
      Height = 21
      DataField = 'Id'
      DataSource = DataSource2
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 125
      Top = 111
      Width = 180
      Height = 21
      TabOrder = 1
      Text = #1051#1077#1075#1082#1086
      Items.Strings = (
        #1056#1072#1079#1084#1080#1085#1082#1072
        #1051#1077#1075#1082#1086
        #1053#1086#1088#1084#1072#1083#1100#1085#1086
        #1057#1088#1077#1076#1085#1077
        #1057#1083#1086#1078#1085#1086
        #1052#1077#1075#1072' '#1089#1083#1086#1078#1085#1086
        #1057#1091#1087#1077#1088' '#1076#1091#1087#1077#1088' '#1089#1083#1086#1078#1085#1086
        #1053#1077#1074#1086#1079#1084#1086#1078#1085#1086
        #1057#1091#1087#1077#1088' '#1076#1091#1087#1077#1088' '#1075#1080#1087#1077#1088' '#1085#1077#1074#1086#1079#1084#1086#1078#1085#1086
        #1063#1077#1083' '#1093#1086#1088#1086#1096
        #1041#1086#1075)
    end
    object ComboBox2: TComboBox
      Left = 125
      Top = 143
      Width = 180
      Height = 21
      ItemIndex = 5
      TabOrder = 2
      Text = '5'
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5')
    end
  end
  object Footer: TPanel
    Left = 0
    Top = 316
    Width = 584
    Height = 29
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 336
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 582
      Height = 27
      VisibleButtons = [nbPrior, nbNext, nbPost, nbCancelUpdates]
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 216
      ExplicitTop = 0
      ExplicitWidth = 240
      ExplicitHeight = 25
    end
  end
  object ADOConnection2: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=D:\De' +
      'sktop\Desktop\'#1042#1086#1083#1082#1086#1074'_331_'#1075#1088#1091#1087#1087#1072'_'#1055#1047'_272\_global\db\education.mdb;' +
      'Mode=Share Deny None;Persist Security Info=False;Jet OLEDB:Syste' +
      'm database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Pass' +
      'word="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=' +
      '1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Tran' +
      'sactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create S' +
      'ystem Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:' +
      'Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Without Rep' +
      'lica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 8
    Top = 320
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection2
    CursorType = ctStatic
    CommandText = 'SELECT * FROM Tasks'
    Parameters = <>
    Left = 40
    Top = 320
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 72
    Top = 320
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 317
    object N1: TMenuItem
      Caption = #1053#1072#1079#1072#1076
    end
  end
  object ADODataSet2: TADODataSet
    Active = True
    Connection = ADOConnection2
    CursorType = ctStatic
    CommandText = 'SELECT * FROM Users'
    Parameters = <>
    Left = 136
    Top = 320
  end
  object DataSource2: TDataSource
    DataSet = ADODataSet2
    Left = 168
    Top = 316
  end
end
