unit ViewStudentsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet,
  frxPreview, frxExportBaseDialog, frxExportRTF, frxExportPDF;

type
  TForm10 = class(TForm)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPreview1: TfrxPreview;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses StudentsUnit;

{$R *.dfm}

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form2.Show();
end;

end.
