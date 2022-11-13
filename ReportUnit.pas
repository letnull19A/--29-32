unit ReportUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Menus, Vcl.Buttons, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, ComObj, Global;

type
  TForm6 = class(TForm)
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    DataSource1: TDataSource;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N2: TMenuItem;
    Cjhnbhjdrf1: TMenuItem;
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N6: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    N7: TMenuItem;
    N8: TMenuItem;
    Word1: TMenuItem;
    Excel1: TMenuItem;
    FastReport1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    PDF1: TMenuItem;
    RTF1: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Word1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure PDF1Click(Sender: TObject);
    procedure RTF1Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  isSorted : boolean;

implementation

{$R *.dfm}

Uses MainUnit, ViewReportUnit;

procedure TForm6.BitBtn1Click(Sender: TObject);
begin
  Edit1.Text := '';

  Form6.ADOQuery1.Active := false;
  Form6.ADOQuery1.SQL.Clear();
  Form6.ADOQuery1.SQL.Add('SELECT Tasks.Id AS TaskID, Users.Name AS Name, Users.Surname AS Surname, ');
  Form6.ADOQuery1.SQL.Add('Users.Fathername AS Fathername, Disciplines.Name AS Discipline, Tasks.Mark AS Mark ');
  Form6.ADOQuery1.SQL.Add('FROM Disciplines INNER JOIN (Users INNER JOIN Tasks ON Users.Id = Tasks.StudentId) ');
  Form6.ADOQuery1.SQL.Add('ON Disciplines.Id = Tasks.DisciplineId');
  Form6.ADOQuery1.Active := true;
end;

procedure TForm6.Button1Click(Sender: TObject);
var
  query: string;
begin

  Form6.ADOQuery1.Active := false;
  Form6.ADOQuery1.SQL.Clear();
  Form6.ADOQuery1.SQL.Add('SELECT Tasks.Id AS TaskID, Users.Name AS Name, Users.Surname AS Surname, ');
  Form6.ADOQuery1.SQL.Add('Users.Fathername AS Fathername, Disciplines.Name AS Discipline, Tasks.Mark AS Mark ');
  Form6.ADOQuery1.SQL.Add('FROM Disciplines INNER JOIN (Users INNER JOIN Tasks ON Users.Id = Tasks.StudentId) ');
  Form6.ADOQuery1.SQL.Add('ON Disciplines.Id = Tasks.DisciplineId');

  if (Length(Edit1.Text) > 0) then
    query := ' WHERE (Users.Surname Like ''%' + Edit1.Text + '%'')'
  else
  begin
    ShowMessage('�������� �������� ������!');
    query := '';
  end;

  Form6.ADOQuery1.SQL.Add(query);
  Form6.ADOQuery1.Active := true;
end;

procedure TForm6.DBGrid1TitleClick(Column: TColumn);
var
  sortQuery : string;
begin

  ADOQuery1.Open;
  if  ADOQuery1.Sort = Column.FieldName + ' ASC' then
    ADOQuery1.Sort:= Column.FieldName + ' DESC'
  else
    ADOQuery1.Sort:= Column.FieldName + ' ASC';
end;

procedure TForm6.Excel1Click(Sender: TObject);
var
  Sheet, Column, Row: Variant;
  XLApp: OleVariant;
  index, i, j: integer;
begin

  XLApp := CreateOleObject('Excel.Application');

  XLApp.Visible := true;
  XLApp.Workbooks.Add(-4167);
  XLApp.Workbooks[1].WorkSheets[1].Name := '����� �����';

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

  Sheet.Cells[1, 2] := '�����';
  Sheet.Cells[2, 1] := '��� �������';
  Sheet.Cells[2, 2] := '�������';
  Sheet.Cells[2, 3] := '���';
  Sheet.Cells[2, 4] := '�����';
  Sheet.Cells[2, 5] := '����������';
  Sheet.Cells[2, 6] := '������';

  index := 3;
  ADOQuery1.First;

  for i := 1 to ADOQuery1.RecordCount do
  begin
    for j := 1 to DBGrid1.Columns.Count do
      Sheet.Cells[index, j] := DBGrid1.Fields[j - 1].AsString;
    Inc(index);
    ADOQuery1.Next;
  end;

end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  ADOQuery1.Active := false;
  ADOQuery1.Active := true;
end;

procedure TForm6.N10Click(Sender: TObject);
begin
  Form6.ADOQuery1.Filtered := false;
  Form6.ADOQuery1.Filter := '';
  Form6.ADOQuery1.Filtered := true;
end;

procedure TForm6.N11Click(Sender: TObject);
begin
  Hide();
  Form16.Show();
  Form16.frxReport1.ShowReport();
end;

procedure TForm6.N13Click(Sender: TObject);
begin
  Form16.frxReport1.Print();
end;

procedure TForm6.N2Click(Sender: TObject);
begin
  Form6.ADOQuery1.Filtered := false;
  Form6.ADOQuery1.Filter := 'Mark > 3';
  Form6.ADOQuery1.Filtered := true;
end;

procedure TForm6.N4Click(Sender: TObject);
begin
  Form6.Close();
  Form1.Show();
end;

procedure TForm6.N5Click(Sender: TObject);
begin
  Form6.ADOQuery1.Active := false;
  Form6.ADOQuery1.SQL.Clear();
  Form6.ADOQuery1.SQL.Add('SELECT Tasks.Id AS TaskID, Users.Name AS Name, Users.Surname AS Surname, ');
  Form6.ADOQuery1.SQL.Add('Users.Fathername AS Fathername, Disciplines.Name AS Discipline, Tasks.Mark AS Mark ');
  Form6.ADOQuery1.SQL.Add('FROM Disciplines INNER JOIN (Users INNER JOIN Tasks ON Users.Id = Tasks.StudentId) ');
  Form6.ADOQuery1.SQL.Add('ON Disciplines.Id = Tasks.DisciplineId ORDER BY Tasks.Id DESC');
  Form6.ADOQuery1.Active := true;
end;

procedure TForm6.N6Click(Sender: TObject);
begin
  Form6.ADOQuery1.Active := false;
  Form6.ADOQuery1.SQL.Clear();
  Form6.ADOQuery1.SQL.Add('SELECT Tasks.Id AS TaskID, Users.Name AS Name, Users.Surname AS Surname, ');
  Form6.ADOQuery1.SQL.Add('Users.Fathername AS Fathername, Disciplines.Name AS Discipline, Tasks.Mark AS Mark ');
  Form6.ADOQuery1.SQL.Add('FROM Disciplines INNER JOIN (Users INNER JOIN Tasks ON Users.Id = Tasks.StudentId) ');
  Form6.ADOQuery1.SQL.Add('ON Disciplines.Id = Tasks.DisciplineId ORDER BY Tasks.Mark DESC');
  Form6.ADOQuery1.Active := true;
end;

procedure TForm6.N9Click(Sender: TObject);
begin
  Form6.ADOQuery1.Filtered := false;
  Form6.ADOQuery1.Filter := 'Mark < 4';
  Form6.ADOQuery1.Filtered := true;
end;

procedure TForm6.PDF1Click(Sender: TObject);
begin
  Form16.frxReport1.Export(Form16.frxPDFExport1);
end;

procedure TForm6.RTF1Click(Sender: TObject);
begin
  Form16.frxReport1.Export(Form16.frxRTFExport1);
end;

procedure TForm6.Word1Click(Sender: TObject);
var
  doc, varcol: Variant;
  WordApp: OleVariant;
begin

  try
    WordApp := CreateOleObject('Word.Application');
    doc := WordApp.documents.Open(WORD_TEMPLATE_REPORTS_REPORT_PATH);
    WordApp.ActiveDocument.SaveAs(WORD_REPORT_PATH + 'report_reports.docx');

    for var i := 2 to ADOQuery1.RecordCount + 1 do
    begin
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 1).Range.Text :=
        ADOQuery1.FieldByName('TaskId').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 2).Range.Text :=
        ADOQuery1.FieldByName('Surname').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 3).Range.Text :=
        ADOQuery1.FieldByName('Name').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 4).Range.Text :=
        ADOQuery1.FieldByName('Fathername').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 5).Range.Text :=
        ADOQuery1.FieldByName('Discipline').AsString;
      WordApp.ActiveDocument.Tables.Item(1).Cell(i, 6).Range.Text :=
        ADOQuery1.FieldByName('Mark').AsString;
      ADOQuery1.Next();
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
