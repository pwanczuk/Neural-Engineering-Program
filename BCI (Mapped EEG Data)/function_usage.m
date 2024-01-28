
%%%%%%%%%%%%%%%%%%%%%%%%%%
% How to use load_data()
%%%%%%%%%%%%%%%%%%%%%%%%%%
[data,states,params] = load_data;
% A GUI should in which you can select files. 
% In the GUI that pops up go to folder \S001 and select all .dat files.


% If you are running your code over and over again, the GUI can be annoying
% after a while.
% The following can be hard-coded:

datadir{1} = './S001/';
datadir{2} = './S002/';
        
dir_no = 1;
files = dir([datadir{dir_no} '*.dat']);
for k = 1:length(files)
    files(k).name = [datadir{dir_no} files(k).name];
end;
[data,states,params] = load_bcidat(files.name);

fs = 160; %This given in the project description. 
t = [1:size(data,1)]/fs;

figure;
plot(t,states.TargetCode,'b'); % The target appears at the beginnning of a trial. TargetCode let's us know where the target is. 
hold on;
plot(t,states.Feedback,'r'); % The Subject is able to control the cursor when states.Feedback is 1.
plot(t,states.ResultCode,'g'); % The target that was hit is in states.ResultCode

%%%%%%%%%%%%%%%%%%%%%%%%%%
% How to use topoplotEEG()
%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
topoplotEEG([1:64],'eloc64.txt');
colorbar;colormap("jet");
% Look at elocs.png
% Does the coloring scheme make sense to you?
% You can change the color span with caxis([min max])

% The first variable has to be a vector of length 64, or you will get an
% error:
topoplotEEG([1:128],'eloc64.txt');

topoplotEEG(ones(64),'eloc64.txt');

% You will get an error for not having the called file:
topoplotEEG([1:128],'NewPhoneWhoDis?.txt');

% Here is another example:
x = zeros(64,1);
y = zeros(64,1);
x(1:2:64) = 10;
y(2:2:64) = 10;
figure; 
topoplotEEG(x,'eloc64.txt');
colorbar;colormap("jet"); caxis([0 10]);
figure; 
topoplotEEG(y,'eloc64.txt');
colorbar;colormap("jet"); caxis([0 10]);

%%%%%%%%%%%%%%%%%%%%%%%%%%
% How to use calc_rsqu()
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Let's create two distributions, x1 & x2, that has 64 channels, 80 frequency bins, and
% 18 trials
x1 = randn(64,80,18);
x2 = randn(64,80,18);
% Let us add a mean of 25 for frequency range [8:12] for x1
% and a mean of -14 for x2

x1([8 9 15 16],8:12,1:18)= randn(4,5,18)+25;
x2([8 9 15 16],8:12,1:18)= randn(4,5,18)-14;
R2 =calc_rsqu(x1,x2);

figure;
surf([1:64],[1:80],R2');view(2); axis tight;colorbar 
%%
% To convert this into a topoplot, let us average R2 over the speactral
% range 8:12
R2_m = mean(R2(:,8:12),2);
figure;
topoplotEEG(R2_m,'eloc64.txt');
colorbar;colormap("jet");

