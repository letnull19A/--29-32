unit ViewTasksUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, frxExportRTF,
  frxExportBaseDialog, frxExportPDF, frxPreview;

type
  TForm14 = class(TForm)
    frxPreview1: TfrxPreview;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

uses TasksUnit;

{$R *.dfm}

procedure TForm14.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form3.Show();
end;

end.
