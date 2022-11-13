unit StudentsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.Buttons, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, ComObj;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N21: TMenuItem;
    N10: TMenuItem;
    N41: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    N16: TMenuItem;
    Word1: TMenuItem;
    rcgjhnd1: TMenuItem;
    FastReport1: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    RTF1: TMenuItem;
    PDF1: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure N13Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure N15Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure Word1Click(Sender: TObject);
    procedure rcgjhnd1Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure RTF1Click(Sender: TObject);
    procedure PDF1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses MainUnit, StudentsEditUnit, Global, ViewStudentsUnit;

{$REGION 'Funcitons'}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  Edit1.Text := '';
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := '';
  ADODataSet1.Filtered := true;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := 'Surname LIKE ''%' + Edit1.Text + '%''';
  ADODataSet1.Filtered := true;
end;

procedure TForm2.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  var
    buttonSelected: Integer;
  begin
    if (Key = #13) then
    begin
      buttonSelected := MessageDlg('������ ��������� ���������?', mtCustom,
        [mbYes, mbCancel], 0);

      if (buttonSelected = mrYes) then
      begin
        ADODataSet1.Post();
      end;

      DBGrid1.ReadOnly := true;
      DBGrid1.Options := [TDBGridOption.dgTitles, TDBGridOption.dgTabs,
        TDBGridOption.dgTitleClick, TDBGridOption.dgRowLines,
        TDBGridOption.dgColLines, TDBGridOption.dgRowSelect];

    end;
  end;
end;

procedure TForm2.N13Click(Sender: TObject);
begin
  ADODataSet1.Append();
  DBGrid1.ReadOnly := false;
  DBGrid1.Options := [TDBGridOption.dgEditing, TDBGridOption.dgTitles,
    TDBGridOption.dgTabs, TDBGridOption.dgTitleClick, TDBGridOption.dgRowLines,
    TDBGridOption.dgColLines];
end;

procedure TForm2.N14Click(Sender: TObject);
begin
  Hide();
  Form12.Show();
end;

procedure TForm2.N15Click(Sender: TObject);
var
  buttonSelected: Integer;
begin

  buttonSelected := MessageDlg('������ ��������� ���������?', mtCustom,
    [mbYes, mbCancel], 0);

  if (buttonSelected = mrYes) then
  begin
    DBGrid1.DataSource.DataSet.Delete();
  end;
end;

procedure TForm2.N17Click(Sender: TObject);
begin
  Form10.Show();
  Form10.frxReport1.ShowReport();
  Hide();
end;

procedure TForm2.N19Click(Sender: TObject);
begin
  Form10.frxPreview1.Print();
end;

{$ENDREGION}
{$REGION 'Sort'}

procedure TForm2.N2Click(Sender: TObject);
begin
  Form2.Close();
  Form1.Show();
end;

procedure TForm2.N41Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := 'GroupId = 4';
  ADODataSet1.Filtered := true;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Users ORDER BY Surname ASC';
  ADODataSet1.Open();
end;

procedure TForm2.N6Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Users ORDER BY Surname DESC';
  ADODataSet1.Open();
end;

procedure TForm2.N7Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Users ORDER BY Name ASC';
  ADODataSet1.Open();
end;

procedure TForm2.N8Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Users ORDER BY Name DESC';
  ADODataSet1.Open();
end;

procedure TForm2.N9Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := 'GroupId = 1';
  ADODataSet1.Filtered := true;
end;

procedure TForm2.PDF1Click(Sender: TObject);
begin
  Form10.frxReport1.Export(Form10.frxPDFExport1);
end;

procedure TForm2.rcgjhnd1Click(Sender: TObject);
var
  Sheet, Column, Row: Variant;
  XLApp: OleVariant;
  index, i, j: integer;
begin

  XLApp := CreateOleObject('Excel.Application');

  XLApp.Visible := true;
  XLApp.Workbooks.Add(-4167);
  XLApp.Workbooks[1].WorkSheets[1].Name := '����� ��������';

  // Column := XLApp.Workbooks[1].WorkSheets.Item[1].Columns;
  // =>
  // Column := XLApp.Workbooks[1].Sheets.Item[1].Columns;

  Column := XLApp.Workbooks[1].Sheets.Item[1].Columns;

  Column.Columns[1].ColumnWidth := 20;
  Column.Columns[2].ColumnWidth := 20;
  Column.Columns[3].ColumnWidth := 20;
  Column.Columns[4].ColumnWidth := 20;
  Column.Columns[5].ColumnWidth := 20;
  Column.Columns[6].ColumnWidth := 20;

  Row := XLApp.Workbooks[1].Sheets.Item[1].Rows;

  Row.Rows[2].Font.Bold := true;
  Row.Rows[1].Font.Bold := true;
  Row.Rows[1].Font.Color := clBlue;
  Row.Rows[1].Font.Size := 14;

  Sheet := XLApp.Workbooks[1].Sheets.Item[1];

  Sheet.Cells[1, 2] := '�����';
  Sheet.Cells[2, 1] := '���';
  Sheet.Cells[2, 2] := '���';
  Sheet.Cells[2, 3] := '�������';
  Sheet.Cells[2, 4] := '��������';
  Sheet.Cells[2, 5] := '��� ������';

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

procedure TForm2.RTF1Click(Sender: TObject);
begin
  Form10.frxReport1.Export(Form10.frxRTFExport1);
end;

procedure TForm2.Word1Click(Sender: TObject);
var
  doc, varcol: Variant;
  WordApp: OleVariant;
begin

  try
    WordApp := CreateOleObject('Word.Application');
    doc := WordApp.documents.Open(WORD_TEMPLATE_STUDENTS_REPORT_PATH);
    WordApp.ActiveDocument.SaveAs(WORD_REPORT_PATH + 'report_students.docx');

    for var i := 2 to ADODataSet1.RecordCount + 1 do
    begin
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 1).Range.Text :=
        ADODataSet1.FieldByName('Id').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 2).Range.Text :=
        ADODataSet1.FieldByName('GroupId').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 3).Range.Text :=
        ADODataSet1.FieldByName('Name').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 4).Range.Text :=
        ADODataSet1.FieldByName('Surname').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 5).Range.Text :=
        ADODataSet1.FieldByName('Fathername').AsString;

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

procedure TForm2.DBGrid1TitleClick(Column: TColumn);
begin
  ADODataSet1.Open;
  if ADODataSet1.Sort = Column.FieldName + ' ASC' then
    ADODataSet1.Sort := Column.FieldName + ' DESC'
  else
    ADODataSet1.Sort := Column.FieldName + ' ASC';
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ADODataSet1.Active := false;
  ADODataSet1.Active := true;
end;

procedure TForm2.N10Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := 'GroupId = 3';
  ADODataSet1.Filtered := true;
end;

procedure TForm2.N11Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := '';
  ADODataSet1.Filtered := true;
end;

procedure TForm2.N21Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := 'GroupId = 2';
  ADODataSet1.Filtered := true;
end;

{$ENDREGION}

end.
