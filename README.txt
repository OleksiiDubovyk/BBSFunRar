trait6_v2.csv - Functional traits database for North American birds
Oleksii Dubovyk
Department of Biological Sciences, Old Dominion University, Norfolk, VA, USA
oadubovyk@gmail.com
v0 - 20 Sep 2021 [initial dataset]
v1 - 19 Apr 2023 [aligned with 2022 eBird taxonomy (columns 97-98)]

The columns in the dataset are coded as following:

1 name [character] : scientific name of taxa {1}

2 proj_id [integer] : project ID

3 et_id [integer] : ID connector to EltonTraits database {1}

4 hbw_id [integer] : ID connector to HBW/BirdLife taxonomic list {2}

5 ebd_id [integer] : ID connector of species to eBird taxonomy (v2019) {3}

6 ebd_sub [regular sequence, i.e., a:b = (a, a+1, a+2, ..., b-2, b-1, b)] : ID connector of subspecies to eBird taxonomy (v2019) {3}

7 ebd_mix [vector, i.e., a;b;c = (a, b, c)] : ID connector of slash/hybrid taxa to eBird taxonomy (v2019) {3}

8 bbs_id [integer] : ID connector of subspecies to BBS species list {4}

9 aou_id [integer] : ID connector of subspecies to AOU taxonomy {4}

10 aou_mix [vector, i.e., a;b;c = (a, b, c)] : ID connector of slash/hybrid/genus taxa to AOU taxonomy

11 hwi [numeric] : hand-wing index {5}, 100×(DK/LW) where LW is the wing length (between the carpal joint and the tip of the longest primary feather) and DK is Kipp’s distance (difference between LW and secondary length [i.e., from the carpal joint to the tip of the first secondary feather])

12 order [character] : taxonomic order {1}

13 family [character] : taxonomic family {1}

14 eng_name [character] : English taxa name {1}

15 synonyms [character, may be divided by ";"] : scientific synonyms {2, 3}

16 mlife [numeric] : maximum observed lifespan, years {6}

17 mis_mlife [binary] : is mlife data missing? (if "1", the mean of the sister taxa provided)

18 adsurvival [numeric, (0, 1)] : annual adult survival probability {6}

19 mis_adsrviv [binary] : is adsurvival data missing? (if "1", the mean of the sister taxa provided)

20 matage [numeric] : mean age of the first breeding {6}

21 parasi [numeric, (0, 1)] : nest parasitism (both intra- and interspecific) {7, 6}

22 egglow [integer] : minimum clutch size {7, 6}

23 eggupp [integer] : maximum clutch size {7, 6}

24 nsuc [numeric, (0, 1)] : mean nest success (proportion of breeding attempts that yield at least one fledgling) {6}

25 hatc [numeric, (0, 1)] : hatching probability (per one egg) {6}

26 fled [numeric, (0, 1)] : fledging probability (per one hatchling) {6}

27 ypp [numeric] : mean number of fledgling per nesting attempt {6}

28 suces [numeric, (0, 1)] : overall nesting success (i.e., probability that an egg laid in a nest will yield a fledgling)

29 mis_suces [binary] : is it possible to estimate suces based on the data available? (if "1", the mean of the sister taxa provided)

30 attem [numeric] : mean number of successful nesting attempts a year {6, 7}

31 dev [factor] : development at hatching {7, 6}:
	pre2 : precocial 2 - mobile, downy, follow parents, find food,
	pre3 : precocial 3 - mobile, downy, follow parents, are shown food by parents,
	pre4 : precocial 4 - mobile, downy, follow parents, being fed,
	semipre : semiprecocial - mobile, remain at rest, being fed,
	semialt1 : semialtricial 1 - immobile, downy, eyes open, being fed,
	semialt2 : semialtricial 2 - immobile, downy, eyes closed, being fed,
	alt : altricial - immobile, downless, eyes closed, being fed.
	Suggested distance matrix:
		pre2	pre3	pre4	semipre	semial1	semial2	alt
	pre2	0	0.1	0.15	0.3	0.5	0.6	0.9
	pre3		0	0.2	0.4	0.55	0.65	0.92
	pre4			0	0.45	0.6	0.7	0.94
	semipre				0	0.65	0.75	0.96
	semialt1				0	0.8	0.98
	semialt2					0	1
	alt							0

32 bmass [numeric] : mean biomass, g {7, 6}

33 naggr [factor] : nesting aggregation (applies to breeding season only) {6}:
	(1) solitary,
	(2) may stay in family groups or loose colonies,
	(3) strongly colonial.
	Suggested distance matrix:
		1	2	3
	1	0	0.5	1
	2		0	0.5
	3			0

34 brsys [factor] : breeding system {6, 7}:
	coop : cooperative, two or more females simultaneously breed in the same nest with or without non-breeding helper,
	polygam : polygynandry, two or more males mate with two or more females exclusively,
	promisc : promiscuity, males and females mate indiscriminately,
	lek : lekking, females survey the males’ competitive displays,
	polyandr : polyandry, one female mates with more than one male,
	polygyn : polygyny, one male mates with more than one female,
	monog : monogamy, one male mates with one female.
	Suggested distance matrix:
		coop	polygam	promisc	lek	polyand	polygyn	monog
	coop	0	0.25	0.4	0.6	0.8	0.8	0.7
	polygam		0	0.3	0.3	0.5	0.5	0.9
	promisc			0	0.25	0.4	0.4	1
	lek				0	0.5	0.5	0.9
	polyand					0	0.25	0.6
	polygyn						0	0.6
	monog							0

35 mis_bree [binary] : is data on mating system missing? (if "1", the most frequent among the sister taxa provided)

36 bpstart [mm-dd] : date of the beginning of breeding season {6}

37 bpstop [mm-dd] : date of the end of breeding season {6}

38 ndepen [numeric, (0, 1)] : nest dependency - to which extent the species relies on other species in terms of nesting site availability {6}

39 nest [factor] : nest type {7, 6}:
	(1) no : laying eggs on bare ground,
	(2) parasitism : does not require building a nest, but is dependent on other species’ nests presence,
	(3) scrape : a simple depression with a rim to prevent eggs from rolling,
	(4) crevice : a crack in a cliff or between rocks,
	(5) burrow : chamber in the end of a burrowed tunnel,
	(6) cavity : excavated or natural cavity in a limb or trunk of a tree,
	(7) platform : structure large enough for a bird to land,
	(8) saucer : shallow cup with a small rim built of small branches and other materials,
	(9) cup : hemispherical nest with a large rim,
	(10) spherical : enclosed with a small entrance,
	(11) chamber : spherical nest hidden within a substrate,
	(12) oven : a specific chamber with an explicit roof and small entrance,
	(13) gourd : a chamber made of clay and saliva, typically attached to a vertical surface,
	(14) pendant : an elongate sack suspended from a branch.
	Suggested distance matrix:
		1	2	3	4	5	6	7	8	9	10	11	12	13	14
	1	0	0.1	0.2	0.4	0.45	0.5	0.55	0.6	0.65	0.75	0.8	0.85	0.9	0.95
	2		0	0.25	0.35	0.4	0.45	0.55	0.6	0.65	0.75	0.8	0.85	0.9	0.95
	3			0	0.5	0.55	0.55	0.3	0.5	0.6	0.7	0.75	0.8	0.85	0.9
	4				0	0.15	0.25	0.6	0.6	0.6	0.8	0.8	0.9	0.9	0.9
	5					0	0.3	0.6	0.6	0.6	0.8	0.8	0.8	0.9	0.9
	6						0	0.6	0.5	0.4	0.4	0.35	0.35	0.7	0.7
	7							0	0.2	0.3	0.6	0.6	0.7	0.8	0.9
	8								0	0.15	0.5	0.7	0.8	0.8	0.9
	9									0	0.4	0.5	0.6	0.7	0.8
	10										0	0.5	0.5	0.6	0.6
	11											0	0.2	0.5	0.6
	12												0	0.1	0.6
	13													0	0.6
	14														0

40...51 Nest substrate group {6, 7}

40 nsbank [%] : bank
41 nsground [%] : ground
42 nsgrass [%] : grass
43 nsclif [%] : cliff
44 nsbuild [%] : building, artificial structures (except nestboxes)
45 nsshru [%] : shrubs
46 nsdeci [%] : deciduous trees
47 nsconi [%] : coniferous trees
48 nssnag [%] : snags, dead limbs
49 sncact [%] : cacti
50 nstang [%] : tangle
51 nsfloat [%] : floating

52...61 Foraging substrate group {1, 6, 7}

52 fsmud [%] : mud
53 fswatb [%] : below water level
54 fswata [%] : around water level
55 fstimb [%] : timber
56 fsgroun [%] : ground
57 fsunder [%] : understory
58 fsmidhigh [%] : middle to high tree parts
59 fscanopy [%] : canopy
60 fsaerial [%] : air
61 fsdump [%] : dumps

62 fpnoct [binary] : is foraging at night? {7}

63 fpdiur [binary] : is foraging at day? {7}

64 klepto [numeric, (0, 1)] : kleptoparasitism {7}

65 fc_categ [factor] : prevalent diet category
	FruiNect : fruits and nectar,
	Invertebrate : invertebrates,
	Omnivore : omnivore,
	PlantSeed : plants and seeds,
	VertFishScav : vertebates, fish, or scavenging.
	Suggested distance matrix:
			FruiNect	Invertebrate	Omnivore	PlantSeed	VertFishScav
	FruiNect	0		0.6		0.4		0.2		0.8
	Invertebrate			0		0.5		0.7		0.2
	Omnivore					0		0.5		0.4
	PlantSeed							0		0.3
	VertFishScav									0

66-76 Foraging categories {1, 6, 7}

66 fcinvert [%] : invertebrates
67 fcvend [%] : endothermic (warm-blooded) vertebrates
68 fcvect [%] : cold-blooded vertebrates
69 fcfish [%] : fish
70 fcunk [%] : unknown vertebrates
71 fcscav [%] : carcasses
72 fcfruit [%] : fruits
73 fcnect [%] : nectar
74 fcseed [%] : seeds
75 fcgree [%] : green parts of plants
76 fcleft [%] : leftovers

77-95 Foraging method {6}

77 fmdig [%] : digging
78 fmgrgl [%] : ground glean
79 fmfogl [%] : foliage glean
80 fmbagl [%] : bark glean
81 fmhogl [%] : gleaning while hovering
82 fmhopo [%] : hover and pouncing
83 fmhawk [%] : hawking
84 fmaero [%] : aerial foliage
85 fmapur [%] : aerial pursuit
86 fmswoo [%] : swoops
87 fmhipa [%] : high patrol
88 fmlopa [%] : low patrol
89 fmhidi [%] : high dives
90 fmskim [%] : skimming
91 fmsdiv [%] : surface dives
92 fmsdip [%] : surface dips
93 fmdabb [%] : dabbling
94 fmstal [%] : stalking
95 fmprob [%] : probing

96 pelagic [binary] : is a pelagic taxa?

97 code [character] : code ID in eBird taxonomy (v2019) {3}

98 ebd_id2022 [integer] : ID connector of species to eBird taxonomy (v2022) {3}

99 ebd_id2023 [integer] : ID connector of species to eBird taxonomy (v2023) {3}


References:
1. Wilman, H., J. Belmaker, J. Simpson, C. de la Rosa, M.M. Rivadeneira, and W. Jetz. 2014. EltonTraits 1.0: Species-level foraging attributes of the world's birds and mammals. Ecology 95:2027. https://doi.org/10.1890/13-1917.1
2. HBW, and BirdLife International. 2018. Handbook of the birds of the world and BirdLife International digital checklist of the birds of the world. Version 3. http://datazone.birdlife.org/userfiles/file/Species/Taxonomy/HBW-BirdLife_Checklist_v3_Nov18.zip
3. Clements, J. F., T. S. Schulenberg, M. J. Iliff, S. M. Billerman, T. A. Fredericks, J. A. Gerbracht, D. Lepage, B. L. Sullivan, and C. L. Wood. 2020. The eBird/Clements checklist of Birds of the World: v2020. https://www.birds.cornell.edu/clementschecklist/download/
4. Pardieck, K.L., D.J. Ziolkowski Jr., M. Lutmerding, V.I. Aponte, and M.-A.R. Hudson. 2020. North American breeding bird survey dataset 1966 - 2019: U.S. Geological Survey data release. https://doi.org/10.5066/P9J6QUF6
5. Sheard, C., M.H.C. Neate-Clegg, N. Alioravainen, S.E.I. Jones, C. Vincent, H.E.A. MacGregor, T.P. Bregman, S. Claramunt, and J.A. Tobias. 2020. Ecological drivers of global gradients in avian dispersal inferred from wing morphology. Nature Communications 11:2463. https://doi.org/10.1038/s41467-020-16313-6
6. Birds of the World (S. M. Billerman, B. K. Keeney, P. G. Rodewald, and T. S. Schulenberg, Editors). Cornell Laboratory of Ornithology, Ithaca, NY, USA. https://birdsoftheworld.org/bow/home
7. Ehrlich, P.R., D.S. Dobkin, and D. Wheye. The birder's handbook: a field guide to the natural history of North American birds. Simon & Schuster, New York, New York, USA.
