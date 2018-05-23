function out = Entropy(Pxx, f)
E=0;
for i=1:length(Pxx)
E=E+(Pxx(i)*log2(1/Pxx(i)));
end

En = E*100/log2(length(f(f<40)));
out = En;
end