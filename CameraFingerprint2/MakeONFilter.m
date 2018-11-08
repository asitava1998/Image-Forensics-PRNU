function f = MakeONFilter(Type,Par)
% MakeONFilter -- Generate Orthonormal QMF Filter for Wavelet Transform
%  Usage
%    qmf = MakeONFilter(Type,Par)
%  Inputs
%    Type   string, 'Haar', 'Beylkin', 'Coiflet', 'Daubechies',
%           'Symmlet', 'Vaidyanathan','Battle'
%    Par    integer, it is a parameter related to the support and vanishing
%           moments of the wavelets, explained below for each wavelet.
%
% Outputs
%    qmf    quadrature mirror filter
%
%  Description
%    The Haar filter (which could be considered a Daubechies-2) was the
%    first wavelet, though not called as such, and is discontinuous.
%
%    The Beylkin filter places roots for the frequency response function
%    close to the Nyquist frequency on the real axis.
%
%    The Coiflet filters are designed to give both the mother and father
%    wavelets 2*Par vanishing moments; here Par may be one of 1,2,3,4 or 5.
%
%    The Daubechies filters are minimal phase filters that generate wavelets
%    which have a minimal support for a given number of vanishing moments.
%    They are indexed by their length, Par, which may be one of
%    4,6,8,10,12,14,16,18 or 20. The number of vanishing moments is par/2.
%
%    Symmlets are also wavelets within a minimum size support for a given 
%    number of vanishing moments, but they are as symmetrical as possible,
%    as opposed to the Daubechies filters which are highly asymmetrical.
%    They are indexed by Par, which specifies the number of vanishing
%    moments and is equal to half the size of the support. It ranges 
%    from 4 to 10.
%
%    The Vaidyanathan filter gives an exact reconstruction, but does not
%    satisfy any moment condition.  The filter has been optimized for
%    speech coding.
%
%    The Battle-Lemarie filter generate spline orthogonal wavelet basis.
%    The parameter Par gives the degree of the spline. The number of 
%    vanishing moments is Par+1.
%
%  See Also
%    FWT_PO, IWT_PO, FWT2_PO, IWT2_PO, WPAnalysis
%
%  References
%    The books by Daubechies and Wickerhauser.
%

if strcmp(Type,'Haar'),
	f = [1 1] ./ sqrt(2);
end

if strcmp(Type,'Beylkin'),
	f = [	.099305765374	.424215360813	.699825214057	...
			.449718251149	-.110927598348	-.264497231446	...
			.026900308804	.155538731877	-.017520746267	...
			-.088543630623	.019679866044	.042916387274	...
			-.017460408696	-.014365807969	.010040411845	...
			.001484234782	-.002736031626	.000640485329	];
end

if strcmp(Type,'Coiflet'),
	if Par==1,
		f = [	.038580777748	-.126969125396	-.077161555496	...
				.607491641386	.745687558934	.226584265197	];
	end
	if Par==2,
		f = [	.016387336463	-.041464936782	-.067372554722	...
				.386110066823	.812723635450	.417005184424	...
				-.076488599078	-.059434418646	.023680171947	...
				.005611434819	-.001823208871	-.000720549445	];
	end
	if Par==3,
		f = [	-.003793512864	.007782596426	.023452696142	...
				-.065771911281	-.061123390003	.405176902410	...
				.793777222626	.428483476378	-.071799821619	...
				-.082301927106	.034555027573	.015880544864	...
				-.009007976137	-.002574517688	.001117518771	...
				.000466216960	-.000070983303	-.000034599773	];
	end
	if Par==4,
		f = [	.000892313668	-.001629492013	-.007346166328	...
				.016068943964	.026682300156	-.081266699680	...
				-.056077313316	.415308407030	.782238930920	...
				.434386056491	-.066627474263	-.096220442034	...
				.039334427123	.025082261845	-.015211731527	...
				-.005658286686	.003751436157	.001266561929	...
				-.000589020757	-.000259974552	.000062339034	...
				.000031229876	-.000003259680	-.000001784985	];
	end
	if Par==5,
		f = [	-.000212080863	.000358589677	.002178236305	...
				-.004159358782	-.010131117538	.023408156762	...
				.028168029062	-.091920010549	-.052043163216	...
				.421566206729	.774289603740	.437991626228	...
				-.062035963906	-.105574208706	.041289208741	...
				.032683574283	-.019761779012	-.009164231153	...
				.006764185419	.002433373209	-.001662863769	...
				-.000638131296	.000302259520	.000140541149	...
				-.000041340484	-.000021315014	.000003734597	...
				.000002063806	-.000000167408	-.000000095158	];
	end
end

if strcmp(Type,'Daubechies'),
	if Par==4,  
		f = [	.482962913145	.836516303738	...
				.224143868042	-.129409522551	];
	end
	if Par==6, 
		f = [	.332670552950	.806891509311	...
				.459877502118	-.135011020010	...
				-.085441273882	.035226291882	];
	end
	if Par==8,
		f = [ 	.230377813309	.714846570553	...
				.630880767930	-.027983769417	...
				-.187034811719	.030841381836	...
				.032883011667	-.010597401785	];
	end
	if Par==10,
		f = [	.160102397974	.603829269797	.724308528438	...
				.138428145901	-.242294887066	-.032244869585	...
				.077571493840	-.006241490213	-.012580751999	...
				.003335725285									];
	end
	if Par==12,
		f = [	.111540743350	.494623890398	.751133908021	...
				.315250351709	-.226264693965	-.129766867567	...
				.097501605587	.027522865530	-.031582039317	...
				.000553842201	.004777257511	-.001077301085	];
	end
	if Par==14,
		f = [	.077852054085	.396539319482	.729132090846	...
				.469782287405	-.143906003929	-.224036184994	...
				.071309219267	.080612609151	-.038029936935	...
				-.016574541631	.012550998556	.000429577973	...
				-.001801640704	.000353713800					];
	end
	if Par==16,
		f = [	.054415842243	.312871590914	.675630736297	...
				.585354683654	-.015829105256	-.284015542962	...
				.000472484574	.128747426620	-.017369301002	...
				-.044088253931	.013981027917	.008746094047	...
				-.004870352993	-.000391740373	.000675449406	...
				-.000117476784									];
	end
	if Par==18,
		f = [	.038077947364	.243834674613	.604823123690	...
				.657288078051	.133197385825	-.293273783279	...
				-.096840783223	.148540749338	.030725681479	...
				-.067632829061	.000250947115	.022361662124	...
				-.004723204758	-.004281503682	.001847646883	...
				.000230385764	-.000251963189	.000039347320	];
	end
	if Par==20,
		f = [	.026670057901	.188176800078	.527201188932	...
				.688459039454	.281172343661	-.249846424327	...
				-.195946274377	.127369340336	.093057364604	...
				-.071394147166	-.029457536822	.033212674059	...
				.003606553567	-.010733175483	.001395351747	...
				.001992405295	-.000685856695	-.000116466855	...
				.000093588670	-.000013264203					];
	end
end

if strcmp(Type,'Symmlet'),
	if Par==4,
		f = [	-.107148901418	-.041910965125	.703739068656	...
				1.136658243408	.421234534204	-.140317624179	...
				-.017824701442	.045570345896					];
	end
	if Par==5,
		f = [	.038654795955	.041746864422	-.055344186117	...
				.281990696854	1.023052966894	.896581648380	...
				.023478923136	-.247951362613	-.029842499869	...
				.027632152958									];
	end
	if Par==6,  
		f = [	.021784700327	.004936612372	-.166863215412	...
				-.068323121587	.694457972958	1.113892783926	...
				.477904371333	-.102724969862	-.029783751299	...
				.063250562660	.002499922093	-.011031867509	];
	end
	if Par==7,
		f = [	.003792658534	-.001481225915	-.017870431651	...
				.043155452582	.096014767936	-.070078291222	...
				.024665659489	.758162601964	1.085782709814	...
				.408183939725	-.198056706807	-.152463871896	...
				.005671342686	.014521394762					];
	end
	if Par==8, 
		f = [	.002672793393	-.000428394300	-.021145686528	...
				.005386388754	.069490465911	-.038493521263	...
				-.073462508761	.515398670374	1.099106630537	...
				.680745347190	-.086653615406	-.202648655286	...
				.010758611751	.044823623042	-.000766690896	... 
				-.004783458512									];
	end
	if Par==9,
		f = [	.001512487309	-.000669141509	-.014515578553	...
				.012528896242	.087791251554	-.025786445930	...
				-.270893783503	.049882830959	.873048407349	...
				1.015259790832	.337658923602	-.077172161097	...
				.000825140929	.042744433602	-.016303351226	...
				-.018769396836	.000876502539	.001981193736	];
	end
	if Par==10,
		f = [	.001089170447	.000135245020	-.012220642630	...
				-.002072363923	.064950924579	.016418869426	...
				-.225558972234	-.100240215031	.667071338154	...
				1.088251530500	.542813011213	-.050256540092	...
				-.045240772218	.070703567550	.008152816799	...
				-.028786231926	-.001137535314	.006495728375	...
				.000080661204	-.000649589896					];
	end
end
	
if strcmp(Type,'Vaidyanathan'),
	f = [	-.000062906118	.000343631905	-.000453956620	...
			-.000944897136	.002843834547	.000708137504	...
			-.008839103409	.003153847056	.019687215010	...
			-.014853448005	-.035470398607	.038742619293	...
			.055892523691	-.077709750902	-.083928884366	...
			.131971661417	.135084227129	-.194450471766	...
			-.263494802488	.201612161775	.635601059872	...
			.572797793211	.250184129505	.045799334111		];
end

if strcmp(Type,'Battle'),
	if Par == 1,
           g = [0.578163    0.280931   -0.0488618   -0.0367309 ...
                0.012003    0.00706442 -0.00274588 -0.00155701 ...
                0.000652922 0.000361781 -0.000158601 -0.0000867523
	    ];
	end

	if Par == 3,
        
	g = [0.541736    0.30683    -0.035498    -0.0778079 ...
             0.0226846   0.0297468     -0.0121455 -0.0127154 ...
             0.00614143 0.00579932    -0.00307863 -0.00274529 ...
             0.00154624 0.00133086 -0.000780468 -0.00065562 ...
	     0.000395946 0.000326749 -0.000201818 -0.000164264 ...
             0.000103307
	    ];
	end

	if Par == 5,
 	g = [0.528374    0.312869    -0.0261771   -0.0914068 ...
             0.0208414    0.0433544 -0.0148537 -0.0229951  ...
             0.00990635 0.0128754    -0.00639886 -0.00746848 ...
             0.00407882 0.00444002 -0.00258816    -0.00268646 ...
             0.00164132 0.00164659 -0.00104207 -0.00101912 ...
	    0.000662836 0.000635563 -0.000422485 -0.000398759 ...
	    0.000269842 0.000251419 -0.000172685 -0.000159168 ...
	    0.000110709 0.000101113
	    ];
	end
        l = length(g);
        f = zeros(1,2*l-1);
        f(l:2*l-1) = g;
        f(1:l-1) = reverse(g(2:l));
end

f = f ./ norm(f);

% 
% Copyright (c) 1993-5. Jonathan Buckheit and David Donoho
%     
    
    
%   
% Part of WaveLab Version 802
% Built Sunday, October 3, 1999 8:52:27 AM
% This is Copyrighted Material
% For Copying permissions see COPYING.m
% Comments? e-mail wavelab@stat.stanford.edu
%   
    
