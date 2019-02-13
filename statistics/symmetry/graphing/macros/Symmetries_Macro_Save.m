%CREATEFIGURE(X1, Y1, S1, C1)
%  X1:  scatter x
%  Y1:  scatter y
%  S1:  scatter s
%  C1:  scatter c

%  Auto-generated by MATLAB on 21-Aug-2016 11:26:51


function Symmetries_Macro_Save(X1, Y1,symmetry_correspondence_loss,symmetry_distance_loss,filename)

figure1 = figure('Visible','off');

% Create axes
axes1 = axes('Parent',figure1,'CLim',[0.125 0.375],...
    'FontName','palatino linotype',...
    'Position',[0.0483267479549314 0.10387323943662 0.924162613747196 0.805281690140842]);
hold(axes1,'on');

%axis limit
xlim(axes1,[0 2048]);

% Create scatter
scatter(X1,Y1,'MarkerFaceColor',[0 0 0],'MarkerEdgeColor',[0 0 0],...
    'Marker','.');

% Create line of symmetry based on correspondence loss
if ~isempty(symmetry_correspondence_loss)
    y_values=get(gca,'ylim');
    plot([symmetry_correspondence_loss symmetry_correspondence_loss],y_values,'Color',[0   0.800000011920929   0.800000011920929]);
end
    
    
% Create line of symmetry based on distance loss
if ~isempty(symmetry_distance_loss)
    y_values=get(gca,'ylim');
    plot([symmetry_distance_loss symmetry_distance_loss],y_values,'Color',[0   0   0]);
end

%Set image size:
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 20 8]);

% Set general axes properties
set(axes1,'CLim',[0.125 0.375],'FontName','palatino linotype','FontSize',12);


% Create xlabel
xlabel('Domain','FontWeight','bold','FontSize',16,...
    'FontName','Palatino Linotype');

%set x-axis label offset (adjust the middle value in the last vector)
xlabh=get(gca,'Xlabel');
set(xlabh,'Position',get(xlabh,'Position')-[0 0 0]);

% Create ylabel
ylabel('Range','FontWeight','bold','FontSize',16,...
    'FontName','Palatino Linotype');

%set y-axis label offset (adjust the first value in the last vector)
ylabh=get(gca,'Ylabel');
set(ylabh,'Position',get(ylabh,'Position')-[-70 0 0]);



% Create title
title('Averages');


% Create title
title({'Averages'},'HorizontalAlignment','center','FontWeight','bold',...
    'FontSize',30,...
    'FontName','Palatino Linotype');

saveas(figure1, [filename '.jpg']);

clf
close(gcf)

end
