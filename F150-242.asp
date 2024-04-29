<!-- #include file="i_top.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
PriorPage = "default.asp"
'NextPage = ToSaveATownLink2
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="UTF-8">
	<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
	<title>D&amp;D - Dusseldorn Hollow, South East</title>
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
					<li><%=Dusseldorn_HollowSE%> - The south eastern half of <%=Dusseldorn_Hollow%></li>
					<li><%=Darrin%> - Small mining town in the south eastern corner of <%=Dusseldorn_Hollow%></li>

					<li><%=Prum%> - Small farming town in the north east corner of <%=Dusseldorn_Hollow%></li>
					<li><%=Hoff%> - Small farming town in the eastern half of <%=Dusseldorn_Hollow%>, 2nd largest village in the valley</li>
					<li><%=Thurm%> - Small mining town in the north east of <%=Dusseldorn_Hollow%></li>
					<li><%=Klutz%> - Small mining town in the far east of <%=Dusseldorn_Hollow%></li>
					<li><%=Mueller_PassN%> - A snow-covered pass between Dusseldorn Hollow and <%=OstenBauernhofValleyN%> to the south</li>
					<li><%=OstenBauernhofValleyN%> - A neighboring valley to the south</li>
				</ul>

			</div>
			<hr class="orange-border bottom" />
		</div>






		<div class="stat-block-spacer"></div>

		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="map-placement">
				<a name="<%=HexPage%>"></a>
				<img src="./Images/Maps/F150-242_Dusseldorn_Hollow.png" title="" class="right mapper" usemap="#hexMapper"/>
<%
North			= SetHyperlink("")
NorthEast	= SetHyperlink("")
SouthEast	= SetHyperlink("")
South			= SetHyperlink(MellysValleyEastHex)
SouthWest	= SetHyperlink(ClearwasserHex)
NorthWest	= SetHyperlink(DusseldornNWHex)
%>
				<!-- https://www.image-map.net/ -->
				<map name="hexMapper">
<!-- #include file="i_hexMapper.asp" -->
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Darrin" title="Darrin" href="" coords="343, 382, 10" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Prum" title="Prum" href="" coords="215, 145, 10" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Thurm" title="Thurm" href="" coords="254, 71, 10" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Hoff" title="Hoff" href="" coords="293, 276, 10" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Klutz" title="Klutz" href="" coords="435, 313, 10" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Mueller Pass" title="Mueller Pass" href="" coords="360,596, 370,534, 383,500, 392,500, 373,595" shape="poly">
				</map>
			</div>
			<hr class="orange-border bottom" />
		</div>





		<div class="stat-block-spacer"></div>

		<a name="Dusseldorn_HollowSE"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Dusseldorn Hollow South East</h1>
					<h2>The south eastrn half of the valley</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./images/Places/Dusseldorn_Hollow7.jpg" title="Dusseldorn Hollow" class="left" width="300px" height="450px"/>
				<p>
					The eastern half of <%=Dusseldorn_Hollow%>.
					There are several communities in this half of the valley, but none large enough to be considered an official town per se (though that may change).
				</p>

				<div style="height: 420px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>





		<div class="stat-block-spacer"></div>

		<a name="Hoff"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Hoff</h1>
					<h2>Small farming town in the eastern half of <%=Dusseldorn_Hollow%></h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<p>
					This town is the 2nd largest community in <%=Dusseldorn_Hollow%>.
					There is a simple tavern/inn that has a half dozen beds.
				</p>

				<div style="height: 0px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>





		<div class="stat-block-spacer"></div>

		<a name="Darrin"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Darrin</h1>
					<h2>Small Mining Town in the south eastern corner of <%=Dusseldorn_Hollow%></h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<p>
					A small mining town in the south eastern corner of <%=Dusseldorn_Hollow%>.
					There is a simple tavern in the center of town, but apparently not much else.
				</p>

				<div style="height: 0px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>





		<div class="stat-block-spacer"></div>

		<a name="Mueller_Pass"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Mueller Pass</h1>
					<h2>A Snow Covered Pass</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./Images/Places/Mellys_Valley/Dusseldorn/Mueller_Pass.jpg" title="Mueller Pass" class="right" width="600px" height="375px"/>
				<p>
					Mueller Pass is a gap in the mountains between <%=Dusseldorn_HollowSE%> and <%=OstenBauernhofValleyN%>, the neighboring valley to the south.
					It is permanently covered in snow, and is especially treacherous in the Winter when there is additional snow in the lower elevations.
				</p>
				<p>
					Some teenagers make this crossing as a rite of passage, though not all make it (and some freeze to death).
				</p>
				<div style="height: 210px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>






		<div class="stat-block-spacer"></div>

		<a name="OstenBauernhofValleyN"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>OstenBauernhof Valley (North)</h1>
					<h2>The valley to the south of Dusseldorn Hollow</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<p>
					A narrow valley to the south of Dusseldorn Hollow.
					It shares the same name as the ruling city of the valley, <%=OstenBauernhof%>.
				</p>
				<div style="height: 0px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>






<!-- #include file="i_footer.asp" -->


	</div>

</body>
</html>