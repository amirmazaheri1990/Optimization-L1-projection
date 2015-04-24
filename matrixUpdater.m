function out = matrixUpdater(original,portions),
if (isvector(original)),
original_sum = original;
else
original_sum = sum(original);
end
    p = portions./original_sum;
   
    original2 = original.* repmat(p,size(original,1),1);
    out = original2;
    
    
end