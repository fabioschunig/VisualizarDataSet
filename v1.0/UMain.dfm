object fMain: TfMain
  Left = 426
  Top = 128
  Width = 1168
  Height = 650
  Caption = 'Visualizar DataSet'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnDados: TPanel
    Left = 287
    Top = 0
    Width = 865
    Height = 587
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object gdMain: TDBGrid
      Left = 0
      Top = 0
      Width = 865
      Height = 587
      Align = alClient
      DataSource = dsMain
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = gdMainTitleClick
    end
    object mmOrder: TMemo
      Left = 102
      Top = 316
      Width = 335
      Height = 205
      Enabled = False
      TabOrder = 1
      Visible = False
    end
    object mmDescend: TMemo
      Left = 456
      Top = 316
      Width = 335
      Height = 205
      Enabled = False
      TabOrder = 2
      Visible = False
    end
  end
  object pnLado: TPanel
    Left = 0
    Top = 0
    Width = 287
    Height = 587
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    OnResize = pnLadoResize
    object pnLadoSuperior: TPanel
      Left = 1
      Top = 1
      Width = 285
      Height = 270
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 254
        Top = 13
        Width = 30
        Height = 26
        Hint = 'Abrir arquivo'
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00009B670A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A
          9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A
          0A9F6A0A9F6A0A98650AD0A634FFFFFFF6F4EFF8F8F8F7F7F7F7F7F7F7F7F7C2
          C2C0FBFBFBF5F5F5F5F5F5F4F4F4F3F3F3F1F1F1F0F0F0BFBEBDF8F8F8EDEDED
          ECECEBEBEBEAEAEAE9E8E8E8FFFFFF9F6A0AD0A634FFFFFFF8F8F8F8F8F8F7F7
          F7F7F7F7F7F7F7C2C1C0FBFBFBF6F6F6F4F4F4F4F4F3F3F3F3F2F2F2F0F0F0BF
          BEBDF8F8F8EDEDECECECEBEAEAEAE9E9E9E8E8E7FFFFFF9F6A0AD0A634FFFFFF
          C3C3C2C3C2C1C3C2C1C2C2C0C2C2C0ADACAAE7E6E6C2C1C0C2C1C0C1C0BFC1C0
          BFC1C0BFC0C0BEACABAAE5E5E5BFBEBDBEBEBCBEBDBCBDBDBBBDBCBBFFFFFF9F
          6A0AD0A634FFFFFFE8E8E8E6E6E6E6E6E6E6E6E6E6E6E5BBBBB9F5F5F5E5E5E5
          E5E5E5E5E5E5E4E4E3E4E4E3E3E3E3BAB9B8F3F3F3E0E0E0E0E0DFDFDFDFDEDE
          DEDEDEDDFFFFFF9F6A0AD0A634FFFFFFF5F5F5F5F5F5F5F5F5F5F5F5F5F5F5C1
          C1C0FBFBFBF5F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4C1C0BFFAFAFAF3F3F3
          F3F3F2F2F2F2F2F2F2F2F2F1FFFFFF9F6A0AD0A634FFFFFFBDBCBBBBBBBABBBB
          BABBBBB9BBBBB9AAAAA8E4E3E3BBBAB9BBBAB9BBBAB9BBBAB9BBBAB9BBBAB8AA
          A9A7E3E3E3BAB9B8B9B8B7B9B8B7B9B8B6B9B8B7FFFFFF9F6A0AD0A634FFFFFF
          FAFAFAFAFAFAF9F9F9F9F9F9F9F9F9C3C2C1FCFCFCF7F7F7F7F7F7F7F7F7F6F6
          F6F6F6F6F6F6F6C1C1C0FBFBFBF3F3F3F2F2F2F0F0F0EFEFEFEEEEEEFFFFFF9F
          6A0AD0A634FFFFFFFBFBFBFAFAFAFAFAFAF9F9F9F9F9F9C3C2C1FCFCFCF8F8F8
          F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6C2C1C0FBFBFBF4F4F4F3F3F3F2F2F2F1F1
          F1EFEFEFFFFFFF9F6A0AD0A634FFFFFFFBFBFBFBFBFBFAFAFAFAFAFAF9F9F9C3
          C2C1FDFDFDF8F8F8F8F8F8F7F7F7F7F7F7F7F7F7F6F6F6C2C1C0FBFBFBF5F5F5
          F4F4F4F3F3F3F2F2F2F1F1F1FFFFFF9F6A0AD0A634FFFFFFC5C4C3C4C3C2C4C3
          C2C3C3C2C3C3C2ADACABE7E7E6C3C2C1C3C2C1C3C2C1C2C2C0C2C2C0C2C2C0AD
          ACAAE7E6E6C2C1C0C1C1C0C1C0BFC1C0BFC0C0BEFFFFFF9F6A0AD0A634FFFFFF
          E9E9E9E7E7E7E7E7E7E7E7E7E7E7E6BCBBBAF5F5F5E6E6E6E6E6E6E6E6E6E7E7
          E6E7E7E6E6E6E6BBBBBAF5F5F5E5E5E5E4E4E4E4E4E3E3E3E2E3E3E3FFFFFF9F
          6A0AD0A634FFFFFFF6F6F6F6F6F6F5F5F5F5F5F5F5F5F5C1C1C0FBFBFBF5F5F5
          F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5C1C1C0FBFBFBF5F5F5F5F5F5F5F5F5F5F5
          F5F4F4F4FFFFFFA37116D0A634FFFFFFBEBDBCBDBCBABDBCBBBDBCBBBDBCBBAB
          AAA8E5E4E4BDBCBBBCBCBABCBCBABCBCBABCBCBABCBCBAABAAA8E4E4E3BCBBBA
          BCBBBABBBBBABBBBBABCBBBAFFFFFFAF8332D2A838FFFFFFFDFDFDFDFDFDFCFC
          FCFCFCFCFCFCFCC4C4C2FEFEFEFCFCFCFCFCFCFCFCFCFBFBFBFBFBFBFAFAFAC3
          C3C2FDFDFDF9F9F9F9F9F9F9F9F9F8F8F8F8F8F8FFFFFFB28739DCBB64FFFFFF
          FEFEFEFDFDFDFDFDFDFCFCFCFCFCFCC4C4C2FEFEFEFCFCFCFCFCFCFCFCFCFCFC
          FCFBFBFBFBFBFBC3C3C2FDFDFDFAFAFAF9F9F9F9F9F9F9F9F9F8F8F8FFFFFFB3
          893DE2C883FFFFFFFDFDFDFDFDFDFDFDFDFCFCFCFCFCFCC4C4C2FEFEFEFCFCFC
          FCFCFCFCFCFCFCFCFCFCFCFCFBFBFBC4C3C2FDFDFDFAFAFAFAFAFAFAFAFAFAFA
          FAF9F9F9FFFFFFB58C42E4CB89EED3ABE7C187E7C28AE8C289E5BC7FE1B26AE0
          AC5EDFAA5ADEA959DEA959DEA957DEA957DDA756DDA754DDA754DDA652DDA551
          DDA551DDA450DDA450DCA44EE6BE82B68E46E5CF90F4E2C2EFD4A1F0D5A4EED0
          9AEBC887E7C077E6BA6AE5B866E5B866E5B864E5B864E4B863E4B863E3B661E3
          B660E3B660E3B55EE3B55EE3B45DE3B35CE3B35CEBCD93B9914BE8D39AF7EAD2
          F2DDB7F1DAAFEED29DEBCA8AE8C27BE6BC6EE5BB6AE5BA69E5BA69E5B967E5B8
          66E5B866E5B864E5B864E4B863E4B863E3B661E3B661E3B660E3B55EECD19DBA
          944FEAD7A3F9F0DFF4E3C2F1DBB3EED39EECCB8EE9C47EE6BE71E6BB6DE5BB6B
          E5BB6BE5BB6AE5BB6AE5BA69E5BA69E5B967E5B866E5B866E5B864E5B864E4B8
          63E4B863EED6A7BC9754EBD9AAFBF4E8F9F1E1F8EDD9F5E8CFF4E5C7F2E0BFF1
          DEB8F1DCB6F1DCB5F1DCB5F1DCB5F1DCB5F0DBB4F0DBB4F0DAB4F0DAB4F0DAB2
          F0DAB2EFDAB2EFDAB2EFDAB1EFDAB1BE9957EDDCAFEBDAABEAD8A5E9D59EE7D2
          97E5CE8EE3CB88E3C982E2C77FE2C77FE2C67EE2C67EE2C67EE1C67DE1C67DE0
          C57CE0C57CE0C57BE0C57BE0C579E0C579E0C378E0C378DFC377}
        OnClick = SpeedButton1Click
      end
      object lbDiretorio: TLabel
        Left = 8
        Top = 2
        Width = 42
        Height = 13
        Caption = 'Diretório:'
      end
      object lbFiltroArquivos: TLabel
        Left = 8
        Top = 40
        Width = 83
        Height = 13
        Caption = 'Filtro de arquivos:'
      end
      object edDiretorio: TEdit
        Left = 5
        Top = 16
        Width = 247
        Height = 21
        TabOrder = 0
        OnKeyUp = edDiretorioKeyUp
      end
      object clbArquivos: TCheckListBox
        Left = 5
        Top = 78
        Width = 275
        Height = 185
        Anchors = [akLeft, akTop, akBottom]
        ItemHeight = 13
        TabOrder = 1
        OnDblClick = clbArquivosDblClick
      end
      object edFiltroArq: TEdit
        Left = 5
        Top = 54
        Width = 275
        Height = 21
        TabOrder = 2
        OnKeyUp = edFiltroArqKeyUp
      end
    end
    object pnLadoInferior: TPanel
      Left = 1
      Top = 272
      Width = 285
      Height = 315
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object lbFiltroClientDataSet: TLabel
        Left = 8
        Top = 2
        Width = 103
        Height = 13
        Caption = 'Filter do clientdataset:'
      end
      object bAplicarFiltro: TSpeedButton
        Left = 258
        Top = 30
        Width = 23
        Height = 51
        Hint = 'Aplicar filter no ClientDataSet'
        Caption = '>'
        OnClick = bAplicarFiltroClick
      end
      object lbFiltroColunas: TLabel
        Left = 8
        Top = 102
        Width = 80
        Height = 13
        Caption = 'Filtro de colunas:'
      end
      object mmFilter: TMemo
        Left = 5
        Top = 16
        Width = 250
        Height = 79
        TabOrder = 0
      end
      object clbColunas: TCheckListBox
        Left = 5
        Top = 140
        Width = 275
        Height = 175
        OnClickCheck = clbColunasClickCheck
        Anchors = [akLeft, akTop, akBottom]
        ItemHeight = 13
        TabOrder = 1
      end
      object edFiltroColunas: TEdit
        Left = 5
        Top = 116
        Width = 216
        Height = 21
        TabOrder = 2
        OnKeyUp = edFiltroColunasKeyUp
      end
      object chkTudo: TCheckBox
        Left = 226
        Top = 118
        Width = 54
        Height = 17
        Hint = 'Marcar / desmarcar todas abaixo'
        Caption = 'Todas'
        TabOrder = 3
        OnClick = chkTudoClick
      end
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 587
    Width = 1152
    Height = 24
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object sbInfo: TStatusBar
      Left = 0
      Top = -1
      Width = 1152
      Height = 25
      Panels = <
        item
          Width = 100
        end
        item
          Width = 150
        end
        item
          Width = 100
        end
        item
          Width = 150
        end
        item
          Width = 0
        end>
      SimplePanel = False
    end
  end
  object cdsMain: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsMainIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 382
    Top = 56
  end
  object dsMain: TDataSource
    DataSet = cdsMain
    Left = 416
    Top = 56
  end
  object dlgAbrirArquivo: TOpenDialog
    InitialDir = '%systemdrive%'
    Left = 190
    Top = 6
  end
end
