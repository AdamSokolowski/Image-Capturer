unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Clipbrd, jpeg, UnitBrowsePath;

type
  TForm1 = class(TForm)
    Image1: TImage;
    ListBox1: TListBox;
    ImagePath: TLabeledEdit;
    CheckBoxSetAutoCapture: TCheckBox;
    FileNameEdit: TLabeledEdit;
    ButtonBrowseImgPath: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckBoxSetAutoCaptureClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ButtonBrowseImgPathClick(Sender: TObject);


  private
    { Private declarations }
    procedure WMDrawClipboard(var Msg: TMessage); message WM_DRAWCLIPBOARD;
    procedure WMChangeCBChain(var Msg: TMessage); message WM_CHANGECBCHAIN;
    function GenerateNextFileName():String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation



{$R *.dfm}

var
Nextinchain:THandle;

procedure TForm1.FormCreate(Sender: TObject);
begin
Nextinchain:= SetClipboardViewer(Handle);
end;

function TForm1.GenerateNextFileName():String;
var
nameStaticPrefix:String;
begin
  nameStaticPrefix:= ImagePath.Text+FileNameEdit.Text;
  while fileExists(nameStaticPrefix+inttostr(FileNameEdit.Tag)) do
    FileNameEdit.Tag:= FileNameEdit.Tag+1;
  result:= nameStaticPrefix+inttostr(Filenameedit.Tag)+'.bmp';
end;

procedure TForm1.WMDrawClipboard(var Msg:TMessage);
var
newFilename:String;
begin
if CheckBoxSetAutoCapture.Checked then
  if Clipboard.HasFormat(CF_BITMAP) then
   begin
   Image1.Picture.LoadFromClipboardFormat(CF_BITMAP,Clipboard.GetAsHandle(CF_BITMAP),0);
   newFilename:= GenerateNextFileName();
   Image1.Picture.SaveToFile(newFilename);
   Listbox1.Items.Add(newFilename);
   FileNameEdit.Tag:= FileNameEdit.Tag+1;
   end;
  //pass the message on to the next window
  if NextInChain <> 0 then
    SendMessage(NextInChain, WM_DrawClipboard, 0, 0);
 end;

procedure TForm1.WMChangeCBChain(var Msg:TMessage);
var
Remove, Next: THandle;
begin
Remove := Msg.WParam;
Next := Msg.LParam;
with Msg do
  if NextInChain = Remove then
    NextInChain := Next
  else if NextInChain <> 0 then
    SendMessage(NextInChain, WM_ChangeCBChain, Remove, Next)
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
ChangeClipboardChain(Handle, NextInChain) ;
end;

procedure TForm1.CheckBoxSetAutoCaptureClick(Sender: TObject);
begin
if CheckBoxSetAutoCapture.Checked then
  begin
  if not(copy(imagePath.Text,length(imagePath.Text),1) = '\') then
    imagePath.Text:= imagePath.Text+'\';
  FileNameEdit.Tag:=1;
  while fileexists(Imagepath.Text+FileNameEdit.Text+inttostr(FileNameEdit.Tag)+'.bmp') do
    FileNameEdit.Tag:=FileNameEdit.Tag+1;
  FileNameEdit.Enabled:=false;
  ImagePath.Enabled:=false;
  end
else
  begin
  FileNameEdit.Enabled:=true;
  ImagePath.Enabled:=true;
  end;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
Image1.Picture.LoadFromFile(Listbox1.Items.Strings[Listbox1.itemindex]);
end;

procedure TForm1.ButtonBrowseImgPathClick(Sender: TObject);
begin
if directoryExists(ImagePath.Text) then
  FormImagepath.DirectoryListBox1.Directory:=ImagePath.Text;
FormImagepath.Visible:=true;
Form1.Enabled:=false;
end;

end.
