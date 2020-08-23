unit UnitBrowsePath;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl;

type
  TFormImagePath = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    ButtonCancel: TButton;
    ButtonOk: TButton;
    EditDirectoryPath: TEdit;
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure EditDirectoryPathKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormImagePath: TFormImagePath;

implementation

{$R *.dfm}

uses Unit1;

var
  initialDir:String;

procedure TFormImagePath.FormActivate(Sender: TObject);
begin
  initialDir:=DirectoryListbox1.Directory;
  EditDirectoryPath.Text:=DirectoryListbox1.Directory;
end;

procedure TFormImagePath.ButtonOkClick(Sender: TObject);
begin
Form1.ImagePath.Text:= DirectoryListBox1.Directory;
FormImagePath.Visible:=false;
Form1.Enabled:=true;
end;

procedure TFormImagePath.ButtonCancelClick(Sender: TObject);
begin
DirectoryListbox1.Directory:= initialDir;
FormImagePath.Visible:=false;
Form1.Enabled:=true;
end;

procedure TFormImagePath.DirectoryListBox1Change(Sender: TObject);
begin
EditDirectoryPath.Text := DirectoryListbox1.Directory;
end;

procedure TFormImagePath.EditDirectoryPathKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_RETURN then
  if directoryExists(EditDirectoryPath.Text) then
     DirectoryListbox1.Directory:= EditDirectoryPath.Text;
end;

end.
