object Form10: TForm10
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1075#1088#1091#1087#1087
  ClientHeight = 355
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 326
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 592
      Height = 324
      Align = alClient
      DataSource = DataSource1
      DrawingStyle = gdsGradient
      GradientEndColor = clLime
      GradientStartColor = 12050221
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Name'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 509
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 326
    Width = 594
    Height = 29
    Align = alBottom
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 592
      Height = 27
      DataSource = DataSource1
      VisibleButtons = [nbInsert, nbEdit, nbPost, nbCancel]
      Align = alClient
      TabOrder = 0
    end
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    CommandText = 'SELECT * FROM Groups'
    CommandTimeout = 0
    Parameters = <>
    Left = 8
    Top = 328
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 40
    Top = 328
  end
  object MainMenu1: TMainMenu
    Left = 72
    Top = 327
    object N1: TMenuItem
      Caption = #1053#1072#1079#1072#1076
      OnClick = N1Click
    end
  end
end
