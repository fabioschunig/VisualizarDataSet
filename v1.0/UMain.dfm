object fMain: TfMain
  Left = 266
  Top = 124
  Width = 1305
  Height = 675
  Caption = 'fMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gdMain: TDBGrid
    Left = 0
    Top = 0
    Width = 1289
    Height = 636
    Align = alClient
    DataSource = dsMain
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object cdsMain: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 64
  end
  object dsMain: TDataSource
    DataSet = cdsMain
    Left = 98
    Top = 64
  end
end
