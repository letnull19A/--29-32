unit GroupsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Data.Win.ADODB, Vcl.Menus, Vcl.Buttons,
  Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, ComObj, Global;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N4: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    N14: TMenuItem;
    Word1: TMenuItem;
    Excel1: TMenuItem;
    FastReport1: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    PDF1: TMenuItem;
    PDF2: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Word1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure PDF1Click(Sender: TObject);
    procedure PDF2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N17Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

Uses MainUnit, GroupsEditUnit, ViewGroupsUnit;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin

  Edit1.Text := '';

  ADODataSet1.Close;
  ADODataSet1.CommandText := 'SELECT * FROM Groups';
  ADODataSet1.Open;
end;

procedure TForm5.Button1Click(Sender: TObject);
var
  query: string;
begin

  if (Length(Edit1.Text) > 0) then
    query := 'SELECT * FROM Groups WHERE (Name Like ''%' + Edit1.Text + '%'')'
  else
  begin
    ShowMessage('???????? ???????? ??????!');
    query := 'SELECT * FROM Groups';
  end;

  ADODataSet1.Close;
  ADODataSet1.CommandText := query;
  ADODataSet1.Open;
end;

procedure TForm5.DBGrid1KeyPress(Sender: TObject; var Key: Char);
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

procedure TForm5.DBGrid1TitleClick(Column: TColumn);
begin
  ADODataSet1.Open;
  if ADODataSet1.Sort = Column.FieldName + ' ASC' then
    ADODataSet1.Sort := Column.FieldName + ' DESC'
  else
    ADODataSet1.Sort := Column.FieldName + ' ASC';
end;

procedure TForm5.Excel1Click(Sender: TObject);
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

procedure TForm5.FormCreate(Sender: TObject);
begin
  ADODataSet1.Active := false;
  ADODataSet1.Active := true;
end;

procedure TForm5.N11Click(Sender: TObject);
begin
  ADODataSet1.Append();
  DBGrid1.ReadOnly := false;
  DBGrid1.Options := [TDBGridOption.dgEditing, TDBGridOption.dgTitles,
    TDBGridOption.dgTabs, TDBGridOption.dgTitleClick, TDBGridOption.dgRowLines,
    TDBGridOption.dgColLines];
end;

procedure TForm5.N12Click(Sender: TObject);
begin
  Form9.Show();
  Hide();
end;

procedure TForm5.N13Click(Sender: TObject);
begin
  DBGrid1.DataSource.DataSet.Delete();
end;

procedure TForm5.N15Click(Sender: TObject);
begin
  Form13.Show();
  Hide();
  Form13.frxReport1.ShowReport();
end;

procedure TForm5.N17Click(Sender: TObject);
begin
  Form13.frxReport1.Print();
end;

procedure TForm5.N2Click(Sender: TObject);
begin
  Form1.Show();
  Form5.Close();
end;

procedure TForm5.N31Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := 'Id > 3';
  ADODataSet1.Filtered := true;
end;

procedure TForm5.N41Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := 'Id < 4';
  ADODataSet1.Filtered := true;
end;

procedure TForm5.N5Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Groups ORDER BY Id DESC';
  ADODataSet1.Open();
end;

procedure TForm5.N6Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Groups ORDER BY Id';
  ADODataSet1.Open();
end;

procedure TForm5.N7Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Groups ORDER BY Name DESC';
  ADODataSet1.Open();
end;

procedure TForm5.N8Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Groups ORDER BY Name';
  ADODataSet1.Open();
end;

procedure TForm5.N9Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := '';
  ADODataSet1.Filtered := true;
end;

procedure TForm5.PDF1Click(Sender: TObject);
begin
  Form13.frxReport1.Export(Form13.frxPDFExport1);
end;

procedure TForm5.PDF2Click(Sender: TObject);
begin
  Form13.frxReport1.Export(Form13.frxRTFExport1);
end;

procedure TForm5.Word1Click(Sender: TObject);
var
  doc, varcol: Variant;
  WordApp: OleVariant;
begin

  try
    WordApp := CreateOleObject('Word.Application');
    doc := WordApp.documents.Open(WORD_TEMPLATE_GROUPS_REPORT_PATH);
    WordApp.ActiveDocument.SaveAs(WORD_REPORT_PATH + 'report_groups.docx');

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
