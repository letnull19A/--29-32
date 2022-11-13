unit ViewDisciplinesUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, frxExportRTF,
  frxExportBaseDialog, frxExportPDF, frxPreview, DisciplinesUnit;

type
  TForm15 = class(TForm)
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxReport1: TfrxReport;
    frxPreview1: TfrxPreview;
    frxDBDataset1: TfrxDBDataset;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form4.Show();
end;

end.
