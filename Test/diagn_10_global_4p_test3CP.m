%����������� � �������������� ������� �������������� 
%�� ���� ������� ���������� �������� (������� GLCM) 
%����������� ������ �� 10 ���������������� ��������
%����������� ��������� �� ��������� ������� �������������� ��������, 
%��������������� ������� ���������� �������� ��� 10 ��������� (��������) 
%� �������� ������� ����������  �������� ������� �����������
%������������ ����������� �� ������ 10-� ��������� ��� ������ ��������� 
%(��� ������ �������)��������.
%�������� ���������� ������� �������������� �������� ���������.
 
 
clc;
clear;
 
kz=10;%���������� ��������� ����������� 
k=2;%����� ���������� ����������� (����� �������) �� �����
m=1;%���������� �������������� ��������� (��������� �� ����������)
kb_in=2^k;%������� ��� ����������� (����� ��� ����������� ������������ �����������)
BT=0.999;%����������� ��� ������ ����������� (�� 0.997    �� 0.999)
x = 0:14;%������ ��������� ��������
 
 
%��������� ���������� ��������� �� ���������� Contrast, Correlation,
%Energy,Homogenity ��� ��������� R,G,B,RG,RB,GB (������� �� ���������� ���������� ��� kz
%��������)
% Rcon = [0.2457 0.124 0.3154 0.2008 0.3102 0.2077 0.2023 0.1599 0.2013 0.2941 0.3151 0.1268 0.2207 0.33 0.34];
% Rcor = [0.9497 0.9439 0.8911 0.8028 0.8128 0.9657 0.937 0.9296 0.8735 0.8784 0.8542 0.9341 0.9049 0.8213 0.935];
% Ren = [0.1195 0.2224 0.1504 0.3312 0.1897 0.1092 0.2122 0.2347 0.2263 0.1417 0.1444 0.2764 0.1639 0.1693 0.1583];
% Rhom = [0.9005 0.9471 0.8596 0.925 0.8669 0.9064 0.9062 0.923 0.9024 0.8653 0.8514 0.938 0.8938 0.8495 0.9026];
% Gcon = [0.2055    0.1204  0.2809  0.2413  0.3021  0.1782  0.2229  0.1494  0.226   0.241   0.2542  0.1181  0.2591  0.367   0.1953];
% Gcor = [0.9126    0.9436  0.8666  0.7935  0.8201  0.9628  0.9378  0.9377  0.9062  0.862   0.8593  0.942   0.7696  0.8382  0.9441];
% Gen = [0.1816 0.2485  0.2108  0.2585  0.1797  0.132   0.1415  0.298   0.1651  0.1827  0.1731  0.3011  0.2667  0.1998  0.146];
% Ghom = [0.9kz4    0.9477  0.8758  0.9046  0.8637  0.9188  0.8949  0.9281  0.8911  0.885   0.8766  0.9424  0.8872  0.8706  0.9064];
% Bcon = [0.221 0.1095  0.31kz  0.2527  0.313   0.1799  0.1791  0.1634  0.2008  0.2449  0.3kz5  0.0996  0.2928  0.408   0.19kz];
% Bcor = [0.9418    0.9412  0.80kz  0.7478  0.8167  0.96    0.8436  0.96    0.8756  0.8239  0.8599  0.9651  0.8327  0.7752  0.9501];
% Ben = [0.143  0.2467  0.2115  0.3014  0.1764  0.1765  0.36    0.3596  0.4416  0.2292  0.1689  0.5066  0.1982  0.2018  0.1538];
% Bhom = [0.9115    0.9553  0.8613  0.9102  0.8541  0.917   0.9133  0.9206  0.9023  0.8832  0.8515  0.9514  0.8715  0.8596  0.9075];
% RGcon = [0.0325   0.0272  0.0068  0.0716  0.2173  0.0436  0.0047  0.0353  0.022   0   0.2309  0.0141  0.1669  0   0.1915];
% RGcor = [0.9443   0.8913  0.7202  0.8351  0.7942  0.8913  0.7728  0.9363  0.901   0   0.6877  0.8054  0.7707  0   0.9501];
% RGen = [0.7012    0.7232  0.9689  0.5689  0.2338  0.6744  0.9748  0.4623  0.7886  1   0.3307  0.9136  0.3319  1   0.1538];
% RGhom = [0.9838   0.9864  0.9966  0.9642  0.8922  0.9782  0.9977  0.9823  0.989   1   0.8854  0.9929  0.9178  1   0.9075];
% RBcon = [0.1206   0.0796  0.0778  0.1414  0.4523  0.1227  0.0939  0.1122  0.1004  0.1579  0.4487  0.0494  0.2209  0.0353  0.0053];
% RBcor = [0.9804   0.9222  0.8669  0.9139  0.7994  0.954   0.9383  0.9468  0.9186  0.8088  0.8683  0.9505  0.8746  0.8215  0.7371];
% RBen = [0.2187    0.3535  0.5046  0.2234  0.1276  0.2023  0.3236  0.2454  0.313   0.3227  0.0914  0.3914  0.2045  0.8055  0.9747];
% RBhom = [0.9401   0.9602  0.9611  0.9305  0.8144  0.9388  0.9532  0.9439  0.9532  0.9212  0.7974  0.9753  0.8919  0.9823  0.9974];
% GBcon = [0.1205   0.0626  0.0764  0.0842  0.3176  0.0818  0.1041  0.1037  0.1425  0.1464  0.1746  0.0578  0.1258  0.0385  0.0535];
% GBcor = [0.964    0.9218  0.8665  0.8384  0.7138  0.9187  0.9267  0.9192  0.9289  0.7705  0.794   0.9458  0.812   0.7731  0.8965];
% GBen = [0.1983    0.3974  0.4506  0.4231  0.25kz  0.3384  0.2669  0.3425  0.2186  0.4016  0.3142  0.3648  0.4018  0.8044  0.4677];
% GBhom = [0.94 0.9687  0.9618  0.9583  0.8518  0.9591  0.9484  0.9482  0.9343  0.9269  0.9127  0.9711  0.9371  0.9807  0.9733];
 
%��������� ��������. �������2
% Rcon=[0.2952    0.1468  0.6683  0.2377  0.7554  0.2935  0.4243  0.2211  0.5882  0.3389  0.4601  0.1577  0.4222  0.5914  0.2519];
% Rcor=[0.9322    0.9227  0.762   0.7828  0.6414  0.9459  0.8763  0.882   0.658   0.8578  0.7947  0.8512  0.8047  0.777   0.8934];
% Ren=[0.1201 0.2185  0.1046  0.2853  0.1253  0.0965  0.1429  0.207   0.1231  0.1309  0.1165  0.2965  0.1339  0.1363  0.1656];
% Rhom=[0.8786    0.9272  0.7635  0.9047  0.7665  0.8695  0.8192  0.8926  0.7616  0.8437  0.7979  0.9212  0.8208  0.8048  0.8793];
% Rentr=[3.5632   2.6404  3.8621      2.4421  3.6943  3.7969  3.4474  2.8583  3.4534  3.3458  3.5091  2.2724  3.3723  3.5312  3.0922];
% Ridm=[0.877 0.9272  0.7562  0.9036  0.7563  0.8681  0.8165  0.8923  0.7564  0.8425  0.7951  0.9212  0.8179  0.7983  0.8789];
% Gcon=[0.2641    0.1409  0.6492  0.2764  0.7484  0.2625  0.4357  0.2054  0.6061  0.3082  0.4183  0.1592  0.4813  0.5143  0.2412];
% Gcor=[0.862 0.9186  0.6842  0.7669  0.6466  0.9305  0.8573  0.8809  0.7658  0.8277  0.774   0.8577  0.699   0.7629  0.9168];
% Gen=[0.1886 0.2593  0.1385  0.2385  0.1117  0.123   0.1076  0.2749  0.0973  0.1604  0.1357  0.3021  0.1987  0.1719  0.1433];
% Ghom=[0.89  0.93    0.7715  0.8864  0.7601  0.8805  0.8136  0.9008  0.759   0.8543  0.8146  0.9206  0.8162  0.8277  0.8847];
% Gentr=[2.9743   2.4845  3.5313  2.5853  3.7054  3.5134  3.6755  2.6368  3.7794  3.082   3.2831  2.3168  3.1041  3.2618  3.2517];
% Gidm=[0.8885    0.93    0.7644  0.8853  0.7503  0.8794  0.811   0.9004  0.7532  0.8535  0.8122  0.9206  0.8109  0.8218  0.8842];
% Bcon=[0.2647    0.1326  0.6532  0.2651  0.6756  0.2662  0.4168  0.2241  0.5705  0.2977  0.4796  0.1285  0.5006  0.5422  0.2485];
% Bcor=[0.9189    0.9185  0.6187  0.7008  0.6134  0.907   0.6859  0.8789  0.3845  0.8024  0.7617  0.7951  0.7689  0.6947  0.9051];
% Ben=[0.1458 0.2349  0.1393  0.2939  0.122   0.1864  0.2175  0.3354  0.2052  0.2006  0.1355  0.5361  0.1307  0.1677  0.1589];
% Bhom=[0.8895    0.9342  0.7661  0.8982  0.7608  0.8782  0.8195  0.8893  0.7641  0.8595  0.792   0.9359  0.8077  0.8166  0.8804];
% Bentr=[3.3563   2.5377  3.4451  2.2741  3.4216  3.1392  2.9187  2.1866  2.8005  2.9151  3.3569  1.4676  3.4956  3.1874  3.1286];
% Bidm=[0.8882    0.9342  0.7592  0.897   0.7528  0.8773  0.8171  0.8892  0.7595  0.8587  0.7888  0.9359  0.8023  0.8109  0.88];
% RGcon=[0.0309   0.0252  0.0061  0.0704  0.1667  0.0501  0.0054  0.0368  0.023   0.0003  0.2192  0.0133  0.152   0   0.0015];
% RGcor=[0.9468   0.9007  0.7206  0.8331  0.8098  0.8924  0.769   0.9329  0.902   -0.0001 0.6811  0.7481  0.7469  0   0.3993];
% RGen=[0.7041    0.7221  0.9719  0.5671  0.2946  0.6123  0.9714  0.4589  0.7769  0.9994  0.3123  0.9341  0.3884  1   0.996];
% RGhom=[0.9845   0.9874  0.9969  0.9648  0.9167  0.975   0.9973  0.9816  0.9885  0.9999  0.8904  0.9934  0.924   1   0.9993];
% RGentr=[0.9594  0.7649  0.1287  1.2216  2.134   1.1428  0.1292  1.3232  0.6892  0.0052  2.0346  0.2602  1.8297  0.0013  0.025];
% RGidm=[0.9846   0.9874  0.9969  0.9648  0.9167  0.975   0.9973  0.9816  0.9885  0.9999  0.8904  0.9934  0.924   1   0.9993];
% RBcon=[0.1108   0.0758  0.075   0.1239  0.2903  0.1188  0.0768  0.1093  0.0824  0.1229  0.3924  0.0394  0.1991  0.0424  0.0463];
% RBcor=[0.9777   0.9192  0.8549  0.9197  0.8319  0.9569  0.9565  0.9304  0.9073  0.8059  0.8522  0.9309  0.8381  0.8257  0.8237];
% RBen=[0.212 0.3658  0.5378  0.2389  0.1794  0.1868  0.3135  0.2661  0.3504  0.4236  0.1098  0.4717  0.2699  0.7587  0.6944];
% RBhom=[0.9449   0.9621  0.9625  0.9381  0.8646  0.9406  0.9616  0.9454  0.9588  0.9386  0.812   0.9803  0.9007  0.9788  0.9769];
% RBentr=[2.8415  1.8793  1.4741  2.4404  2.9519  2.7617  2.1438  2.4037  1.908   1.8017  3.5289  1.3845  2.4371  0.7793  0.881];
% RBidm=[0.9449   0.9621  0.9625  0.9381  0.8637  0.9406  0.9616  0.9454  0.9588  0.9386  0.8112  0.9803  0.9007  0.9788  0.9769];
% GBcon=[0.1058   0.0576  0.0735  0.075   0.233   0.0788  0.0847  0.0998  0.1203  0.1096  0.1612  0.0606  0.1135  0.0223  0.06];
% GBcor=[0.9554   0.9169  0.8509  0.853   0.7588  0.9181  0.929   0.8908  0.9252  0.7635  0.7715  0.9252  0.8079  0.7192  0.8603];
% GBen=[0.2263    0.4219  0.4966  0.4304  0.3154  0.3529  0.3109  0.3953  0.2428  0.5007  0.3678  0.3834  0.4565  0.8994  0.532];
% GBhom=[0.9472   0.9712  0.9633  0.9625  0.8867  0.9606  0.9577  0.9501  0.9398  0.9452  0.9194  0.9697  0.9432  0.9888  0.97];
% GBentr=[2.6144  1.6136  1.3857  1.4062  2.35    1.9604  2.1181  1.9802  2.5137  1.5052  2.0002  1.7313  1.7248  0.392   1.2541];
% GBidm=[0.9472   0.9712  0.9633  0.9625  0.8864  0.9606  0.9577  0.9501  0.9399  0.9452  0.9194  0.9697  0.9432  0.9888  0.97];
 
%��������� ��������. �������3. ��������� ���������� ��������� �� ���������� Contrast, Correlation,
%Energy,Homogenity  ��������� R,G,B,RG,RB,GB  ������ ��������������� �����������(������� �� 
%���������� ���������� ��� 10 ��������). ��������� Entr � Idm � ��������� �� ������������. 

Rcon=[0.008   0.004   0.007   0.003   0.002   0.005   0.006   0.002   0.004   0.005];
Rcor=[0.873   0.960   0.958   0.972   0.960   0.954   0.952   0.963   0.966   0.947];
Ren=[0.196    0.243   0.132   0.224   0.351   0.217   0.205   0.285   0.203   0.179];
Rhom=[0.840   0.915   0.856   0.934   0.950   0.900   0.885   0.947   0.911   0.884];
Rentr=[0.888 0.819    1.056   0.826   0.650   0.874   0.928   0.695   0.879   0.913];
Ridm=[0.837   0.914   0.853   0.933   0.950   0.899   0.883   0.947   0.910   0.883];
Gcon=[0.008   0.004   0.007   0.003   0.002   0.005   0.005   0.002   0.004   0.005];
Gcor=[0.884   0.969   0.949   0.954   0.950   0.937   0.964   0.943   0.963   0.923];
Gen=[0.183    0.229   0.158   0.290   0.353   0.223   0.202   0.362   0.209   0.234];
Ghom=[0.837   0.913   0.864   0.935   0.950   0.900   0.889   0.950   0.910   0.892];
Gentr=[0.920  0.862   0.985   0.718   0.622   0.824   0.936   0.588   0.867   0.825];
Gidm=[0.834   0.912   0.862   0.934   0.950   0.899   0.887   0.950   0.909   0.892];
Bcon=[0.007   0.003   0.007   0.003   0.002   0.005   0.005   0.002   0.004   0.004];
Bcor=[0.861   0.946   0.941   0.939   0.906   0.921   0.951   0.921   0.949   0.911];
Ben=[0.205    0.330   0.154   0.400   0.570   0.260   0.225   0.474   0.235   0.270];
Bhom=[0.843   0.926   0.857   0.943   0.961   0.901   0.890   0.956   0.911   0.896];
Bentr=[0.860  0.688   1.003   0.603   0.409   0.771   0.883   0.480   0.810   0.772];
Bidm=[0.841   0.926   0.854   0.943   0.961   0.900   0.888   0.956   0.910   0.896];
RGcon=[0.003  0.000   0.000   0.000   0.000   0.001   0.000   0.000   0.000   0.002];
RGcor=[0.902  1.000   1.000   1.000   1.000   0.948   1.000   1.000   1.000   1.000];
RGen=[0.461   0.837   0.998   0.868   0.821   0.542   0.996   0.885   0.931   0.584];
RGhom=[0.938  0.992   1.000   0.994   0.994   0.974   0.999   0.994   0.997   0.962];
RGentr=[0.485 0.139   0.003   0.115   0.133   0.373   0.006   0.099   0.057   0.350];
RGidm=[0.938  0.992   1.000   0.994   0.994   0.974   0.999   0.994   0.997   0.962];
RBcon=[0.005  0.001   0.002   0.002   0.001   0.003   0.001   0.001   0.001   0.004];
RBcor=[0.924  0.953   1.000   0.972   0.966   0.958   1.000   0.977   0.962   0.947];
RBen=[0.214   0.448   0.542   0.317   0.368   0.291   0.598   0.466   0.396   0.228];
RBhom=[0.890  0.968   0.958   0.960   0.967   0.939   0.971   0.981   0.968   0.912];
RBentr=[0.797 0.501   0.400   0.652   0.554   0.717   0.335   0.465   0.532   0.798];
RBidm=[0.889  0.968   0.958   0.960   0.967   0.939   0.971   0.981   0.968   0.911];
GBcon=[0.003  0.001   0.002   0.001   0.001   0.002   0.001   0.001   0.001   0.002];
GBcor=[0.843  0.965   0.911   0.951   0.951   0.926   0.951   0.956   0.943   0.905];
GBen=[0.457   0.441   0.487   0.431   0.515   0.353   0.502   0.510   0.499   0.442];
GBhom=[0.928  0.970   0.951   0.964   0.975   0.944   0.972   0.979   0.967   0.945];
GBentr=[0.461 0.492   0.442   0.514   0.411   0.614   0.415   0.378   0.436   0.519];
GBidm=[0.928  0.970   0.951   0.964   0.975   0.944   0.972   0.979   0.967   0.944];

%������� 3.��������� ���������� ���������  ���������� Contrast, Correlation,
%Energy,Homogenity  ��������� R,G,B,RG,RB,GB  10-�� ������ ���������������
%����������� �� ������ 10 ��������� ���������� �������� �� ������ ��������� ��� 10 �������� 

XRcon=[0 .009732  0 .002683  0 .007879  0 .00188  0 .001709  0 .006301  0 .005338  0 .001813  0 .003293  0 .004833];
XRcor=[0 .842253  0 .972367  0 .967217  0 .973584  0 .963466  0 .923558  0 .960375  0 .964543  0 .964752  0 .948111];
XRen=[0 .180562  0 .25007  0 .120303  0 .258824  0 .379043  0 .288157  0 .156619  0 .289427  0 .23531  0 .176847];
XRhom=[0 .814119  0 .935159  0 .854446  0 .954481  0 .958125  0 .878791  0 .877889  0 .955605  0 .931203  0 .887444];
XRentr=[0 .925573  0 .788942  1 .111242  0 .748902  0 .608696  0 .779694  0 .987243  0 .652654  0 .786268  0 .91643];
XRidm=[0 .809854  0 .935088  0 .850992  0 .954428  0 .958125  0 .877015  0 .877057  0 .955604  0 .930771  0 .886859];
XGcon=[0 .009858  0 .002977  0 .007267  0 .001897  0 .001894  0 .006686  0 .005207  0 .001726  0 .003323  0 .004382];
XGcor=[0 .859235  0 .973305  0 .956448  0 .955768  0 .95905  0 .913441  0 .965474  0 .947516  0 .963442  0 .919096];
XGen=[0 .156481  0 .232744  0 .139002  0 .335611  0 .331224  0 .210658  0 .153537  0 .370625  0 .248521  0 .248264];
XGhom=[0 .808158  0 .927848  0 .858861  0 .954301  0 .953591  0 .870887  0 .88154  0 .957734  0 .930777  0 .895391];
XGentr=[0 .972893  0 .834845  1 .035688  0 .626055  0 .622265  0 .865564  0 .993794  0 .556195  0 .764862  0 .825653];
XGidm=[0 .803951  0 .927781  0 .856153  0 .95423  0 .953591  0 .86879  0 .880669  0 .957733  0 .930307  0 .895119];
XBcon=[0 .008914  0 .002332  0 .007406  0 .001366  0 .001325  0 .006612  0 .005058  0 .001664  0 .002862  0 .00436];
XBcor=[0 .818056  0 .958045  0 .953728  0 .953191  0 .913465  0 .882335  0 .953201  0 .936905  0 .94687  0 .907565];
XBen=[0 .204677  0 .329807  0 .136838  0 .506051  0 .592919  0 .210117  0 .176333  0 .395467  0 .288237  0 .263248];
XBhom=[0 .81717  0 .943049  0 .856763  0 .967692  0 .967542  0 .864952  0 .883665  0 .959253  0 .933783  0 .896755];
XBentr=[0 .864677  0 .703195  1 .051388  0 .483573  0 .353129  0 .842944  0 .932758  0 .507631  0 .693934  0 .76245];
XBidm=[0 .814111  0 .943032  0 .853866  0 .967622  0 .967542  0 .863433  0 .882936  0 .959251  0 .933507  0 .896401];
XRGcon=[0 .003373  0 .00021  0  0 .000124  0 .000316  0 .001559  0  0  0  0 .001771];
XRGcor=[0 .875219  0 .949242  1  0 .950183  0 .897702  0 .922159  0 .983317  0 .946101  0 .985412  0 .917336];
XRGen=[0 .450874  0 .89463  1  0 .903823  0 .735572  0 .494008  0 .999732  0 .976572  0 .95613  0 .532834];
XRGhom=[0 .921135  0 .994852  1  0 .996963  0 .992257  0 .96192  0 .999966  0 .998198  0 .998346  0 .956829];
XRGentr=[0 .512083  0 .080769  0  0 .083895  0 .180881  0 .410017  0 .000504  0 .027232  0 .037198  0 .379298];
XRGidm=[0 .920757  0 .994852  1  0 .996963  0 .992257  0 .961908  0 .999966  0 .998198  0 .998346  0 .956808];
XRBcon=[0 .00604  0 .001157  0 .00064  0 .001179  0 .00112  0 .003158  0 .001097  0 .000476  0 .001009  0 .003532];
XRBcor=[0 .899426  0 .969356  0 .881409  0 .969779  0 .968931  0 .923151  1  0 .975373  0 .96714  0 .947358];
XRBen=[0 .202866  0 .410258  0 .743542  0 .373065  0 .368227  0 .380782  0 .548884  0 .56638  0 .431275  0 .228664];
XRBhom=[0 .861013  0 .971694  0 .984334  0 .971134  0 .972559  0 .926046  0 .973134  0 .988342  0 .976001  0 .917166];
XRBentr=[0 .82323  0 .524363  0 .217033  0 .575935  0 .544454  0 .608019  0 .358544  0 .353596  0 .486724  0 .790723];
XRBidm=[0 .860115  0 .971691  0 .984333  0 .971131  0 .972559  0 .925854  0 .973134  0 .988342  0 .975935  0 .9168];
XGBcon=[0 .00391  0 .000994  0 .001239  0 .001052  0 .000784  0 .003043  0 .0011  0 .000797  0 .000939  0 .002159];
XGBcor=[0 .799088  0 .967967  0 .92224  0 .947404  0 .959548  0 .867581  0 .945587  0 .956783  0 .952287  0 .916762];
XGBen=[0 .404353  0 .482687  0 .561794  0 .498448  0 .563714  0 .408232  0 .511161  0 .515297  0 .558188  0 .38687];
XGBhom=[0.904704  0.975644  0.969637  0.974277  0.980785  0.926431  0.973092  0.980473  0.977786  0.947152];
XGBentr=[0.503998  0.443957  0.353111  0.43587  0.394855  0.549971  0.392075  0.362618  0.370437  0.554595];
XGBidm=[0.904654  0 .975644  0 .969637  0 .974273  0 .980785  0 .926337  0 .973088  0 .980473  0 .977706  0 .947146];


 
result=0;
global_result=0;
for j1=1:m
    for i=1:kz
        Voting_global(i)=0;
    end    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:kz    
    Sum_res_vot(i)=0;    
end; 
for j=1:kz %j- ����� �������
Rcon_fp(j)=1-abs(Rcon(j)-XRcon(k));%������� �������������� 1
%k - ���������� ����� ������������ ������� �� ����� ����������� � ����� ��������,
end
for j=1:kz
Rcor_fp(j)=1-abs(Rcor(j)-XRcor(k));%������� �������������� 2
end
for j=1:kz
Ren_fp(j)=1-abs(Ren(j)-XRen(k));%������� �������������� 3
end
for j=1:kz
Rhom_fp(j)=1-abs(Rhom(j)-Rhom(k));%������� �������������� 4
end
RTEST=Rcor_fp
% xx = 0:.25:14;
% yRcon = spline(x,Rcon,xx);
% yRcor = spline(x,Rcor,xx);
% yRen = spline(x,Ren,xx);
% yRhom = spline(x,Rhom,xx);
% figure
% subplot (4,1,1);
% plot(x,Rcon,'o',xx,yRcon);hold on;plot(xx,0.8,'k');hold off;title('Contrast');subplot(4,1,2); 
% plot(x,Rcor,'o',xx,yRcor);title('Correlation');subplot(4,1,3); 
% plot(x,Ren,'o',xx,yRen);title('Energy');subplot(4,1,4); 
% plot(x,Rhom,'o',xx,yRhom);title('Homogenity'); 
 
%����������� R_con
for i=1:kz
    Res_con_R(i)=0;
end;  
for i=1:kz 
   if(Rcon_fp(i)>BT) %BT(binarization threshold)-����� ����������� ��� ������� ��������������  
        Res_con_R(i)=1;
    end;    
end 
ResCon_R=Res_con_R
 
%����������� R_cor
for i=1:kz
    Res_cor_R(i)=0;
end;  
for i=1:kz
    if (Rcor_fp(i)>BT)
        Res_cor_R(i)=1;
    end;    
end 
ResCor_R=Res_cor_R
 
%����������� R_en
for i=1:kz
    Res_en_R(i)=0;
end;  
for i=1:kz
    if (Ren_fp(i)>BT)
        Res_en_R(i)=1;
    end;    
end 
ResEn_R=Res_en_R
 
%����������� R_hom
for i=1:kz
    Res_hom_R(i)=0;
end;   
for i=1:kz
    if (Rhom_fp(i)>BT)
        Res_hom_R(i)=1;
    end;    
end 
ResHom_R=Res_hom_R
 
%VOTING_R
%disp('Voting');
for i=1:kz
    Sum_res_vot_R(i)=0;   
end;  
for i=1:kz
 Sum_res_vot_R(i)=ResCon_R(i)+ResCor_R(i)+ResEn_R(i)+ResHom_R(i); 
end
Sum1R=Sum_res_vot_R;
Sum1Rmax=max(Sum1R);%%%%%%%%%%%%%
for i=1:kz
    Voting_res_R(i)=0;    
    if (Sum1R(i)==Sum1Rmax);%%%%%%%%%  
        Voting_res_R(i)=1;
    end   
end
Voting_result_R=Voting_res_R
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:kz    
    Sum_res_vot_G(i)=0;
end; 
for j=1:kz
Gcon_fp(j)=1-abs(Gcon(j)-XGcon(k));%������� �������������� 1
end
for j=1:kz
Gcor_fp(j)=1-abs(Gcor(j)-XGcor(k));%������� �������������� 2
end
for j=1:kz
Gen_fp(j)=1-abs(Gen(j)-XGen(k));%������� �������������� 3
end
for j=1:kz
Ghom_fp(j)=1-abs(Ghom(j)-XGhom(k));%������� �������������� 4
end
% xx = 0:.25:14;
% yGcon = spline(x,Gcon,xx);
% yGcor = spline(x,Gcor,xx);
% yGen = spline(x,Gen,xx);
% yGhom = spline(x,Ghom,xx);
% figure
% subplot (4,1,1);
% plot(x,Gcon,'o',xx,yGcon);hold on;plot(xx,0.8,'k');hold off;title('Contrast');subplot(4,1,2); 
% plot(x,Gcor,'o',xx,yGcor);title('Correlation');subplot(4,1,3); 
% plot(x,Gen,'o',xx,yGen);title('Energy');subplot(4,1,4); 
% plot(x,Ghom,'o',xx,yGhom);title('Homogenity'); 
 
%����������� G_con
for i=1:kz
    Res_con_G(i)=0;
end;  
for i=1:kz
    if (Gcon_fp(i)>BT) %BT(binarization threshold)-����� ����������� ��� ������� ��������������
        Res_con_G(i)=1;
    end;    
end 
ResCon_G=Res_con_G;
 
%����������� G_cor
for i=1:kz
    Res_cor_G(i)=0;
end;  
for i=1:kz
    if (Gcor_fp(i)>BT)
        Res_cor_G(i)=1;
    end;    
end 
ResCor_G=Res_cor_G;
 
%����������� G_en
for i=1:kz
    Res_en_G(i)=0;
end;  
for i=1:kz
    if (Gen_fp(i)>BT)
        Res_en_G(i)=1;
    end;    
end 
ResEn_G=Res_en_G;
 
%����������� G_hom
for i=1:kz
    Res_hom_G(i)=0;
end;   
for i=1:kz
    if (Ghom_fp(i)>BT)
        Res_hom_G(i)=1;
    end;    
end 
ResHom_G=Res_hom_G;
 
%VOTING
%disp('Voting');
 
for i=1:kz
 Sum_res_vot_G(i)=ResCon_G(i)+ResCor_G(i)+ResEn_G(i)+ResHom_G(i); 
end
Sum1G=Sum_res_vot_G;
Sum1Gmax=max(Sum1G);
for i=1:kz
    Voting_res_G(i)=0;
    if (Sum1G(i)==Sum1Gmax)    
        Voting_res_G(i)=1;
    end    
end
Voting_result_G=Voting_res_G 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:kz    
    Sum_res_vot_B(i)=0;
end; 
for j=1:kz
Bcon_fp(j)=1-abs(Bcon(j)-XBcon(k));%������� �������������� 1
end
for j=1:kz
Bcor_fp(j)=1-abs(Bcor(j)-XBcor(k));%������� �������������� 2
end
for j=1:kz
Ben_fp(j)=1-abs(Ben(j)-XBen(k));%������� �������������� 3
end
for j=1:kz
Bhom_fp(j)=1-abs(Bhom(j)-Bhom(k));%������� �������������� 4
end
% xx = 0:.25:14;
% yBcon = spline(x,Bcon,xx);
% yBcor = spline(x,Bcor,xx);
% yBen = spline(x,Ben,xx);
% yBhom = spline(x,Bhom,xx);
% figure
% subplot (4,1,1);
% plot(x,Bcon,'o',xx,yBcon);hold on;plot(xx,0.8,'k');hold off;title('Contrast');subplot(4,1,2); 
% plot(x,Bcor,'o',xx,yBcor);title('Correlation');subplot(4,1,3); 
% plot(x,Ben,'o',xx,yBen);title('Energy');subplot(4,1,4); 
% plot(x,Bhom,'o',xx,yBhom);title('Homogenity'); 
 
%����������� B_con
%BT (binarization threshold) - ����� ����������� ��� ������� ��������������
for i=1:kz
    Res_con_B(i)=0;
end;  
for i=1:kz
    if (Bcon_fp(i)>BT)
        Res_con_B(i)=1;
    end;    
end 
ResCon_B=Res_con_B;
 
%����������� B_cor
for i=1:kz
    Res_cor_B(i)=0;
end;  
for i=1:kz
    if (Bcor_fp(i)>BT)
        Res_cor_B(i)=1;
    end;    
end 
ResCor_B=Res_cor_B;
 
%����������� B_en
for i=1:kz
    Res_en_B(i)=0;
end;  
for i=1:kz
    if (Ben_fp(i)>BT)
        Res_en_B(i)=1;
    end;    
end 
ResEn_B=Res_en_B;
 
%����������� B_hom
for i=1:kz
    Res_hom_B(i)=0;
end;   
for i=1:kz
    if (Bhom_fp(i)>BT)
        Res_hom_B(i)=1;
    end;    
end 
ResHom_B=Res_hom_B;
 
%VOTING
%disp('Voting');
 
for i=1:kz
 Sum_res_vot_B(i)=ResCon_B(i)+ResCor_B(i)+ResEn_B(i)+ResHom_B(i); 
end
Sum1B=Sum_res_vot_B;
Sum1Bmax=max(Sum1B);
for i=1:kz
    Voting_res_B(i)=0;
    if (Sum1B(i)==Sum1Bmax)  
        Voting_res_B(i)=1;
    end    
end
Voting_result_B=Voting_res_B
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RG RG RG RG RG RG RG RG RG RG RG RG RG RG RG RG RG RG RG  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:kz    
    Sum_res_vot(i)=0;
end; 
noise1=randn(1,kz);
for j=1:kz
RGcon_fp(j)=1-abs(RGcon(j)-XRGcon(k));%������� �������������� 1
end
for j=1:kz
RGcor_fp(j)=1-abs(RGcor(j)-XRGcor(k));%������� �������������� 2
end
for j=1:kz
RGen_fp(j)=1-abs(RGen(j)-XRGen(k));%������� �������������� 3
end
for j=1:kz
RGhom_fp(j)=1-abs(RGhom(j)-XRGhom(k));%������� �������������� 4
end
% xx = 0:.25:14;
% yRcon = spline(x,RGcon,xx);
% yRcor = spline(x,RGcor,xx);
% yRen = spline(x,RGen,xx);
% yRhom = spline(x,RGhom,xx);
% figure
% subplot (4,1,1);
% plot(x,RGcon,'o',xx,yRGcon);hold on;plot(xx,0.8,'k');hold off;title('Contrast');subplot(4,1,2); 
% plot(x,RGcor,'o',xx,yRGcor);title('Correlation');subplot(4,1,3); 
% plot(x,RGen,'o',xx,yRGen);title('Energy');subplot(4,1,4); 
% plot(x,RGhom,'o',xx,yRGhom);title('Homogenity'); 
 
%����������� RG_con
%BT (binary threshold)-����� ����������� ��� ������� ��������������
for i=1:kz
    Res_con_RG(i)=0;
end;  
for i=1:kz
    if (RGcon_fp(i)>BT)
        Res_con_RG(i)=1;
    end;    
end 
ResCon_RG=Res_con_RG;
 
%����������� RG_cor
for i=1:kz
    Res_cor_RG(i)=0;
end;  
for i=1:kz
    if (RGcor_fp(i)>BT)
        Res_cor_RG(i)=1;
    end;    
end 
ResCor_RG=Res_cor_RG;
 
%����������� RG_en
for i=1:kz
    Res_en_RG(i)=0;
end;  
for i=1:kz
    if (RGen_fp(i)>BT)
        Res_en_RG(i)=1;
    end;    
end 
ResEn_RG=Res_en_RG;
 
%����������� RG_hom
for i=1:kz
    Res_hom_RG(i)=0;
end;   
for i=1:kz
    if (RGhom_fp(i)>BT)
        Res_hom_RG(i)=1;
    end;    
end 
ResHom_RG=Res_hom_RG;
 
%VOTING
%disp('Voting');
 
for i=1:kz
 Sum_res_vot_RG(i)=ResCon_RG(i)+ResCor_RG(i)+ResEn_RG(i)+ResHom_RG(i);
end
Sum1RG=Sum_res_vot_RG;
Sum1RGmax=max(Sum1RG);
for i=1:kz
    Voting_res_RG(i)=0;
    if (Sum1RG(i)==Sum1RGmax)   
        Voting_res_RG(i)=1;
    end   
end
Voting_result_RG=Voting_res_RG
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RB RB RB RB RB RB RB RB RB RB RB RB RB RB RB RB RB RB RB  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:kz    
    Sum_res_vot_RB(i)=0;
end; 
for j=1:kz
RBcon_fp(j)=1-abs(RBcon(j)-XRBcon(k));%������� �������������� 1
end
for j=1:kz
RBcor_fp(j)=1-abs(RBcor(j)-XRBcor(k));%������� �������������� 2
end
for j=1:kz
RBen_fp(j)=1-abs(RBen(j)-XRBen(k));%������� �������������� 3
end
for j=1:kz
RBhom_fp(j)=1-abs(RBhom(j)-XRBhom(k));%������� �������������� 4
end
% xx = 0:.25:14;
% yRBcon = spline(x,RBcon,xx);
% yRBcor = spline(x,RBcor,xx);
% yRBen = spline(x,RBen,xx);
% yRBhom = spline(x,RBhom,xx);
% figure
% subplot (4,1,1);
% plot(x,RBcon,'o',xx,yRBcon);hold on;plot(xx,0.8,'k');hold off;title('Contrast');subplot(4,1,2); 
% plot(x,RBcor,'o',xx,yRBcor);title('Correlation');subplot(4,1,3); 
% plot(x,RBen,'o',xx,yRBen);title('Energy');subplot(4,1,4); 
% plot(x,RBhom,'o',xx,yRBhom);title('Homogenity'); 
 
%����������� RB_con
%BT-����� ����������� ��� ������� ��������������
for i=1:kz
    Res_con_RB(i)=0;
end;  
for i=1:kz
    if (RBcon_fp(i)>BT)
        Res_con_RB(i)=1;
    end;    
end 
ResCon_RB=Res_con_RB;
 
%����������� RB_cor
for i=1:kz
    Res_cor_RB(i)=0;
end;  
for i=1:kz
    if (RBcor_fp(i)>BT)
        Res_cor_RB(i)=1;
    end;    
end 
ResCor_RB=Res_cor_RB;
 
%����������� RB_en
for i=1:kz
    Res_en_RB(i)=0;
end;  
for i=1:kz
    if (RBen_fp(i)>BT)
        Res_en_RB(i)=1;
    end;    
end 
ResEn_RB=Res_en_RB;
 
%����������� RB_hom
for i=1:kz
    Res_hom_RB(i)=0;
end;   
for i=1:kz
    if (RBhom_fp(i)>BT)
        Res_hom_RB(i)=1;
    end;    
end 
ResHom_RB=Res_hom_RB;
 
%VOTING
%disp('Voting');
 
for i=1:kz
 Sum_res_vot_RB(i)=ResCon_RB(i)+ResCor_RB(i)+ResEn_RB(i)+ResHom_RB(i);
end
Sum1RB=Sum_res_vot_RB;
Sum1RBmax=max(Sum1RB);
for i=1:kz
    Voting_res_RB(i)=0;
    if (Sum1RB(i)==Sum1RBmax)   
        Voting_res_RB(i)=1;
    end   
end
Voting_result_RB=Voting_res_RB
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GB GB GB GB GB GB GB GB GB GB GB GB GB GB GB GB GB GB GB GB GB GB 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:kz    
    Sum_res_vot_GB(i)=0;
end; 
for j=1:kz
GBcon_fp(j)=1-abs(GBcon(j)-XGBcon(k));%������� �������������� 1
end
for j=1:kz
GBcor_fp(j)=1-abs(GBcor(j)-XGBcor(k));%������� �������������� 2
end
for j=1:kz
GBen_fp(j)=1-abs(GBen(j)-XGBen(k));%������� �������������� 3
end
for j=1:kz
GBhom_fp(j)=1-abs(GBhom(j)-XGBhom(k));%������� �������������� 4
end
% xx = 0:.25:14;
% yBcon = spline(x,GBcon,xx);
% yBcor = spline(x,GBcor,xx);
% yBen = spline(x,GBen,xx);
% yBhom = spline(x,GBhom,xx);
% figure
% subplot (4,1,1);
% plot(x,GBcon,'o',xx,yGBcon);hold on;plot(xx,0.8,'k');hold off;title('Contrast');subplot(4,1,2); 
% plot(x,GBcor,'o',xx,yGBcor);title('Correlation');subplot(4,1,3); 
% plot(x,GBen,'o',xx,yGBen);title('Energy');subplot(4,1,4); 
% plot(x,GBhom,'o',xx,yGBhom);title('Homogenity'); 
 
%����������� GB_con
%BT - ����� ����������� ��� ������� ��������������
for i=1:kz
    Res_con_GB(i)=0;
end;  
for i=1:kz
    if (GBcon_fp(i)>BT)
        Res_con_GB(i)=1;
    end;    
end 
ResCon_GB=Res_con_GB;
 
%����������� GB_cor
for i=1:kz
    Res_cor_GB(i)=0;
end;  
for i=1:kz
    if (GBcor_fp(i)>BT)
        Res_cor_GB(i)=1;
    end;    
end 
ResCor_GB=Res_cor_GB;
 
%����������� GB_en
for i=1:kz
    Res_en_GB(i)=0;
end;  
for i=1:kz
    if (GBen_fp(i)>BT)
        Res_en_GB(i)=1;
    end;    
end 
ResEn_GB=Res_en_GB;
 
%����������� GB_hom
for i=1:kz
    Res_hom_GB(i)=0;
end;   
for i=1:kz
    if (GBhom_fp(i)>BT)
        Res_hom_GB(i)=1;
    end;    
end 
ResHom_GB=Res_hom_GB;
 
%VOTING
%disp('Voting');
 
for i=1:kz
 Sum_res_vot_GB(i)=ResCon_GB(i)+ResCor_GB(i)+ResEn_GB(i)+ResHom_GB(i);
end
Sum1GB=Sum_res_vot_GB;
Sum1GBmax=max(Sum1GB);
for i=1:kz
    Voting_res_GB(i)=0;
   if (Sum1GB(i)==Sum1GBmax)   
        Voting_res_GB(i)=1;
   end   
end
Voting_result_GB=Voting_res_GB
 
%Voting global
for i=1:kz
 %Sum1global(i)=Voting_result_R(i)+Voting_result_G(i)+Voting_result_B(i)+Voting_result_RG(i)+Voting_result_RB(i)+Voting_result_GB(i);
 Sum1global(i)=Voting_result_R(i)+Voting_result_G(i)+Voting_result_B(i)+Voting_result_RG(i)+Voting_result_RB(i)+Voting_result_GB(i);
end
SSS=Sum1global
Sum1globalmax=max(Sum1global);
for i=1:kz
    Voting_global(i)=0;
    if (Sum1global(i)==max(Sum1global))   
        Voting_global(i)=1;
    end    
end
end
RRR=Voting_global%%%%%%%%%%%%%%%%%%%
% kb_=0;
% for i=1:kz
%     if (Voting_global(i)==1) 
%        kb_= kb_+2^i ;
%     end
% end  
% kb_in=kb_in;
% kb_out=kb_; 
% if (kb_in==kb_out)   
%   global_result=global_result+1;
% end  
% end
% GR(k)=global_result;
% GR_persent(k)=GR(k)/m*100;
% %end
% GGR=GR;
% GGRp=GR_persent;
% VVoting_result_R=Voting_result_R
% VVoting_result_G=Voting_result_G
% VVoting_result_B=Voting_result_B
% VVoting_result_RG=Voting_result_RG
% VVoting_result_RB=Voting_result_RB
% VVoting_result_GB=Voting_result_GB
 
close all;
clear;

