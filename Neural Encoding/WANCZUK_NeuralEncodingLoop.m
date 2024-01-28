load('Project2.mat');
%
neuron1=neuron(1).times;
neuron2=neuron(2).times;
%gets times
 for k=1:2
     if k==1
         neuron=neuron1;
     else
         neuron=neuron2;
     end
graph=[6 3 2 1 4 7 8 9];
for i=1:8
    indDir=find(direction==i); %which trials deal with movement num
    trials=length(indDir); %number of trials for that movement
    subplot(3,3,graph(i)); hold on;
for j=1:trials
   spikeTimes=[neuron(find(neuron>go(indDir(j))-1 & neuron<go(indDir(j))+1))-go(indDir(j))]';
   n=length(spikeTimes);
%finds times 1 sec before and after fire
plot([spikeTimes; spikeTimes], [ones(1,n)*j-1; ones(1,n)*j], 'k-');
end
end
bin=0.02;
win=1;
half=[];
edgesPeri=-win:bin:win;
positions=[0 45 90 135 180 225 270 315];

figure;
peth=zeros(length(edgesPeri),8);
graph=[6 3 2 1 4 7 8 9];
for i=1:8
    indDir=find(direction==i);
    trial=length(indDir);
    subplot(3,3,graph(i)); hold on;
    for j=1:trial
        spikeTimes=[neuron(find(neuron>go(indDir(j))-1 & neuron<go(indDir(j))+1))-go(indDir(j))]';
        peth(:,i)= peth(:, i) +[histc(spikeTimes,edgesPeri,2)]'/trial/bin;
    end
    half=[ half sum(peth(51:length(edgesPeri),i))/trial];
    subplot(3,3,graph(i));
    bar(edgesPeri,peth(:, i));
end
figure;
scatter(positions,half,'k*');
xlabel('Orientation [degrees]');
ylabel('Firing Rate [Hz]');
hold on;
fit=polyfit(positions,half,2);
x2=linspace(min(positions),max(positions),315);
plot(polyval(fit,x2));
 end


