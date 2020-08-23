object FormImagePath: TFormImagePath
  Left = 881
  Top = 242
  BorderIcons = [biMaximize]
  BorderStyle = bsDialog
  Caption = 'Image path'
  ClientHeight = 428
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DirectoryListBox1: TDirectoryListBox
    Left = 16
    Top = 40
    Width = 657
    Height = 305
    ItemHeight = 16
    TabOrder = 0
    OnChange = DirectoryListBox1Change
  end
  object DriveComboBox1: TDriveComboBox
    Left = 16
    Top = 16
    Width = 657
    Height = 19
    DirList = DirectoryListBox1
    TabOrder = 1
  end
  object ButtonCancel: TButton
    Left = 600
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
  object ButtonOk: TButton
    Left = 504
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 3
    OnClick = ButtonOkClick
  end
  object EditDirectoryPath: TEdit
    Left = 16
    Top = 352
    Width = 657
    Height = 21
    TabOrder = 4
    Text = 'EditDirectoryPath'
    OnKeyUp = EditDirectoryPathKeyUp
  end
end
