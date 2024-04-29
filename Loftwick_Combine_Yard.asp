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
	<title>D&amp;D - Loftwick - The Combine Yard</title>
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
				<div class="headlineContent">
					<div class="headlineInfo">
						<ul>
							<li><%=Loftwick%></li>
						</ul>
					</div>
				</div>

			</div>
			<hr class="orange-border bottom" />
		</div>



		<div class="stat-block-spacer"></div>



		<a name="<%=HexPage%>"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />
			<div class="section-left">
				<a name="Aerdi"></a>
				<div class="creature-heading">
					<h1><%=HexPage%></h1>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<a name="<%=HexPage%>"></a>
				<div class="headlineTitle"></div>

				<p>
					Though adjacent to the <a <%=GetAllInfo("R2_HABADOCK", "ath")%>%>Habadock & Quest District</a> (where city call is located), The Combine Yard District is clearly the rough side of town.
					Crime is common here, and respectable people rarely travel to this part of town, and those that do, generally travel with body gueards.
					The soldier that patrol this area know which alleys and corners to avoid.
				</p>

				<div>
					<img src="./Images/Places/Loftwick/Zoom/Loftwick_Combine_Yard.png" title="Combine Yard" alt="Loftwick_Combine_Yard.png" class="mapper" usemap="#Mapper"/>
				</div>


				<map name="Mapper">
<!-- https://www.image-map.net/ -->
<!-- Regions -->
<area target="" <%=GetAllInfo("R2_HABADOCK", "ath")%> coords="474,149,509,146,516,123,518,92,530,87,530,554,334,554,290,439,373,393" shape="poly">
<area target="" <%=GetAllInfo("R5_SANCTIA", "ath")%> coords="460,88,441,58,409,37,406,0,529,1,530,82,518,87,479,73,472,94" shape="poly">
<area target="" <%=GetAllInfo("R6_ORICHALCUM", "ath")%> coords="137,529,289,440,331,554,140,554" shape="poly">
<area target="" <%=GetAllInfo("R18_SCORNWALL_W", "ath")%> coords="23,266,38,297,41,320,33,355,92,414,93,434,116,449,122,493,134,500,136,554,2,554,1,261" shape="poly">
<area target="" <%=GetAllInfo("R19_SCORNWALL_NW", "ath")%> coords="54,239,17,262,2,261,2,2,403,0,403,17,386,33,330,61,326,83,263,111,242,102,218,119,201,128,176,129,110,163,101,180,78,188,71,217,59,221" shape="poly">

<!-- Buildings -->
<area target="" <%=GetAllInfo("87_MAEVE", "ath")%> coords="404,148,398,174,381,170,388,145" shape="poly">
<area target="" class="noborder icolor<%=TavernColor%>" <%=GetAllInfo("88_PRANCING", "ath")%> coords="194,201,206,211,214,223,207,239,184,222" shape="poly">
<area target="" <%=GetAllInfo("89_SLAUGHTERHOUSE", "ath")%> coords="277,114,290,106,334,91,347,103,342,119,331,129,293,122,281,119" shape="poly">
<area target="" <%=GetAllInfo("90_KALBRUNNER", "ath")%> coords="230,212,260,211,270,221,293,227,299,214,320,218,303,275,281,272,271,265,255,271,233,272,209,269,206,259" shape="poly">
<area target="" class="noborder icolor<%=TavernColor%>" <%=GetAllInfo("91_SLAG", "ath")%> coords="501,131,12" shape="circle">
<area target="" <%=GetAllInfo("92_CLINIC", "ath")%> coords="108,353,132,352,133,366,147,386,125,390" shape="poly">
<area target="" class="noborder icolor<%=TavernColor%>" <%=GetAllInfo("93_GENDARMEIE", "ath")%> coords="279,288,302,287,296,308,279,305" shape="poly">
<area target="" class="noborder icolor<%=TavernColor%>" <%=GetAllInfo("94_GAMBLING", "ath")%> coords="218,378,262,369,271,389,225,400" shape="poly">
<area target="" class="noborder icolor<%=TavernColor%>" <%=GetAllInfo("130_IRONHEART", "ath")%> coords="110,283,129,282,157,282,158,308,110,294" shape="poly">
<area target="" alt="TBD1" title="TBD1" href="" coords="116,186,126,191,125,197,137,209,108,263,90,265,81,251,80,239,90,200" shape="poly">
<area target="" alt="TBD2" title="TBD2" href="" coords="139,205,128,197,131,192,144,202" shape="poly">
<area target="" alt="TBD3" title="TBD3" href="" coords="116,175,116,168,123,166,125,177" shape="poly">
<area target="" alt="TBD4" title="TBD4" href="" coords="125,166,172,143,188,150,199,164,199,170,188,178,179,193,170,202,159,196,151,187,137,177" shape="poly">
<area target="" alt="TBD5" title="TBD5" href="" coords="202,137,226,125,237,124,251,129,254,139,223,166,197,148" shape="poly">
<area target="" alt="TBD6" title="TBD6" href="" coords="344,88,347,82,352,86,348,94" shape="poly">
<area target="" alt="TBD7" title="TBD7" href="" coords="344,75,338,65,344,63,350,71" shape="poly">
<area target="" alt="TBD8" title="TBD8" href="" coords="359,68,355,64,362,60,365,67" shape="poly">
<area target="" alt="TBD9" title="TBD9" href="" coords="376,82,367,58,398,43,406,65,403,83" shape="poly">
<area target="" alt="TBD10" title="TBD10" href="" coords="404,51,407,46,415,53,410,57" shape="poly">
<area target="" alt="TBD11" title="TBD11" href="" coords="423,57,422,49,429,50,429,57" shape="poly">
<area target="" alt="TBD12" title="TBD12" href="" coords="430,63,430,56,436,57,436,64" shape="poly">
<area target="" alt="TBD13" title="TBD13" href="" coords="408,82,411,61,418,61,434,72,434,85" shape="poly">
<area target="" alt="TBD14" title="TBD14" href="" coords="362,98,373,92,413,96,419,103,412,130,402,139,362,132,356,122" shape="poly">
<area target="" alt="TBD15" title="TBD15" href="" coords="419,136,431,97,440,96,446,100,453,107,442,136,431,139" shape="poly">
<area target="" alt="TBD16" title="TBD16" href="" coords="446,87,455,89,455,96,447,94" shape="poly">
<area target="" alt="TBD17" title="TBD17" href="" coords="471,107,471,101,479,102,478,108" shape="poly">
<area target="" alt="TBD18" title="TBD18" href="" coords="449,142,457,116,474,122,470,140,464,147" shape="poly">
<area target="" alt="TBD19" title="TBD19" href="" coords="122,263,122,255,140,225,153,213,170,224,163,238,158,261,144,258,129,265" shape="poly">
<area target="" alt="TBD20" title="TBD20" href="" coords="131,266,134,260,143,262,137,269" shape="poly">
<area target="" alt="TBD21" title="TBD21" href="" coords="146,269,149,263,156,264,154,271" shape="poly">
<area target="" alt="TBD22" title="TBD22" href="" coords="168,267,180,231,200,244,200,252,193,274,183,268" shape="poly">
<area target="" alt="TBD23" title="TBD23" href="" coords="220,213,203,196,230,175,269,191,263,203,243,201,228,202" shape="poly">
<area target="" alt="TBD24" title="TBD24" href="" coords="230,168,258,144,266,151,263,170,280,179,272,187" shape="poly">
<area target="" alt="TBD25" title="TBD25" href="" coords="268,167,269,146,263,140,270,135,281,132,297,134,298,144,292,148,284,177" shape="poly">
<area target="" alt="TBD26" title="TBD26" href="" coords="309,169,341,176,330,207,305,204,300,191" shape="poly">
<area target="" alt="TBD27" title="TBD27" href="" coords="340,208,350,177,391,184,384,207,374,217,365,209" shape="poly">
<area target="" alt="TBD28" title="TBD28" href="" coords="311,274,327,241,344,244,332,275" shape="poly">
<area target="" alt="TBD29" title="TBD29" href="" coords="338,275,352,244,370,248,359,276" shape="poly">
<area target="" alt="TBD30" title="TBD30" href="" coords="327,232,333,219,368,223,375,229,373,239" shape="poly">
<area target="" alt="TBD31" title="TBD31" href="" coords="369,275,384,249,401,251,397,269,389,279" shape="poly">
<area target="" alt="TBD32" title="TBD32" href="" coords="383,241,388,225,411,228,408,244" shape="poly">
<area target="" alt="TBD33" title="TBD33" href="" coords="404,185,423,190,416,218,394,213" shape="poly">
<area target="" alt="TBD34" title="TBD34" href="" coords="404,175,414,148,437,151,428,179" shape="poly">
<area target="" alt="TBD35" title="TBD35" href="" coords="421,279,409,278,404,268,413,253,427,256" shape="poly">
<area target="" alt="TBD36" title="TBD36" href="" coords="421,228,437,229,434,245,416,242" shape="poly">
<area target="" alt="TBD37" title="TBD37" href="" coords="445,218,431,216,426,210,430,189,439,187,455,190" shape="poly">
<area target="" alt="TBD38" title="TBD38" href="" coords="461,160,459,178,451,181,442,179,439,172,444,155" shape="poly">
<area target="" alt="TBD39" title="TBD39" href="" coords="53,353,46,347,51,320,59,314,62,302,66,297,80,291,86,290,99,303,96,345,69,344" shape="poly">
<area target="" alt="TBD40" title="TBD40" href="" coords="164,284,188,290,195,324,165,313" shape="poly">
<area target="" alt="TBD41" title="TBD41" href="" coords="221,325,206,320,200,295,215,289,227,289,228,304" shape="poly">
<area target="" alt="TBD42" title="TBD42" href="" coords="230,328,234,289,241,288,251,328,244,332" shape="poly">
<area target="" alt="TBD43" title="TBD43" href="" coords="265,289,270,295,275,312,296,315,305,346,299,350,275,343,264,335,252,288" shape="poly">
<area target="" alt="TBD44" title="TBD44" href="" coords="310,309,310,290,355,292,353,302,347,311" shape="poly">
<area target="" alt="TBD45" title="TBD45" href="" coords="365,293,407,295,410,303,393,319,367,315,363,310" shape="poly">
<area target="" alt="TBD46" title="TBD46" href="" coords="314,351,309,319,324,318,350,318,351,343" shape="poly">
<area target="" alt="TBD47" title="TBD47" href="" coords="359,341,360,320,394,324,393,332" shape="poly">
<area target="" alt="TBD48" title="TBD48" href="" coords="104,345,107,302,131,310,132,341,115,345" shape="poly">
<area target="" alt="TBD49" title="TBD49" href="" coords="137,346,137,316,142,312,158,319,160,345" shape="poly">
<area target="" alt="TBD50" title="TBD50" href="" coords="166,347,167,327,172,320,194,328,199,347" shape="poly">
<area target="" alt="TBD51" title="TBD51" href="" coords="63,351,98,353,112,379,114,395,95,398,58,358" shape="poly">
<area target="" alt="TBD52" title="TBD52" href="" coords="138,354,159,355,164,383,150,383,138,365" shape="poly">
<area target="" alt="TBD53" title="TBD53" href="" coords="167,354,202,353,208,373,186,379,169,377" shape="poly">
<area target="" alt="TBD54" title="TBD54" href="" coords="214,373,206,331,252,344,254,363" shape="poly">
<area target="" alt="TBD55" title="TBD55" href="" coords="99,405,151,395,155,404,154,412,116,432,102,422" shape="poly">
<area target="" alt="TBD56" title="TBD56" href="" coords="158,404,154,397,160,394,163,401" shape="poly">
<area target="" alt="TBD57" title="TBD57" href="" coords="171,387,208,382,214,398,209,408,188,421" shape="poly">
<area target="" alt="TBD58" title="TBD58" href="" coords="115,435,161,412,167,420,168,429,128,455,124,444" shape="poly">
<area target="" alt="TBD59" title="TBD59" href="" coords="169,410,174,416,169,419,162,411" shape="poly">
<area target="" alt="TBD60" title="TBD60" href="" coords="134,463,140,457,161,479,158,487,145,494,135,482" shape="poly">
<area target="" alt="TBD61" title="TBD61" href="" coords="152,452,189,431,200,457,173,477" shape="poly">
<area target="" alt="TBD62" title="TBD62" href="" coords="206,452,193,430,200,421,215,412,221,427,226,441" shape="poly">
<area target="" alt="TBD63" title="TBD63" href="" coords="234,428,230,421,234,412,233,405,269,395,273,403,257,420" shape="poly">
<area target="" alt="TBD64" title="TBD64" href="" coords="282,399,275,368,306,362,309,382" shape="poly">
<area target="" alt="TBD65" title="TBD65" href="" coords="149,519,144,504,170,487,174,493,168,507" shape="poly">
<area target="" alt="TBD66" title="TBD66" href="" coords="177,504,174,496,179,493,183,499" shape="poly">
<area target="" alt="TBD67" title="TBD67" href="" coords="187,493,183,484,186,478,204,466,209,474,198,484" shape="poly">
<area target="" alt="TBD68" title="TBD68" href="" coords="219,474,210,460,228,451,238,465" shape="poly">
<area target="" alt="TBD69" title="TBD69" href="" coords="245,457,239,440,274,414,285,437" shape="poly">
<area target="" alt="TBD70" title="TBD70" href="" coords="291,432,284,406,306,392,315,420" shape="poly">
<area target="" alt="TBD71" title="TBD71" href="" coords="321,416,315,362,342,375,340,402" shape="poly">
<area target="" alt="TBD72" title="TBD72" href="" coords="345,365,328,357,347,351" shape="poly">
<area target="" alt="TBD73" title="TBD73" href="" coords="353,375,376,384,348,400" shape="poly">
<area target="" alt="TBD74" title="TBD74" href="" coords="353,368,356,347,385,343,374,375" shape="poly">
<area target="" alt="TBD75" title="TBD75" href="" coords="160,208,164,202,173,207,170,212" shape="poly">
<area target="" alt="TBD76" title="TBD76" href="" coords="440,87,435,81,441,77,445,84" shape="poly">
<area target="" alt="TBD77" title="TBD77" href="" coords="129,192,124,186,130,184,134,188" shape="poly">
<area target="" alt="TBD78" title="TBD78" href="" coords="130,184,124,180,127,175,134,179" shape="poly">

<!-- Bridges -->
<area target="" <%=GetAllInfo("B10_SLUM", "ath")%> coords="501,114,487,108,476,88,480,78,516,87,515,102" shape="poly">

<!-- Docks -->

<!-- Gates -->
<area target="" class="noborder icolor<%=MilColor%>" <%=GetAllInfo("G2_EXECUTION", "ath")%> coords="51,296,38,292,27,269,27,259,48,245,63,245,65,257,57,288" shape="poly">

<!-- Park -->
<area target="" <%=GetAllInfo("P3_USURPER", "ath")%> coords="305,135,383,146,376,171,318,162,306,165,303,174,290,171,295,155,303,150" shape="poly">

<!-- Squares -->

<!-- Walls -->
				</map>





				<ul>
<!-- Buildings -->
					<li>
						<%=GetAllInfo("87_MAEVE", "D")%>
					</li>
					<li>
						<%=GetAllInfo("88_PRANCING", "D")%>
					</li>
					<li>
						<%=GetAllInfo("89_SLAUGHTERHOUSE", "D")%>
					</li>
					<li>
						<%=GetAllInfo("90_KALBRUNNER", "D")%>
					</li>
					<li>
						<%=GetAllInfo("91_SLAG", "D")%>
					</li>
					<li>
						<%=GetAllInfo("92_CLINIC", "D")%>
					</li>
					<li>
						<%=GetAllInfo("93_GENDARMEIE", "D")%>
					</li>
					<li>
						<%=GetAllInfo("94_GAMBLING", "D")%>
					</li>
					<li>
						<%=GetAllInfo("130_IRONHEART", "D")%>
					</li>

<!-- Bridges -->
					<li>
						<%=GetAllInfo("B10_SLUM", "D")%>
					</li>

<!-- Docks -->

<!-- Gates -->
					<li>
						<%=GetAllInfo("G2_EXECUTION", "D")%>
					</li>

<!-- Parks -->
					<li>
						<%=GetAllInfo("P3_USURPER", "D")%>
					</li>

<!-- Squares -->

<!-- Walls -->
				</ul>

			</div>
			<hr class="orange-border bottom" />
		</div>

		<div class="stat-block-spacer"></div>

<!-- #include file="i_footer.asp" -->

	</div>

</body>
</html>