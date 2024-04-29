<!-- #include file="i_top.asp" -->
<!-- #include file="i_Loftwick.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
PriorPage = "default.asp"
'NextPage = ToSaveATownLink2
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="UTF-8">
	<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
	<title>D&amp;D - Loftwick</title>
	<!-- #include file="i_head.asp" -->
</head>

<body translate="no" >
	<div id="wrap">
		<!-- #include file="i_header.asp" -->
		<!-- #include file="i_menu.asp" -->

		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Key Points</h1>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<ul>
					<li><%=The_High_Crags%> - Rough, rocky outcroppings at the edge of the Jotens Mountains</li>
					<li><%=The_Ur_Un_Valley%> - The valley to the east of Loftwick</li>
					<li><%=Loftwick%> - Capital of the Yeomanry</li>
					<li><%=Katz_Castle%> - Keep of Lord Orin - a castle on a hilltop overlooking the <%=The_Ur_Un_Valley%></li>
					<li><%=Marksburg%> - Keep of Her Ladyship Hallisa Kornwell - a castle on a hilltop overlooking the <%=The_Ur_Un_Valley%></li>
					<li><%=The_Eagles_Nest_Loftwick%> - an outpost in <%=The_High_Crags%> overlooking the <%=The_Ur_Un_Valley%></li>
					<li><%=The_New_Road%> - a well maintained dirt road connecting <%=Loftwick%> to the East of the Yeomanry</li>
					<li><%=Raveslan%> - Village of Raveslan</li>
					<li><%=The_Reslya_River%> - A minor river in the Ur-Un Valley</li>
					<li><%=Kendeen_River%> - A major river flowing from the Crystalmist Mountains</li>
					<li><%=Wisk_River%> - A major river flowing from the Jotens and Crystalmist Mountains</li>
					<li>Farmland - much of the open spaces are populated with peasant farmland, all working to support <%=Loftwick%></li>
					<li>Mines - there are multiple mining communities in <%=The_High_Crags%></li>
				</ul>
			</div>
			<hr class="orange-border bottom" />
		</div>



		<div class="stat-block-spacer"></div>



		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="map-placement">
				<a name="<%=HexPage%>"></a>
				<img src="./Images/Maps/F160-246_Loftwick.png" title="" class="right mapper" usemap="#hexMapper" />
<%
North			= SetHyperlink("")
NorthEast	= SetHyperlink(DarbyHex)
SouthEast	= SetHyperlink("")
South			= SetHyperlink("")
SouthWest	= SetHyperlink("")
NorthWest	= SetHyperlink("")
%>
						<!-- https://www.image-map.net/ -->
				<map name="hexMapper">
<!-- #include file="i_hexMapper.asp" -->
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Loftwick" title="Loftwick" href="" coords="87,399,18" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Katz, Home of Lord Orin" title="Katz, Home of Lord Orin" href="" coords="329,376,8" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Marksburg, Home of Her Ladyship Hallisa Kornwell" title="Marksburg, Home of Her Ladyship Hallisa Kornwell" href="" coords="428,454,10" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="The Eagles's Nest" title="The Eagles's Nest" href="" coords="462,221,8" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Raveslan" title="Raveslan" href="" coords="662,208,6" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="TBD" title="TBD" href="" coords="290,563,9" shape="circle">



<%HoverColor = "000000"%>
<area shape="poly" class="noborder icolor<%=HoverColor%>" coords="0,0, 500,0, 500,500, 0,500" href="" title="Hover UNDER image!">

				</map>
			</div>
			<hr class="orange-border bottom" />
		</div>



		<div class="stat-block-spacer"></div>


		<a name="Loftwick"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Loftwick</h1>
					<h2>The capital of the Yeomanry League</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<p>
					<img src="./images/Places/Loftwick/Loftwick_Gate.png" title="Loftwick gate" class="left" width="890px" height="500px" />
					At the foothills of <%=The_High_Crags%> sits <%=Loftwick%>, the capital city of the Yeomanry League.
					<img src="./images/Heraldry/Yeomanry.png" title="Crest of the Yeomanry" class="right" width="100px" height="100px" />
					It is a large walled city of aprox. 20,000 souls, built at the junction of <%=Wisk_River%> from the North West (split in half a few miles north of the city), <%=Kendeen_River%> from the South West and the minor River U'utham, all of which dump out into <%=Sweetwater_Lake%>.
					The walls range for 40 to 50 feet high with guard towers at regular intervals.
					There are 7 fortified gatehouses granting entrance to the city, each with heavy metal portcullis and massive re-enforced doors.
					Yeoman regulars are always visible along the walls and towers.
					Large red banners hang from the walls and towers bearing the crest of the Yeomanry, a red background with a white shield bearing three arrows pointing down and meeting in the bottom center.
					At each of the gates to the city is a large banner that reads:

					<blockquote style="width: 170px; margin-left: 300px;">
						"Service means Citizenship!<br>
						Join the Militiamen Today!"
					</blockquote>

				</p>
				<br>
				<p>
					<img src="./images/People/NPCs/Loftwick/Crispin_Redwell.png" title="Lord Crispin Redwell, elected ruler of the Yeomanry" class="left" width="200px" height="200px" />
					<img src="./images/People/NPCs/Loftwick/Lord_Jubal.png" title="Lord Jubal, Mayor of Loftwick" class="right" width="200px" height="200px"/>

					<%=Loftwick%> has two rulers, <%=Crispin_Redwell%> (ruler of the Yeomanry) and <%=Lord_Jubal%> (the mayor of Loftwick), both elected positions.
					In general, <%=Lord_Jubal%> and the city council run the city, but <%=Crispin_Redwell%> does have the authority to override their decisions.
					Both men have long, extensive, distinguished prior careers in the Yeomanry Army.
				</p>
				<p>
					The city streets are regularly patrolled by members of the city malitia/Yeoman regulars, both day and night.
					However, <%=Loftwick%> is a big city and there is always criminal activity.
					There is a well established Thieves Guild whose location remains a mystery to law enforcement.
				</p>
				<p>
					There are over a dozen parks scattered about the city, a few of them even outside the city walls.
					Most are open to the public so long as the visitors behave themselves, Embassy Island being an obvious exception.
				</p>
				<p>
					The primary source of trade with the rest of the world in <%=Loftwick%>, and the Yeomanry in general, is gems!
					The Yeomanry has an abundance of gems, and <%=The_High_Crags%> and <%=The_Crystalmist_Mountains%> are a vast resource of precious stones.
					Trade is heavy with the Dwarves in the <%=The_High_Crags%>, plus the trading of "Steel Glass" with a mysterious souce rumored to be deep in <%=The_Crystalmist_Mountains%>.
				</p>

				<div>
					<img src="./images/Places/Loftwick/Loftwick_Normal.jpg" class="mapper" title="" width="800px" height="957px" usemap="#LoftwickMap"/>
				</div>

				<map name="LoftwickMap">
<!-- https://www.image-map.net/ -->
<area target="" class="noborder icolor00ff00" <%=GetAllInfo("R1_UROVANGIAN", "ath")%> coords="370,469,410,529,423,554,457,604,454,617,469,628,486,649,482,691,463,699,413,659,386,634,364,622,354,602,349,607,334,591,301,572,283,567,280,553,286,546,292,547" shape="poly">
<area target="" <%=GetAllInfo("R2_HABADOCK", "ath")%> coords="223,455,236,429,253,383,262,395,273,405,279,422,288,432,294,435,301,445,314,445,328,453,341,468,368,468,295,544,288,545,251,522,231,536,200,469" shape="poly">
<area target="" <%=GetAllInfo("R3_DREODAE", "ath")%> coords="451,418,460,423,455,432,471,442,526,460,522,468,514,465,487,496,493,501,491,530,451,553,441,550,439,528,448,516,415,498,409,487,392,474,391,463,402,440,424,428" shape="poly">
<area target="" <%=GetAllInfo("R4_EMBASSY", "ath")%> coords="358,431,27" shape="circle">
<area target="" <%=GetAllInfo("R5_SANCTIA", "ath")%> coords="490,363,483,316,427,305,408,277,367,289,318,283,272,306,259,341,238,356,248,368,270,377,274,391,283,393,287,411,311,421,327,408,338,396,361,387,382,400,405,413,423,406,445,376,463,367,479,373" shape="poly">
<area target="" <%=GetAllInfo("R6_ORICHALCUM", "ath")%> coords="279,554,286,546,250,522,232,539,200,468,158,494,160,516,164,566,169,573,172,589,160,604,172,613,202,623,240,610,255,577,268,571,278,565" shape="poly">
<area target="" <%=GetAllInfo("R7_COPSIC", "ath")%> coords="502,364,510,315,532,310,536,298,565,289,575,310,563,335,577,379,585,389,609,436,616,472,604,480,576,481,529,461,473,443,455,432,462,424,480,430,498,415,511,403,526,383,507,371" shape="poly">
<area target="" <%=GetAllInfo("R8_GORRO", "ath")%> coords="616,477,620,497,634,505,636,549,625,564,625,573,584,577,576,561,542,529,493,514,492,502,485,497,516,466,522,469,526,461,572,480" shape="poly">
<area target="" <%=GetAllInfo("R9_UPPER_UTHER", "ath")%> coords="272,580,286,589,303,587,323,596,335,606,343,614,356,621,361,631,352,638,353,652,350,666,354,671,352,676,361,682,355,689,290,701,288,708,282,729,274,734,242,709,219,722,217,715,223,700,214,688,211,679,218,661,217,651,226,637,237,637,259,652,280,652,280,646,253,628,248,613,258,608" shape="poly">
<area target="" <%=GetAllInfo("R10_LOWER_UTHER", "ath")%> coords="219,724,241,711,274,735,284,730,287,707,292,702,356,690,363,681,373,687,379,698,391,698,406,714,403,729,403,742,407,753,401,771,386,771,370,783,359,777,351,783,339,777,328,785,327,772,317,763,304,762,295,770,280,768,275,759,261,758,244,751,230,741,220,732" shape="poly">
<area target="" <%=GetAllInfo("R11_PINION", "ath")%> coords="490,800,479,808,447,773,430,754,412,745,413,703,409,685,399,679,395,668,416,673,424,690,433,694,438,706,485,720,495,690,490,655,494,650,497,650,517,657,523,665" shape="poly">
<area target="" <%=GetAllInfo("R12_ISAMBARD", "ath")%> coords="451,556,456,568,488,609,499,613,517,624,528,620,531,578,582,575,576,562,542,529,493,515,490,533" shape="poly">
<area target="" <%=GetAllInfo("R13_SMOGTOWN", "ath")%> coords="625,574, 586,577, 532,580, 528,622, 520,626, 505,632,500,640,520,666, 558,690, 579,684, 595,675, 606,661, 628,632, 622,615, 629,606,626,596" shape="poly">
<area target="" <%=GetAllInfo("R14_COMBINE", "ath")%> coords="252,380,223,453,156,491,151,479,149,471,135,446,135,426,147,399,181,383,209,377,213,368,230,359" shape="poly">
<area target="" <%=GetAllInfo("R15_SHAELTOWN", "ath")%> coords="151,616,195,637,193,647,199,656,201,672,205,691,198,699,205,715,205,721,184,723,176,697,142,710,122,695,121,672,127,661,126,647" shape="poly">
<area target="" <%=GetAllInfo("R16_MEADOWS", "ath")%> coords="202,723,187,726,181,722,178,698,140,713,123,697,123,715,106,737,118,750,134,758,134,767,142,772,151,785,166,788,172,784,179,788,186,801,196,801,205,792,228,785,239,786,254,777,259,770,225,756,211,743" shape="poly">
<area target="" <%=GetAllInfo("R17_SCORNWALL_E", "ath")%> coords="586,340,573,336,565,340,577,373,588,390,609,431,619,493,633,504,638,549,626,564,629,606,624,618,628,631,640,622,654,590,659,554,653,522,709,495,697,470,680,453,646,444,624,430,620,401,626,366,610,354,592,352" shape="poly">
<area target="" <%=GetAllInfo("R18_SCORNWALL_W", "ath")%> coords="158,604,172,589,170,571,163,564,159,497,147,471,131,446,136,422,113,424,70,410,60,442,79,456,97,450,113,466,111,475,119,488,130,522,125,532,99,526,56,533,60,541,79,541,101,552,113,568,127,586,138,596" shape="poly">
<area target="" <%=GetAllInfo("R19_SCORNWALL_NW", "ath")%> coords="138,418,147,398,184,379,211,375,211,368,230,358,222,354,193,357,178,348,181,340,163,321,170,302,179,297,185,280,198,271,202,261,196,246,187,240,181,263,151,273,132,334,127,345,118,363,117,372,106,381,98,394,83,390,70,381,64,395,72,408,114,424" shape="poly">
<area target="" <%=GetAllInfo("R20_SCORNWALL_N", "ath")%> coords="260,176,302,195,329,198,341,189,377,206,401,237,489,279,485,315,429,307,410,275,368,286,353,288,317,282,270,301,267,321,255,342,236,356,221,335,213,331,213,321,229,299,230,286,219,261,238,252,255,222,251,190" shape="poly">
<area target="" <%=GetAllInfo("R21_SCORNWALL_S", "ath")%> coords="106,737,123,715,121,670,128,661,124,647,151,614,127,601,100,564,92,574,105,601,99,619,109,634,107,645,97,652,84,669,77,685,61,699,61,720,67,728,84,734" shape="poly">
<area target="" <%=GetAllInfo("R22_SALACUS", "ath")%> coords="769,672,751,673,724,649,708,645,688,645,682,636,665,629,658,629,641,624,644,611,655,591,660,554, 654,522,708,496,708,489,739,488,771,491" shape="poly">
<area target="" <%=GetAllInfo("R23_FENNLOVE", "ath")%> coords="532,125,513,101,433,99,425,92,378,90,372,94,347,102,322,103,305,100,280,91,271,77,259,82,241,82,227,68,221,57,222,42,223,31,192,31,195,50,181,44,166,46,181,91,157,142,215,260,238,250,256,222,252,190,259,173,298,193,327,197,337,188,379,206,394,225,415,232,421,238,466,223,473,201,479,186,478,178,481,171,473,145,479,141,490,133,499,138,514,139,526,133" shape="poly">
<area target="" <%=GetAllInfo("R24_HOYRAAM", "ath")%> coords="49,169,69,195,74,202,103,195,122,204,135,210,152,204,163,209,184,236,179,254,172,261,155,266,140,269,127,288,122,310,127,320,124,341,115,365,101,368,97,383,83,381,77,374,54,376,46,385,33,387,33,186" shape="poly">
<area target="" <%=GetAllInfo("R25_DACC", "ath")%> coords="769,413,757,417,751,418,747,431,733,435,724,446,704,450,699,458,693,456,684,434,690,411,671,412,662,426,633,402,626,390,630,371,665,341,658,320,645,311,636,314,631,327,627,337,616,345,621,351,615,356,609,347,595,346,590,347,586,339,586,320,607,312,622,308,628,292,622,286,622,278,635,278,646,258,657,262,662,245,649,241,643,248,634,248,629,236,625,244,616,241,608,244,613,252,604,261,561,259,552,252,551,243,557,231,544,210,544,199,545,187,550,169,550,156,556,141,565,147,583,126,598,113,556,99,553,87,577,51,601,59,614,32,772,30" shape="poly">
<area target="" <%=GetAllInfo("R26_FREE", "ath")%> coords="31,685,54,689,58,666,74,668,97,649,108,638,101,622,91,630,80,616,88,586,89,574,97,562,79,550,64,550,47,559,30,552" shape="poly">
<area target="" <%=GetAllInfo("R27_GREYGWYNN", "ath")%> coords="31,138,51,157,68,174,78,191,103,188,124,195,145,197,157,182,155,162,144,141,154,115,166,96,157,87,152,84,140,51,142,42,140,32,31,31" shape="poly">
<area target="" <%=GetAllInfo("R28_PARADE", "ath")%>  coords="479,279,493,301,487,315,527,309,535,297,565,286,578,309,567,332,586,336,588,328,586,317,610,309,618,311,623,295,620,288,621,276,633,276,646,258,637,248,629,236,622,246,616,243,612,250,612,256,598,260,570,261,561,258,551,252,549,243,553,231,544,210,544,192,552,168,549,156,554,138,543,132,520,145,487,145,480,168,475,180,478,199,469,201,466,213,464,220,448,228,436,236,426,240,415,231,387,224,374,228,388,238,402,237,424,261,447,267,456,274,465,278,472,271" shape="poly">
				</map>

				<a href="./images/Places/Loftwick/Loftwick_Big.jpg" target="_blank">Large map</a>

				<hr class="normal">

				<p>
					Important characters and places within <%=Loftwick%>.
				</p>

			</div>
			<hr class="orange-border bottom" />
		</div>



		<div class="stat-block-spacer"></div>



		<a name="The_Ur_Un_Valley"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>The Ur-Un Valley</h1>
					<h2>Large valley to the east of <%=Loftwick%>.</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./images/Places/Ur_Un_Valley.jpg" title="The Ur-Un Valley" class="left" width="487px" height="640px"/>

				<div class="property-block">
					<h4>Description</h4>
					<p>
						This sprawling valley east of <%=Loftwick%> if filled with farmlands, all dedicated to feeding the capital of The Yeomanry.
						Even in Summer, snow covers the distant mountain tops, many of wich poke up into the clouds.
						<%=The_New_Road%> passes through this valley with several castles keeping watch over the rural pesants.
						To the north, <%=The_High_Crags%> form a natural barrier between the valley and the dwarves, while to the south, a much smaller range of tree covered hills mark.
						Many small streams flow from these higher elevations, but none significant enought to form a noteworthy river.
					</p>
					<div style="height: 460px;"></div>
				</div>
			</div>

			<hr class="orange-border bottom" />
		</div>



		<div class="stat-block-spacer"></div>



		<a name="The_Eagles_Nest"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>The Eagle's Nest</h1>
					<h2>A small fortress overlooking the Ur-Un Valley.</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>
				<img src="./images/Places/Eagles_Nest.jpg" title="The Eagle's Nest" class="right" width="315px" height="472px"/>
				<div class="property-block">
					<h4>Description</h4>
					<p>
						Located high atop one of the many clifftops in <%=The_High_Crags%> is The Eagle's Nest.
						This is a lightly manned watch post that oversees much of the <%=The_Ur_Un_Valley%> to the east of <%=Loftwick%>.
						Though lightly manned, it is extremely defendable.
						A narrow load leads down a spine in the mountain range, ultimately connecting to <%=The_New_Road%>, and thus to <%=Loftwick%>.
					</p>
					<p>
						In times of danger, a large, smoky fire can be lit to send a warning to all who can see the peak.
						While <%=Loftwick%> is too far away to see one of these signal fires, the keeps of Lord Orin and Her Ladyship Hallisa Kornwell are not and they can rally their forces and send a warning to the capital.
					</p>
					<div style="height: 330px;"></div>
				</div>
			</div>

			<hr class="orange-border bottom" />
		</div>


		<div class="stat-block-spacer"></div>



		<a name="Katz"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Castle Katz</h1>
					<h2>Home of Lord Orin.</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>
				<img src="./images/Places/Katz_Castle.jpg" title="Castle Katz" class="left" width="600px" height="450px"/>
				<div class="property-block">
					<h4>Description</h4>
					<p>
						On a large tree-coverred hill on the northern side of <%=The_Ur_Un_Valley%>, east of <%=Loftwick%>, is Castle Katz, home of Lor Orin.
					</p>
					<p>
						In times of danger, a large, smoky fire can be lit to send a warning to all who can see the hilltop.
						While <%=Loftwick%> is too far away to see one of these signal fires, <%=The_Eagles_Nest%> and the keep of Her Ladyship Hallisa Kornwell are not and Kornwell can rally her forces and send a warning to the capital.
					</p>
					<div style="height: 260px;"></div>
				</div>
			</div>

			<hr class="orange-border bottom" />
		</div>


		<div class="stat-block-spacer"></div>


		<a name="Marksburg"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Castle Marksburg</h1>
					<h2>Home of Her Ladyship Hallisa Kornwell</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./images/Places/Marksburg_Castle01.jpg" title="Castle Marksburg" class="right" width="500px" height="375px"/>
				<div class="property-block">
					<h4>Description</h4>
					<p>
						Sitting atop a large hill overlooking most of <%=The_Ur_Un_Valley%> east of <%=Loftwick%>, is Castle Marksburg, home of Her Ladyship Hallisa Kornwell.
					</p>
					<p>
						In times of danger, a large, smoky fire can be lit to send a warning to all who can see the hilltop.
						While <%=Loftwick%> is too far away to see one of these signal fires, <%=The_Eagles_Nest%> and the keep of Lord Orin are not and Orin can rally his forces and send a warning to the capital.
					</p>
					<div style="height: 260px;"></div>
				</div>
			</div>

			<hr class="orange-border bottom" />
		</div>


		<div class="stat-block-spacer"></div>



		<a name="Raveslan"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Raveslan<%=DMText%></h1>
					<h2>A small community east of <%=Loftwick%></h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./images/Places/Raveslan.jpg" title="Raveslan" class="right" width="800px" height="618px"/>
				<div class="property-block">
					<h4>Description</h4>
					<p>
						Raveslan is a small farming village, approximately 1 day East of <%=Loftwick%> and situated on <%=The_New_Road%>.
						The town is a common lay-over for those traveling to and from <%=Loftwick%>, with visitors staying at <%=The_Greenhill_Inn%>.
						Due to the heavy traffic, rooms are often unavailable, though locals have been know to put up a trusty traveler for a few coins.
					</p>

				</div>
			</div>

			<hr class="orange-border bottom" />
		</div>


		<div class="stat-block-spacer"></div>


<!-- #include file="i_footer.asp" -->

	</div>
</div>

</body>
</html>