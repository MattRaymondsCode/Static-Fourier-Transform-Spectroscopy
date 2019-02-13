function Histogram_R_Macro_Save(X1, Y1, S1, C1,sampDEV,absoMAX,averages,N,filename)
%CREATEFIGURE(X1, Y1, S1, C1)
%  X1:  scatter x
%  Y1:  scatter y
%  S1:  scatter s
%  C1:  scatter c

%  Auto-generated by MATLAB on 25-Jun-2015 09:10:45


%To Change the colormap, use the command prompt to save the surrent axes:

%ax=gca;
%variable=colormap(ax);

%then copy & paste the matrix into the spot below.

% Create figure
figure1 = figure('InvertHardcopy','off',...
    'Visible','off',...
    'Colormap',[   0                   0                   0
                   0   0.800000011920929   0.800000011920929
   0.002558095147833   0.791618108749390   0.796236813068390
   0.005116190295666   0.783236205577850   0.792473673820496
   0.007674285676330   0.774854302406311   0.788710474967957
   0.010232380591333   0.766472399234772   0.784947335720062
   0.012790475971997   0.758090496063232   0.781184136867523
   0.015348571352661   0.749708592891693   0.777420938014984
   0.017906667664647   0.741326689720154   0.773657798767090
   0.020464761182666   0.732944726943970   0.769894599914551
   0.023022856563330   0.724562823772430   0.766131460666656
   0.025580951943994   0.716180920600891   0.762368261814117
   0.028139047324657   0.707799017429352   0.758605062961578
   0.030697142705321   0.699417114257813   0.754841923713684
   0.033255238085985   0.691035211086273   0.751078724861145
   0.035813335329294   0.682653307914734   0.747315585613251
   0.038371428847313   0.674271404743195   0.743552386760712
   0.116331748664379   0.679031729698181   0.703810334205627
   0.194292068481445   0.683792054653168   0.664068281650543
   0.272252380847931   0.688552379608154   0.624326169490814
   0.350212693214417   0.693312704563141   0.584584116935730
   0.428173035383224   0.698073029518127   0.544842064380646
   0.506133317947388   0.702833294868469   0.505100011825562
   0.584093630313873   0.707593619823456   0.465357929468155
   0.662054002285004   0.712353944778442   0.425615876913071
   0.740014314651489   0.717114269733429   0.385873794555664
   0.817974627017975   0.721874594688416   0.346131742000580
   0.895934939384460   0.726634919643402   0.306389659643173
   0.973895251750946   0.731395244598389   0.266647607088089
   0.973468840122223   0.737166106700897   0.261441260576248
   0.973042428493500   0.742936968803406   0.256234914064407
   0.972616016864777   0.748707771301270   0.251028567552567
   0.972189605236053   0.754478633403778   0.245822206139565
   0.971763193607330   0.760249495506287   0.240615859627724
   0.971336781978607   0.766020357608795   0.235409513115883
   0.970910370349884   0.771791219711304   0.230203166604042
   0.970483958721161   0.777562081813812   0.224996820092201
   0.970057606697083   0.783332884311676   0.219790473580360
   0.969631195068359   0.789103746414185   0.214584112167358
   0.969204783439636   0.794874608516693   0.209377765655518
   0.968778371810913   0.800645470619202   0.204171419143677
   0.968351960182190   0.806416332721710   0.198965072631836
   0.967925548553467   0.812187135219574   0.193758726119995
   0.967499136924744   0.817957997322083   0.188552379608154
   0.967072725296021   0.823728859424591   0.183346033096313
   0.966646313667297   0.829499721527100   0.178139671683311
   0.966219902038574   0.835270583629608   0.172933325171471
   0.965793490409851   0.841041445732117   0.167726978659630
   0.965367078781128   0.846812248229980   0.162520632147789
   0.964940667152405   0.852583110332489   0.157314285635948
   0.964514255523682   0.858353972434998   0.152107939124107
   0.964087843894959   0.864124834537506   0.146901592612267
   0.963661432266235   0.869895696640015   0.141695231199265
   0.963235080242157   0.875666499137878   0.136488884687424
   0.962808668613434   0.881437361240387   0.131282538175583
   0.962382256984711   0.887208223342896   0.126076191663742
   0.961955845355988   0.892979085445404   0.120869845151901
   0.961529433727264   0.898749947547913   0.115663491189480
   0.961103022098541   0.904520809650421   0.110457144677639
   0.960676610469818   0.910291612148285   0.105250798165798
   0.960250198841095   0.916062474250793   0.100044444203377
   0.959823787212372   0.921833336353302   0.094838097691536
   0.968061923980713   0.952466666698456   0.074319049715996
   0.976300001144409   0.983099997043610   0.053800001740456],...
    'Color',[1 1 1]);
% Create axes
axes1 = axes('Parent',figure1,'CLim',[1/N 10/N],...
    'FontName','palatino linotype',...
    'Position',[0.0483267479549314 0.10387323943662 0.794162613747196 0.805281690140842]);
hold(axes1,'on');

%axis limit
xlim(axes1,[0 2048]);

% Create scatter
scatter(X1,Y1,S1,C1,'Marker','.');

% Adds plot of averages to graph 
p=plot(averages);
set(p,'Color',[0.2 0.84 .22],...
    'LineWidth',2);

%Set image size
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 20 8]);

% Set general axes properties
set(axes1,'CLim',[1/N 10/N],'FontName','palatino linotype','FontSize',12);


% Create xlabel
xlabel('Position','FontWeight','bold','FontSize',16,...
    'FontName','Palatino Linotype');

%set x-axis label offset (adjust the middle value in the last vector)
xlabh=get(gca,'Xlabel');
set(xlabh,'Position',get(xlabh,'Position')-[0 0 0]);

% Create ylabel
ylabel({'Intensity',''},'FontWeight','bold','FontSize',16,...
    'FontName','Palatino Linotype');

%set y-axis label offset (adjust the first value in the last vector)
%ylabh=get(gca,'Ylabel');
%set(ylabh,'Position',get(ylabh,'Position')-[-70 0 0]);

% Create title
% title({'Histogram'},'HorizontalAlignment','center','FontWeight','bold',...
%     'FontSize',30,...
%     'FontName','Palatino Linotype');

% Create colorbar
colorbar('peer',axes1,...
    'position',[0.915690027631546 .12 .015 .4]);

% Create textbox
%Regarding the position of the box:  the first coordinate is the horizontal
%position, the second the vertical,...
annotation(figure1,'textbox',...
    [0.888690027631546 0.610428934530504 0.19497098444436 0.283215374503552],...
    'String',{['S^{2}_{max}:   ' sprintf('%.5f',max(sampDEV))],'',['S^{2}_{min}:   ' sprintf('%.5f',min(sampDEV))],'',['S^{2}_{avg}:   ' sprintf('%.5f',mean(sampDEV))],'',['Range_{max}:   ' sprintf('%.5f',absoMAX)],'',['N:   ' int2str(N)]},...
    'FontSize',12,...
    'FontName','Palatino Linotype',...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);

%saveas(figure1, [filename '.jpg']);

print(figure1,'-dbmp',[filename '.bmp'] , '-r600');

%print(figure1,'-dbmp',[filename '.bmp'] , '-r600');   %research quality
%without going overboard

%clf & close(gcf) clear & close the current figure, respectively.  This is
%FUCKING NECESSARY! here & in any called functions involving images, to avoid
%maxing out RAM.  The reduction was +40% in Histograms_Folder.  Here they've been placed following image saving & by trial & error. 
%Incorrect placement results in large RAM spikes.  The clear all command
%results in the same problem, or just additional memory use.  Maybe functions
%are cleared that shouldn't be- or who knows what.    

clf
close(gcf)



end