function SetupVlfeat
% set up vlfeat for SIFT

VLFEATROOT = '../vlfeat-0.9.21';
run(strcat(VLFEATROOT, '/toolbox/vl_setup'))
%% check that VLFeat is sucessfully installed
% vl_version verbose

end