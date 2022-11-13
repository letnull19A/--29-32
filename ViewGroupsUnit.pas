unit ViewGroupsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxExportPDF, frxClass,
  frxExportBaseDialog, frxExportRTF, frxDBSet, frxPreview;

type
  TForm13 = class(TForm)
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxPreview1: TfrxPreview;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses GroupsUnit;

{$R *.dfm}

procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form5.Show();
end;

end.
