unit ViewReportUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxPreview, frxDBSet,
  frxExportRTF, frxExportBaseDialog, frxExportPDF;

type
  TForm16 = class(TForm)
    frxPreview1: TfrxPreview;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses ReportUnit;

{$R *.dfm}

procedure TForm16.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form6.Show();
end;

end.
