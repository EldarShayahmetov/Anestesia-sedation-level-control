function [out1 out2] = PlotSp(sig, Fd)


nfft=2048; % Число точек для алгоритма БПФ
% Устранение линейного тренда и перевод значений сигнала в мс:
RR0=detrend(sig)*1000;
df=Fd/nfft; % Шаг по частоте
Fmax=250; % Максимальная частота для графика
Nf=fix(Fmax/df); % Число отсчетов по оси частот
window=hamming(length(sig)); % Окно Хемминга
[Pxx,f] = periodogram(RR0,window,nfft,Fd); % Спектр
PSxx=0;
for i=1:length(Pxx(1:Nf))
    PSxx = PSxx+Pxx(i);
end
 
C=1/PSxx;
Pout=Pxx(1:Nf)*C;

plot(f(1:Nf),Pout) % График СПМ


out1 = f(1:Nf);
out2 = Pout;
end