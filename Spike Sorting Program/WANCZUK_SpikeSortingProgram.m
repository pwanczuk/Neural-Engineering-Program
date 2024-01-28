

% Q1
Ft=1/Fs*1000;
t=[];
for i=0:31
    t=[t i*Ft];
end
figure;
plot(t,X,'k-');
xlabel('Time (ms)');
ylabel('Amplitude (uV)');
% %Q2 
% figure;
% shadedErrorBar(t, X,{@mean,@std},'lineprops','-b');
% xlabel("Time (ms)");
% ylabel('Amplitude (uV)');
% % %Q3
% [E, A, L]=pca(X);
% Me=mean(X,1);
% % figure;
% % subplot(3,1,1);
% % plot(t, E(:,1));
% % ylabel("PC1");
% % 
% % subplot(3,1,2);
% % plot(t,E(:,2));
% % ylabel("PC2");
% % 
% % subplot(3,1,3);
% % plot(t,E(:,3));
% % ylabel("PC3");
% % xlabel("Time(ms)");
% %Q4
% figure;
% plot(A(:,1),A(:,2), 'k.');
% xlabel('PC1');
% ylabel('PC2');
% zlabel('PC3');
% figure;
% plot(A(2,1),A(2,2), 'k.');
% xlabel('PC1');
% ylabel('PC2');
% zlabel('PC3');
% %Q5
% tes=[];
% for i=1:32
%     ze=Me(i)+90.8404*E(i,1)+(-45.7776)*E(i,2);
%     tes=[tes ze];
% end
% figure;
% subplot(2,1,1);
% plot(t, X(2,:));
% title('Original Data Sample')
% ylabel("Amplitude (uV)");
% subplot(2,1,2);
% plot(t,tes);
% title('Reconstructed Data Sample')
% ylabel('Amplitude (uV)');
% xlabel("Time (ms)");
% %Q6
% figure;
% class= kmeans(X,3, "Start", "sample");
% scatter(A(:,1),A(:,2),10, class, "filled");
% xlabel("PC1");
% ylabel("PC2");
% zlabel("PC3");
% %Q7
% g1=[];
% g2=[];
% g3=[];
% g4=[];
% for i=1:41568
%     if class(i)==1
%         g1=[g1 ;X(i,:)];
%     elseif class(i)==2
%         g2=[g2 ;X(i,:)];
%     elseif class(i)==3
%         g3=[g3 ;X(i,:)];
% %     else
% %         g4=[g4 ;X(i,:)];
%     end
% end
% figure;
% subplot(1,3,1);
%     shadedErrorBar(t, g1,{@mean,@std},'lineprops','-b');
%     xlabel('time (ms)')
%     ylabel('Amplitude (uV)');
%     title(size(g1,1));
% subplot(1,3,2);
%     shadedErrorBar(t,g2,{@mean,@std},'lineprops','-g');
%     xlabel('time (ms)')
%     title(size(g2,1));
% subplot(1,3,3);
%     shadedErrorBar(t,g3,{@mean,@std},'lineprops','-y');
%     xlabel('time (ms)');
%     title(size(g3,1));
%Q9
