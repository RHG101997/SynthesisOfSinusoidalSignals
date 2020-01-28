%%Code by Proffesor Bai 
%edited to functionsni by Richard Hernandez
function ee = adsr(dur,tt)
     %---  Add ADSR  ---%
     % this are the current best values
     %all values will be save on tt.
   if( dur>0.15 )
      ee = interp1([0,0.05,0.1,dur-0.05,dur],[0,1,0.9,0.8,0],tt);
   elseif( dur>0.10 )
       % same as the above code but not Sudden D dropt
      ee = interp1([0,0.05,dur-0.05,dur],[0,1,0.8,0],tt);
   else
       % because is too short will go up fast and decrease during the rest
       % of the time.
      ee = interp1([0,0.05,dur],[0,1,0],tt);
   end 
end
