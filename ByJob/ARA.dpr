program ARA;

uses
  Vcl.Forms,
  AraMain in 'AraMain.pas' {uAraMain},
  Profile in 'Profile.pas' {uProfile},
  Bound in 'Bound.pas' {uBound},
  Zoom in 'Zoom.pas' {uZoom},
  ImExport in 'ImExport.pas' {uImExport},
  Sponsor in 'Sponsor.pas' {uSponsor},
  About in 'About.pas' {uAbout};

{$R *.res}

begin
  System.ReportMemoryLeaksOnShutdown:= True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TuAraMain, uAraMain);
  Application.CreateForm(TuBound, uBound);
  Application.CreateForm(TuZoom, uZoom);
  Application.CreateForm(TuImExport, uImExport);
  Application.CreateForm(TuSponsor, uSponsor);
  Application.CreateForm(TuAbout, uAbout);
  Application.Run;
end.
