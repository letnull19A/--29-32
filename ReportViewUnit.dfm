object Form8: TForm8
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1086#1088' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074
  ClientHeight = 375
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 336
    Align = alClient
    TabOrder = 0
    object DBText1: TDBText
      Left = 96
      Top = 72
      Width = 145
      Height = 17
      DataField = 'Discipline'
      DataSource = Form6.DataSource1
    end
    object DBText2: TDBText
      Left = 96
      Top = 112
      Width = 65
      Height = 17
      DataField = 'Fathername'
      DataSource = Form6.DataSource1
    end
    object DBText3: TDBText
      Left = 96
      Top = 152
      Width = 65
      Height = 17
      DataField = 'Name'
      DataSource = Form6.DataSource1
    end
    object DBText4: TDBText
      Left = 96
      Top = 192
      Width = 65
      Height = 25
      DataField = 'Surname'
      DataSource = Form6.DataSource1
    end
    object DBText5: TDBText
      Left = 96
      Top = 240
      Width = 65
      Height = 17
      DataField = 'TaskID'
      DataSource = Form6.DataSource1
    end
    object DBText6: TDBText
      Left = 96
      Top = 280
      Width = 65
      Height = 17
      DataField = 'Mark'
      DataSource = Form6.DataSource1
    end
    object DBImage1: TDBImage
      Left = 328
      Top = 72
      Width = 241
      Height = 233
      DataSource = Form6.DataSource1
      Proportional = True
      Stretch = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 336
    Width = 594
    Height = 39
    Align = alBottom
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 592
      Height = 37
      DataSource = Form6.DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alClient
      TabOrder = 0
    end
  end
end
