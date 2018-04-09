{**************************************************************
**  Author and Coder : A.Mo'minjon  @DelphiGuru/@MrDelphiGuru *
**                                                            *
**      GitHub : DelphiUz                                     *
**                                                            *
**                      mr.delphiguru@gmail.com               *
**                                                            *
**          https://delphi.uz                                 *
**                                                            *
**    Please, help me to promote my web-site!!!               *
***************************************************************}

unit Delphi.Uz.CrypticCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    Edt: TEdit;
    BtnGenerator: TButton;
    PanelTop: TPanel;
    ShapeClose: TShape;
    ShapeMaximized: TShape;
    ShapeMinimized: TShape;
    EdtCrypticCode: TEdit;
    PanelBottom: TPanel;
    LblAuthor: TLabel;
    LblTop: TLabel;
    ImgWebSite: TImage;
    ImgFacebook: TImage;
    LblThink: TLabel;
    procedure ShapeCloseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ShapeMaximizedMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ShapeMinimizedMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LblAuthorMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LblAuthorMouseLeave(Sender: TObject);
    procedure LblAuthorClick(Sender: TObject);
    procedure BtnGeneratorClick(Sender: TObject);
    procedure ImgWebSiteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

Uses
  ShellAPI;

procedure TMainForm.BtnGeneratorClick(Sender: TObject);
Var
  A: Array ['a'..'z'] of 'a'..'z';
  I: Integer;
  C: Char;
  S: String;
begin
  if Edt.Text = '' then
    Exit;

  For C := 'a' to 'z' do
  begin
    I := Ord(C) + 5;  // Get the ASCII code and add 5 (five)
    if I > 122 then I := I-122+96;  // In ASCII 'a' equals to 96 and 'z' equals to 122.
    // if the last letter prints, calculation runs from beginning of the alphabet and shows E result
    A[C] := Chr(I);  // Kodga mod qiymatni olish. A[C] da F harfidan boshlangan antiqa akfavit xosil bo'ladi.
    // WriteLn(C, '', A[C]); -->  For Checking results
  end;

  S := Edt.Text;

  For I := 1 to Length(S) do
  begin
    C := S[I];     // I-Symbol Assign to C variable
    S[I] := A[C];  // A[C] Assign to S[I]
  end;

  EdtCrypticCode.Text := S;

  LblThink.Visible := True;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TMainForm.ImgWebSiteClick(Sender: TObject);
begin
  ShellExecute(Handle, 'OPEN', 'https://www.facebook.com/wwwdelphiuz/', Nil, Nil, SW_SHOWMAXIMIZED);
end;

procedure TMainForm.LblAuthorClick(Sender: TObject);
begin
  ShellExecute(Handle, 'OPEN', 'https://delphi.uz', Nil, Nil, SW_SHOWMAXIMIZED);
end;

procedure TMainForm.LblAuthorMouseLeave(Sender: TObject);
begin
  LblAuthor.Color := clBlack;
end;

procedure TMainForm.LblAuthorMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  LblAuthor.Color := clRed;
end;

procedure TMainForm.ShapeCloseMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Close;
end;

procedure TMainForm.ShapeMaximizedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Application.MainForm.WindowState := wsMaximized;
end;

procedure TMainForm.ShapeMinimizedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Application.MainForm.WindowState := wsMinimized;
end;
end.
