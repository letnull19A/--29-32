unit StudentsEditUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Data.Win.ADODB, Vcl.Menus, Global, Vcl.Mask, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList;

type
  TForm12 = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBComboBox1: TDBComboBox;
    Cjhfybnm1: TMenuItem;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    StatusBar1: TStatusBar;
    DBImage1: TDBImage;
    procedure ADODataSet1AfterScroll(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure Cjhfybnm1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

uses StudentsUnit, MainUnit;

procedure ShowImage(image: string);
begin

  if (Length(image) = 0) then
    image := 'notfound.jpg';

  try
    Form12.DBImage1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + IMAGES_PATH + '\' + image);
  except
    ShowMessage('������ � �������� �����������!');
  end;
end;

procedure TForm12.ADODataSet1AfterScroll(DataSet: TDataSet);
begin
  ShowImage(ADODataSet1.FieldValues['Avatar']);
end;

procedure TForm12.Cjhfybnm1Click(Sender: TObject);
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
  Form2.Show();
end;

procedure TForm12.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  StatusBar1.Panels[0].Text := '������: ' + IntToStr(ADODataSet1.RecNo);
end;

procedure TForm12.FormCreate(Sender: TObject);
begin
  ADODataSet1.Active := false;
  ADODataSet1.Active := true;
end;

procedure TForm12.Image1Click(Sender: TObject);
var
  nFileName: string;
begin
  OpenDialog1.FileName := '*.jpg';

  if OpenDialog1.Execute then
  begin

    nFileName := ExtractFileName(OpenDialog1.FileName);

    CopyFile(PChar(OpenDialog1.FileName), PChar(IMAGES_PATH + '\' + nFileName), false);
    ShowImage(nFileName);
    ADODataSet1.FieldValues['Avatar'] := nFileName;
  end;
end;

procedure TForm12.N1Click(Sender: TObject);
begin
  Hide();
  Form2.Show();
end;

end.
