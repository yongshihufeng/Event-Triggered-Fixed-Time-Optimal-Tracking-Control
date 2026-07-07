clear; clc; close all;

load('simulation_data.mat');

function adjustYLim(figNum)
    figure(figNum);
    allAxes = findobj(gcf, 'Type', 'axes');
    for ax = allAxes'
        lines = findobj(ax, 'Type', 'line');
        if isempty(lines), continue; end
        yMin = inf; yMax = -inf;
        for k = 1:length(lines)
            yData = lines(k).YData;
            if isempty(yData), continue; end
            yMin = min(yMin, min(yData));
            yMax = max(yMax, max(yData));
        end
        if isinf(yMin) || isinf(yMax), continue; end
        range = yMax - yMin;
        if range == 0
            yMin = yMin - 0.1; yMax = yMax + 0.1;
        else
            yMin = yMin - 0.02*range; yMax = yMax + 0.02*range;
        end
        ylim(ax, [yMin, yMax]);
    end
end

function setFigureStyle(figNum, nSubplots)
    width = 10;
    if nSubplots == 1, height = 2.5; else, height = nSubplots*2.5 + 1; end
    figure(figNum);
    set(gcf, 'Units', 'centimeters', 'Position', [2, 2, width, height]);
    allAxes = findobj(gcf, 'Type', 'axes');
    for ax = allAxes'
        set(ax, 'FontSize', 6);
        ax.XLabel.FontSize = 6;
        ax.YLabel.FontSize = 6;
        hLeg = get(ax, 'Legend');
        if ~isempty(hLeg), set(hLeg, 'FontSize', 6); end
    end
end

figure(1);
subplot(2,1,1);
h1 = plot(t, yd, 'r-', t, omega, 'b--', 'LineWidth',0.5);
ylabel('\omega (rad/s)'); legend(h1, 'Ref','Actual');
subplot(2,1,2);
h2 = plot(t, zeta1, 'b-', 'LineWidth',0.5);
xlabel('Time (s)'); ylabel('\zeta_1 (rad/s)'); legend(h2, '\zeta_1');
setFigureStyle(1,2); adjustYLim(1); print('-depsc','-r600','Fig1.eps');

figure(2);
subplot(2,1,1);
h3 = plot(t, e1, 'b-', 'LineWidth',0.5);
ylabel('e_1'); legend(h3, 'e_1');
subplot(2,1,2);
h4 = plot(t, eta, 'b-', 'LineWidth',0.5);
xlabel('Time (s)'); ylabel('\eta'); legend(h4, '\eta');
setFigureStyle(2,2); adjustYLim(2); print('-depsc','-r600','Fig2.eps');

figure(3);
subplot(2,1,1);
h5 = plot(t, iq, 'b-', 'LineWidth',0.5);
ylabel('i_q (A)'); legend(h5, 'i_q');
subplot(2,1,2);
h6 = plot(t, id, 'b--', 'LineWidth',0.5);
xlabel('Time (s)'); ylabel('i_d (A)'); legend(h6, 'i_d (MTPA)');
setFigureStyle(3,2); adjustYLim(3); print('-depsc','-r600','Fig3.eps');

figure(4);
subplot(2,1,1);
h7 = plot(t, uq_ideal, 'b-', 'LineWidth',0.5);
ylabel('u_q (V)'); legend(h7, 'u_q');
subplot(2,1,2);
h8 = plot(t, ud, 'b--', 'LineWidth',0.5);
xlabel('Time (s)'); ylabel('u_d (V)'); legend(h8, 'u_d');
setFigureStyle(4,2); adjustYLim(4); print('-depsc','-r600','Fig4.eps');

figure(5);
subplot(2,1,1);
h9 = plot(t, Wf1_norm, 'b-', 'LineWidth',0.5);
ylabel('||W_{f1}||'); legend(h9, '||W_{f1}||');
subplot(2,1,2);
h10 = plot(t, Wf2_norm, 'b--', 'LineWidth',0.5);
xlabel('Time (s)'); ylabel('||W_{f2}||'); legend(h10, '||W_{f2}||');
setFigureStyle(5,2); adjustYLim(5); print('-depsc','-r600','Fig5.eps');

figure(6);
subplot(2,1,1);
h11 = plot(t, Wg1_norm, 'b-', 'LineWidth',0.5);
ylabel('||W_{g1}||'); legend(h11, '||W_{g1}||');
subplot(2,1,2);
h12 = plot(t, Wg2_norm, 'b--', 'LineWidth',0.5);
xlabel('Time (s)'); ylabel('||W_{g2}||'); legend(h12, '||W_{g2}||');
setFigureStyle(6,2); adjustYLim(6); print('-depsc','-r600','Fig6.eps');

figure(7);
subplot(2,1,1);
h13 = plot(t, Wc1_norm, 'b-', 'LineWidth',0.5);
ylabel('||W_{c1}||'); legend(h13, '||W_{c1}||');
subplot(2,1,2);
h14 = plot(t, Wc2_norm, 'b--', 'LineWidth',0.5);
xlabel('Time (s)'); ylabel('||W_{c2}||'); legend(h14, '||W_{c2}||');
setFigureStyle(7,2); adjustYLim(7); print('-depsc','-r600','Fig7.eps');

figure(8);
subplot(2,1,1);
h15 = plot(t, Wa1_norm, 'b-', 'LineWidth',0.5);
ylabel('||W_{a1}||'); legend(h15, '||W_{a1}||');
subplot(2,1,2);
h16 = plot(t, Wa2_norm, 'b--', 'LineWidth',0.5);
xlabel('Time (s)'); ylabel('||W_{a2}||'); legend(h16, '||W_{a2}||');
setFigureStyle(8,2); adjustYLim(8); print('-depsc','-r600','Fig8.eps');

figure(9);
subplot(2,1,1);
h17 = plot(t, inst_cost1, 'b-', 'LineWidth',0.5);
ylabel('Instant cost'); legend(h17, 'Step 1');
subplot(2,1,2);
h18 = plot(t, integ_cost1, 'b-', 'LineWidth',0.5);
xlabel('Time (s)'); ylabel('Integral cost'); legend(h18, 'Step 1');
setFigureStyle(9,2); adjustYLim(9); print('-depsc','-r600','Fig9.eps');

figure(10);
subplot(2,1,1);
h19 = plot(t, inst_cost2, 'b-', 'LineWidth',0.5);
ylabel('Instant cost'); legend(h19, 'Step 2');
subplot(2,1,2);
h20 = plot(t, integ_cost2, 'b-', 'LineWidth',0.5);
xlabel('Time (s)'); ylabel('Integral cost'); legend(h20, 'Step 2');
setFigureStyle(10,2); adjustYLim(10); print('-depsc','-r600','Fig10.eps');

figure(11);
subplot(3,1,1);
h21 = plot(t, e_et_display, 'b-', t, threshold_display, 'r--', 'LineWidth',0.5);
ylabel('|e_{et}|, \sigma'); legend(h21, '|e_{et}|','Threshold');
subplot(3,1,2);
h22 = plot(trigger_times(2:end), trigger_intervals, 'b-o', 'LineWidth',0.5);
xlabel('Time (s)'); ylabel('Inter-event time (s)'); legend(h22, 'Interval'); xlim([0 10]);
subplot(3,1,3);
cum_trig = 0:num_triggers;
stairs(trigger_times, cum_trig, 'b-', 'LineWidth',0.5);
xlabel('Time (s)'); ylabel('Cumulative triggers'); xlim([0 10]); grid on;
setFigureStyle(11,3); adjustYLim(11); print('-depsc','-r600','Fig11.eps');

fprintf('All 11 figures regenerated and saved as EPS files.\n');