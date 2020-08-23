object Form1: TForm1
  Left = 463
  Top = 161
  Width = 1305
  Height = 675
  Caption = 'Image Capturer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 552
    Top = 8
    Width = 729
    Height = 617
    Proportional = True
    Stretch = True
  end
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 377
    Height = 417
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object ImagePath: TLabeledEdit
    Left = 16
    Top = 600
    Width = 465
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Images path'
    LabelPosition = lpAbove
    LabelSpacing = 3
    ReadOnly = True
    TabOrder = 1
  end
  object CheckBoxSetAutoCapture: TCheckBox
    Left = 16
    Top = 464
    Width = 113
    Height = 17
    Caption = 'Set AutoCapture'
    TabOrder = 2
    OnClick = CheckBoxSetAutoCaptureClick
  end
  object FileNameEdit: TLabeledEdit
    Left = 16
    Top = 560
    Width = 465
    Height = 21
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = 'File Name'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 3
  end
  object ButtonBrowseImgPath: TButton
    Left = 480
    Top = 600
    Width = 57
    Height = 25
    Caption = 'Browse...'
    TabOrder = 4
    OnClick = ButtonBrowseImgPathClick
  end
end
