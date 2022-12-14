unit DisciplinesUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Data.Win.ADODB, Vcl.Menus, Vcl.Buttons,
  Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, ComObj, Global;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    N13: TMenuItem;
    Word1: TMenuItem;
    Excel1: TMenuItem;
    FastReport1: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    PDF1: TMenuItem;
    RTF1: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure N11Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Word1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure PDF1Click(Sender: TObject);
    procedure RTF1Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

Uses MainUnit, DisciplinesEditUnit, DiscipinesAddRecordUnit, ViewDisciplinesUnit;

procedure TForm4.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  buttonSelected: Integer;
begin
  if (Key = #13) then
  begin
    buttonSelected := MessageDlg('?????? ????????? ??????????', mtCustom,
      [mbYes, mbCancel], 0);

    if (buttonSelected = mrYes) then
    begin
      ADODataSet1.Post();
    end;

    DBGrid1.ReadOnly := true;
    DBGrid1.Options := [TDBGridOption.dgTitles,
      TDBGridOption.dgTabs, TDBGridOption.dgTitleClick,
      TDBGridOption.dgRowLines, TDBGridOption.dgColLines, TDBGridOption.dgRowSelect];

  end;
end;

procedure TForm4.DBGrid1TitleClick(Column: TColumn);
begin
  ADODataSet1.Open;
  if ADODataSet1.Sort = Column.FieldName + ' ASC' then
    ADODataSet1.Sort := Column.FieldName + ' DESC'
  else
    ADODataSet1.Sort := Column.FieldName + ' ASC';
end;

procedure TForm4.Excel1Click(Sender: TObject);
var
  Sheet, Column, Row: Variant;
  XLApp: OleVariant;
  index, i, j: integer;
begin

  XLApp := CreateOleObject('Excel.Application');

  XLApp.Visible := true;
  XLApp.Workbooks.Add(-4167);
  XLApp.Workbooks[1].WorkSheets[1].Name := '????? ??????';

  // Column := XLApp.Workbooks[1].WorkSheets.Item[1].Columns;
  // =>
  // Column := XLApp.Workbooks[1].Sheets.Item[1].Columns;

  Column := XLApp.Workbooks[1].Sheets.Item[1].Columns;

  Column.Columns[1].ColumnWidth := 20;
  Column.Columns[2].ColumnWidth := 20;

  Row := XLApp.Workbooks[1].Sheets.Item[1].Rows;

  Row.Rows[2].Font.Bold := true;
  Row.Rows[1].Font.Bold := true;
  Row.Rows[1].Font.Color := clBlue;
  Row.Rows[1].Font.Size := 14;

  Sheet := XLApp.Workbooks[1].Sheets.Item[1];

  Sheet.Cells[1, 2] := '?????';
  Sheet.Cells[2, 1] := '???';
  Sheet.Cells[2, 2] := '????????????';

  index := 3;
  ADODataSet1.First;

  for i := 1 to ADODataSet1.RecordCount do
  begin
    for j := 1 to DBGrid1.Columns.Count do
      Sheet.Cells[index, j] := DBGrid1.Fields[j - 1].AsString;
    Inc(index);
    ADODataSet1.Next;
  end;

end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  ADODataSet1.Active := false;
  ADODataSet1.Active := true;
end;

procedure TForm4.N10Click(Sender: TObject);
begin
  ADODataSet1.Append();
  DBGrid1.ReadOnly := false;
  DBGrid1.Options := [TDBGridOption.dgEditing, TDBGridOption.dgTitles,
    TDBGridOption.dgTabs, TDBGridOption.dgTitleClick, TDBGridOption.dgRowLines,
    TDBGridOption.dgColLines];
end;

procedure TForm4.N11Click(Sender: TObject);
begin
  Form7.Show();
  Form4.Hide();
end;

procedure TForm4.N12Click(Sender: TObject);
var
  buttonSelected: Integer;
begin

  buttonSelected := MessageDlg('?????? ????????? ??????????', mtCustom,
      [mbYes, mbCancel], 0);

    if (buttonSelected = mrYes) then
    begin
      DBGrid1.DataSource.DataSet.Delete();
    end;
end;

procedure TForm4.N14Click(Sender: TObject);
begin
  Form15.Show();
  Hide();
  Form15.frxReport1.ShowReport();
end;

procedure TForm4.N16Click(Sender: TObject);
begin
  Form15.frxReport1.Print();
end;

procedure TForm4.N2Click(Sender: TObject);
begin
  Form1.Show();
  Form4.Close();
end;

procedure TForm4.N31Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := 'Id > 3';
  ADODataSet1.Filtered := true;
end;

procedure TForm4.N41Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := 'Id < 3';
  ADODataSet1.Filtered := true;
end;

procedure TForm4.N42Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := '';
  ADODataSet1.Filtered := true;
end;

procedure TForm4.N5Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Disciplines ORDER BY Id DESC';
  ADODataSet1.Open();
end;

procedure TForm4.N6Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Disciplines ORDER BY Id';
  ADODataSet1.Open();
end;

procedure TForm4.N7Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Disciplines ORDER BY Name DESC';
  ADODataSet1.Open();
end;

procedure TForm4.N8Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Disciplines ORDER BY Name';
  ADODataSet1.Open();
end;

procedure TForm4.PDF1Click(Sender: TObject);
begin
  Form15.frxReport1.Export(Form15.frxPDFExport1);
end;

procedure TForm4.RTF1Click(Sender: TObject);
begin
  Form15.frxReport1.Export(Form15.frxRTFExport1);
end;

procedure TForm4.Word1Click(Sender: TObject);
var
  doc, varcol: Variant;
  WordApp: OleVariant;
begin

  try
    WordApp := CreateOleObject('Word.Application');
    doc := WordApp.documents.Open(WORD_TEMPLATE_DISCIPLINES_REPORT_PATH);
    WordApp.ActiveDocument.SaveAs(WORD_REPORT_PATH + 'report_disciplines.docx');

    for var i := 2 to ADODataSet1.RecordCount + 1 do
    begin
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 1).Range.Text :=
        ADODataSet1.FieldByName('Id').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 2).Range.Text :=
        ADODataSet1.FieldByName('Name').AsString;

      ADODataSet1.Next();
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
