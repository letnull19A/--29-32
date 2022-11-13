unit Reporter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Data.Win.ADODB, Vcl.Menus, Vcl.Buttons,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, ComObj, Global;

procedure ExportExcel(grid: TDBGrid; dataSet: TADODataSet);
procedure ExportWord(grid: TDBGrid; dataSet: TADODataSet);

implementation

procedure ExportExcel(grid: TDBGrid; dataSet: TADODataSet);
var
  doc, varcol: Variant;
  WordApp: OleVariant;
begin

end;

procedure ExportWord(grid: TDBGrid; dataSet: TADODataSet);
var
  doc, varcol: Variant;
  WordApp: OleVariant;
begin
  try
    WordApp := CreateOleObject('Word.Application');
    doc := WordApp.documents.Open(WORD_TEMPLATE_REPORT_PATH);
    WordApp.ActiveDocument.SaveAs(WORD_REPORT_PATH);

    for var i := 2 to dataSet.RecordCount + 1 do
    begin
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 1).Range.Text :=
        dataSet.FieldByName('Name').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 2).Range.Text :=
        dataSet.FieldByName('Phone').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 3).Range.Text :=
        dataSet.FieldByName('E-mail').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 4).Range.Text :=
        dataSet.FieldByName('Picture').AsString;

      dataSet.Next();
    end;

  finally
    WordApp.Visible := true;
    WordApp.Selection.GoTo(-1, unAssigned, unAssigned, 'FIO');
    WordApp.Selection.TypeText('Wolkow Alexej');
    WordApp.Selection.GoTo(-1, unAssigned, unAssigned, 'Date');
    WordApp.Selection.TypeText(FormatDateTime('dddddd', Date));
    WordApp := unAssigned;
  end;
end;

end.
