function [out1 out2] = PlotSp(sig, Fd)


nfft=2048; % ����� ����� ��� ��������� ���
% ���������� ��������� ������ � ������� �������� ������� � ��:
RR0=detrend(sig)*1000;
df=Fd/nfft; % ��� �� �������
Fmax=250; % ������������ ������� ��� �������
Nf=fix(Fmax/df); % ����� �������� �� ��� ������
window=hamming(length(sig)); % ���� ��������
[Pxx,f] = periodogram(RR0,window,nfft,Fd); % ������
PSxx=0;
for i=1:length(Pxx(1:Nf))
    PSxx = PSxx+Pxx(i);
end
 
C=1/PSxx;
Pout=Pxx(1:Nf)*C;

plot(f(1:Nf),Pout) % ������ ���


out1 = f(1:Nf);
out2 = Pout;
end