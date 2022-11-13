unit GroupsEditUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Menus, Data.DB, Data.Win.ADODB, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList;

type
  TForm9 = class(TForm)
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    DBNavigator1: TDBNavigator;
    DBEdit2: TDBEdit;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

uses GroupsUnit, MainUnit;

procedure TForm9.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  ShowMessage(IntToStr(StatusBar1.Panels.Count));
  StatusBar1.Panels[0].Text := '������: ' + IntToStr(ADODataSet1.RecNo);
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  ADODataSet1.Active := false;
  ADODataSet1.Active := true;
end;

procedure TForm9.N1Click(Sender: TObject);
begin
  Form5.Show();
  Hide();
end;

procedure TForm9.N2Click(Sender: TObject);
var
  buttonSelected: Integer;
begin

  buttonSelected := MessageDlg('������ ��������� ���������?', mtCustom,
    [mbYes, mbCancel], 0);

  if (buttonSelected = mrYes) then
  begin
    ADODataSet1.Post();
  end;

  Hide();
  Form5.Show();
end;

end.
