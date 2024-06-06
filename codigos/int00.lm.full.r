int00.lm.full <- lm(nperf ~ clock + threads + cores + transistors 
+ dieSize + voltage + featureSize + channel + FO4delay 
+ L1icache + sqrt(L1icache) + L1dcache + sqrt(L1dcache) 
+ L2cache + sqrt(L2cache), data=int00.dat)