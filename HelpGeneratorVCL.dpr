{
This file is made available by the
U.S. Geological Survey (USGS) to be used in the public interest and the
advancement of science.  You may, without any fee or cost, use, copy,
modify, or distribute this file, and any derivative works thereof,
and its supporting documentation, subject to the following restrictions
and understandings.

If you distribute copies or modifications of this file and related
material, make sure the recipients receive a copy of this notice and receive
or can get a copy of the original distribution.  If the software and (or)
related material are modified and distributed, it must be made clear that the
recipients do not have the original and are informed of the extent of the
modifications.  For example, modified files must include a prominent notice
stating the modifications, author, and date.  This restriction is necessary to
guard against problems introduced in the software by others, reflecting
negatively on the reputation of the USGS.

This file is public property.

You may charge fees for distribution, warranties, and services provided in
connection with this file or derivative works thereof.  The name USGS can
be used in any advertising or publicity to endorse or promote any products or
commercial entity using this software if specific written permission is
obtained from the USGS.

The user agrees to appropriately acknowledge the authors and the USGS in
publications that result from the use of this file or in products that
include this file in whole or in part.

Because the software and related material is free (other than nominal
materials and handling fees) and provided "as is", the authors, USGS, or the
United States Government have made no warranty, expressed or implied, as to
the accuracy or completeness and are not obligated to provide the user with
any support, consulting, training or assistance of any kind with regard to the
use, operation, and performance of this software nor to provide the user with
any updates, revisions, new versions or "bug fixes".

The user assumes all risk for any damages whatsoever resulting from loss of
use, data, or profits arising in connection with the access, use, quality, or
performance of this software.
}
program HelpGeneratorVCL;

uses
  FastMM4 in 'FastMM4.pas',
  Forms,
  frmHelpGeneratorVCL_Unit in 'frmHelpGeneratorVCL_Unit.pas' {frmHelpGenerator},
  frmAboutVCL_Unit in 'frmAboutVCL_Unit.pas' {frmAbout},
  CustomProjectOptions in 'CustomProjectOptions.pas',
  RbwInternetUtilities in 'RbwInternetUtilities.pas',
  RbwHelpViewer in 'RbwHelpViewer.pas',
  ConsolProjectOptionsUnit in 'ConsolProjectOptionsUnit.pas';

{$R *.res}

begin
//  MemChk;
  Application.Initialize;
  Application.CreateForm(TfrmHelpGenerator, frmHelpGenerator);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
