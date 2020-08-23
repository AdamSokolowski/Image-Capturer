program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UnitBrowsePath in 'UnitBrowsePath.pas' {FormImagePath};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Screen Capturer';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormImagePath, FormImagePath);
  Application.Run;
end.
