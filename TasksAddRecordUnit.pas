unit TasksAddRecordUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Data.DB,
  Data.Win.ADODB, Vcl.DBCtrls, Vcl.StdCtrls;

type
  TForm11 = class(TForm)
    Content: TPanel;
    Footer: TPanel;
    ADOConnection2: TADOConnection;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    DBComboBox1: TDBComboBox;
    ADODataSet2: TADODataSet;
    DataSource2: TDataSource;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

end.
