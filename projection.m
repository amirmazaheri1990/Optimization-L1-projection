function [out] = projection(w,z)
    v = w;
    w = abs(w);
   if (sum(sum(w))<=z),
      out =w;
      return;
   end
    U = [1:size(w,2)]; s=0; ro = 0;
    while length(U>0),
        k = ceil((length(U)+1)/2);
        G = find(w>=w(U(k)));
        G = intersect(U,G);
        L = setdiff(U,G);
        delta_ro = length(G);
        delta_s = sum(w(G));
        if(s+delta_s-(ro+delta_ro)*w(U(k))<z),
            s = s + delta_s;
            ro = ro+ delta_ro;
            U = L;
        else
            U = setdiff(G,U(k));
        end
        teta = (s-z)/ro;  
    end
    for i=1:length(w),
        w(i)= max((w(i)-teta),0);
        w(i) = w(i)*sign(v(i));
    end
    out = w;
end