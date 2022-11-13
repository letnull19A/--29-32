unit TasksUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, ComObj, Global;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N051: TMenuItem;
    N031: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
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
    RTF1: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N051Click(Sender: TObject);
    procedure N031Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure N11Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure N13Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure Word1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N17Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses MainUnit, TasksEditUnit, ViewTasksUnit;

{$REGION 'Functions'}

procedure TForm3.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  buttonSelected: Integer;
begin
  if (Key = #13) then
  begin
    buttonSelected := MessageDlg('Хотите сохранить изменения?', mtCustom,
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

procedure TForm3.N11Click(Sender: TObject);
begin
  ADODataSet1.Append();
  DBGrid1.ReadOnly := false;
  DBGrid1.Options := [TDBGridOption.dgEditing, TDBGridOption.dgTitles,
    TDBGridOption.dgTabs, TDBGridOption.dgTitleClick, TDBGridOption.dgRowLines,
    TDBGridOption.dgColLines];
end;

procedure TForm3.N13Click(Sender: TObject);
var
  buttonSelected: Integer;
begin

  buttonSelected := MessageDlg('Хотите сохранить изменения?', mtCustom,
      [mbYes, mbCancel], 0);

    if (buttonSelected = mrYes) then
    begin
      DBGrid1.DataSource.DataSet.Delete();
    end;
end;

procedure TForm3.N15Click(Sender: TObject);
begin
  Form14.Show();
  Form14.frxReport1.ShowReport();
  Hide();
end;

procedure TForm3.N17Click(Sender: TObject);
begin
  Form14.frxReport1.Print();
end;

{$ENDREGION}

{$REGION 'Sort'}

procedure TForm3.DBGrid1TitleClick(Column: TColumn);
begin
  ADODataSet1.Open;
  if ADODataSet1.Sort = Column.FieldName + ' ASC' then
    ADODataSet1.Sort := Column.FieldName + ' DESC'
  else
    ADODataSet1.Sort := Column.FieldName + ' ASC';
end;

procedure TForm3.Excel1Click(Sender: TObject);
var
  Sheet, Column, Row: Variant;
  XLApp: OleVariant;
  index, i, j: integer;
begin

  XLApp := CreateOleObject('Excel.Application');

  XLApp.Visible := true;
  XLApp.Workbooks.Add(-4167);
  XLApp.Workbooks[1].WorkSheets[1].Name := 'Отчёт Задачи';

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

  Sheet.Cells[1, 2] := 'Отчёт';
  Sheet.Cells[2, 1] := 'Код';
  Sheet.Cells[2, 2] := 'Студент код';
  Sheet.Cells[2, 3] := 'Сложность';
  Sheet.Cells[2, 4] := 'Оценка';
  Sheet.Cells[2, 5] := 'Вложение';

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

procedure TForm3.FormCreate(Sender: TObject);
begin
  ADODataSet1.Active := false;
  ADODataSet1.Active := true;
end;

procedure TForm3.N031Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := 'Mark < 5';
  ADODataSet1.Filtered := true;
end;

procedure TForm3.N051Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := 'Mark > 2';
  ADODataSet1.Filtered := true;
end;

procedure TForm3.N12Click(Sender: TObject);
begin
  Form11.Show();
  Hide();
end;

procedure TForm3.N2Click(Sender: TObject);
begin
  Form1.Show();
  Form3.Close();
end;

procedure TForm3.N5Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Tasks ORDER BY StudentId DESC;';
  ADODataSet1.Open();
end;

procedure TForm3.N6Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Tasks ORDER BY StudentId ASC;';
  ADODataSet1.Open();
end;

procedure TForm3.N7Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Tasks ORDER BY Id DESC;';
  ADODataSet1.Open();
end;

procedure TForm3.N8Click(Sender: TObject);
begin
  ADODataSet1.Close();
  ADODataSet1.CommandText := 'SELECT * FROM Tasks ORDER BY Id ASC;';
  ADODataSet1.Open();
end;

procedure TForm3.N9Click(Sender: TObject);
begin
  ADODataSet1.Filtered := false;
  ADODataSet1.Filter := '';
  ADODataSet1.Filtered := true;
end;

procedure TForm3.Word1Click(Sender: TObject);
var
  doc, varcol: Variant;
  WordApp: OleVariant;
begin

  try
    WordApp := CreateOleObject('Word.Application');
    doc := WordApp.documents.Open(WORD_TEMPLATE_TASKS_REPORT_PATH);
    WordApp.ActiveDocument.SaveAs(WORD_REPORT_PATH + 'report_tasks.docx');

    for var i := 2 to ADODataSet1.RecordCount + 1 do
    begin
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 1).Range.Text :=
        ADODataSet1.FieldByName('Id').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 2).Range.Text :=
        ADODataSet1.FieldByName('StudentId').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 3).Range.Text :=
        ADODataSet1.FieldByName('DisciplineId').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 4).Range.Text :=
        ADODataSet1.FieldByName('Difficulty').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 5).Range.Text :=
        ADODataSet1.FieldByName('Mark').AsString;
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

{$ENDREGION}

end.
