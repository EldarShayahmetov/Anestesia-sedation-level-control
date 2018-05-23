function out = SEF95(px, fx)
ind=0;
edge=95;
psx=0;
for i=1:length(px)
    if(psx<edge/100)
    psx = psx+px(i);
    ind=i;
    end
end
hold on
stem(fx(ind),px(ind));
hold off
out = fx(ind);
end