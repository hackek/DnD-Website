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
	<title>D&amp;D - Clearwasser & Mellys Castle</title>
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
					<li><%=CentralMellysValley%> - The semi-central portion of the <%=Mellys_Valley%></li>
					<li> &nbsp; &nbsp; <%=The_Arm_of_The_Valley%> - A large mountain spine of  <%=The_Crystalmist_Mountains%> that juts into the <%=Mellys_Valley%></li>
					<li> &nbsp; &nbsp; &nbsp; &nbsp; <%=Mellys_Castle%> - Home of <%=Maximilian%></li>
					<li> &nbsp; &nbsp; <%=Clearwasser%> - The capital city of <%=Maximilian%>'s kingdom</li>
					<li> &nbsp; &nbsp; &nbsp; &nbsp; <%=The_Rising_Sun_Tavern%> - A high end tavern/inn</li>
					<li> &nbsp; &nbsp; &nbsp; &nbsp; <%=The_Black_Wood_Tavern%> - A high end tavern/inn</li>
					<li> &nbsp; &nbsp; &nbsp; &nbsp; <%=The_Brass_Boar_Tavern%> - A high end tavern specializing in Dwarven themed food</li>
					<li> &nbsp; &nbsp; &nbsp; &nbsp; Library of Clearwasser (50gp/year)</li>
					<li> &nbsp; &nbsp; <%=Heil_Lake%> (Sactuary Lake) - A large lake beside <%=Clearwasser%></li>
					<li> &nbsp; &nbsp; <%=Kalter_Fluss%> (Cold River) - The primary river in the <%=SouthernMellysValley%></li>
					<li> &nbsp; &nbsp; <%=Dusseldorn_Hollow%> - Entrance to a remote valley ruled by <%=Caris%></li>
					<li> &nbsp; &nbsp; &nbsp; &nbsp; <%=Temple_of_Fharlanghn_Borin%> - A small temple to the north east at the entrance of <%=Dusseldorn_Hollow%></li>
					<li> &nbsp; &nbsp; <%=Wizneski%> - A small town about 8 miles east of <%=Clearwasser%></li>
					
				</ul>

			</div>
			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>




		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="map-placement">
				<a name="<%=HexPage%>"></a>
				<img src="./Images/Maps/F149-243_Clearwasser.png" title="" class="right mapper" usemap="#hexMapper"/>
<%
North			= SetHyperlink(DusseldornNWHex)
NorthEast	= SetHyperlink(DusseldornSEHex)
SouthEast	= SetHyperlink(MellysValleyEastHex)
South			= SetHyperlink(SouthMellysValleyHex)
SouthWest	= SetHyperlink(SWMellysCastleHex)
NorthWest	= SetHyperlink(CanyonRoadHex)
%>
				<!-- https://www.image-map.net/ -->
				<map name="hexMapper">
<!-- #include file="i_hexMapper.asp" -->
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Temple of Fharlanghn" title="Temple of Fharlanghn" href="" coords="518, 155, 8" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Clearwasser" title="Clearwasser" href="" coords="208, 390, 8" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Mellys Castle" title="Mellys Castle" href="" coords="158, 466, 8" shape="circle">
					
					
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Wizneski" title="Wizneski" href="" coords="400, 430, 80" shape="circle">
				</map>
			</div>
			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>




		<a name="CentralMellysValley"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Central Mellys Valley</h1>
					<h2>Home of Maximilian</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<p>
					The central, ruling portion of the <%=Mellys_Valley%>.
					While the primary castle is without a doubt <%=Mellys_Castle%>, there are a number of other smaller castle dotting the landscape, each watching over a nearby town.
				</p>
				<p>
					To the north east is the entrance to <%=Dusseldorn_Hollow%>, ruled by <%=Caris_Ivsar%>.
				</p>
				<p>
					To the east is the edge of the <%=OstenBauernhof%>, ruled by <%=Baron_Extenstein_von_Rothenberg%>.
				</p>
				<p>
					To the south east is the fiefdom of <%=SouthEasternMellysValley%>, ruled by Baron Kriegersdorf.
				</p>
				<p>
					Pairs of mounted <%=Hippogriff%> are regularly seen patrolling the skies, and foot patrols are a semi-common encounter.
				</p>
				<div style="height: 0px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>




		<a name="Mellys_Castle"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Mellys Castle</h1>
					<h2>Home of Maximilian</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./Images/Places/Mellys_Valley/Castles/Hohenwerfen_006.jpg" title="Mellys Castle" class="right" width="557px" height="335px"/>
				<p>
					Perched at the edge of a mountain spine, and overlooking hundreds of miles of the <%=Mellys_Valley%>, is <%=Mellys_Castle%>, ancestral home of <%=Freiherr_Maximilian_of_Berry%>, king of the valley.
					With a commanding view of much of the <%=Mellys_Valley%>, the aging monarch rules from this mountain fortress surrounded by trusted guards, advisors and servants.
				</p>

				<div style="height: 240px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>




		<a name="Clearwasser"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Clearwasser</h1>
					<h2>Capital city of the Mellys Valley</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./Images/Places/Mellys_Valley/Clearwasser/Clearwasser.jpg" title="Clearwasser" class="right" width="900px" height="330px"/>
				<p>
					The walled city of <%=Clearwasser%>, capital of the <%=Mellys_Valley%>, is situated on a large lake in the middle of the isolated valley.
					It is the only "city" in the valley and all laws of the land stem from here (via the king, <%=Freiherr_Maximilian_of_Berry%>).
					While nowhere as large as capital cities of other countries, it is very advanced for its relatively small size.
					This is in no small part due to the influences, encouragement and funding from <%=Maximilian%>, and indirectly from his loyal vessels.
				</p>
				<img src="./images/People/NPCs/Mellys/Father_Loris.png" title="Father Loris" class="left" width="275px" height="500px"/>
				<p>
					The largest temple in the city is dedicated to <%=St_Cuthbert%>, sometimes know as <%=Sancier%>, though other religions are accepted as well.
					It is run by <%=Father_Loris%> who follows in the footsteps of <%=Father_Charles%>, one of the original settlers of the valley.
					Established temples and churches are:
					<table class="monster" align="left" width="270px" style="margin-right: 20px; margin-left: 20px;">
						<tr valign="bottom" class="monsterhead">
							<th class="TDleft">Diety</th>
							<th class="TDleft">Size</th>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=St_Cuthbert%></td>
							<td nowrap class="monster">Large</td>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=Obad_Hai%></td>
							<td nowrap class="monster">Medium</td>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=Olidammara%></td>
							<td nowrap class="monster">Medium</td>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=Ehlonna%></td>
							<td nowrap class="monster">Small</td>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=Fharlanghn%></td>
							<td nowrap class="monster">Small</td>
						</tr>
					</table>
				</p>
				<img src="./images/People/NPCs/Mellys/Mayor_Johann_Schmidt.png" title="Mayor Johann Schmidt" class="right" width="275px" height="375px" style="margin-bottom: 120px;"/>
				<p>
					Though sitting in the shadow of <%=Mellys_Castle%>, the city is ruled by <%=Mayor_Johann_Schmidt%>, a position appointed by the King.
				</p>
				<p>
					Most service or product available in a larger city is likely available here, though possibly at a higher price.
				</p>

				<p>
					There are many inns and taverns in the city, but the two that stand out the most are <%=The_Rising_Sun_Tavern%> (known for the annual gambling tournament) and <%=The_Black_Wood_Tavern%>.
					<table class="monster" align="left" width="270px" style="margin-right: 20px; margin-left: 20px;">
						<tr valign="bottom" class="monsterhead">
							<th class="TDleft">Inn Name</th>
							<th class="TDright">Cost</th>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=The_Rising_Sun_Tavern%></td>
							<td nowrap class="monster">5 gp/night</td>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=The_Black_Wood_Tavern%></td>
							<td nowrap class="monster">5 gp/night</td>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=The_White_Hart%></td>
							<td nowrap class="monster">3 gp/night</td>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=The_Red_Oak%></td>
							<td nowrap class="monster">2 gp/night</td>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=The_Swan_and_Rose%></td>
							<td nowrap class="monster">1 gp/night</td>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=The_Hare_and_Hound%></td>
							<td nowrap class="monster">1 gp/night</td>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=The_Kings_Crown%></td>
							<td nowrap class="monster">1 gp/night</td>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=The_Carpenters_Arms%></td>
							<td nowrap class="monster">5 sp/night</td>
						</tr>
						<tr valign="bottom" class="monsterhead">
							<td nowrap class="monster"><%=The_Red_Dragon%></td>
							<td nowrap class="monster">5 sp/night</td>
						</tr>
					</table>
				</p>
				<p>
					There is a modest private library, <%=The_Library_of_Clearwasser%>, available to members only (membership is <b>50 gp/year</b>).
				</p>

				<img src="./images/Places/Mellys_Valley/Clearwasser/FoH_Hall.jpg" title="Fellowship of Hussain Meeting Hall" class="right" style="margin-top: 0px;" width="550px" height="350px"/>
				<p>
					A small contingency of Wizards, known as the <%=Fellowship_of_Husain%>, gather here every other month.
					While this mysterious group of people are generally feared due to the reputation of Wizards, they are in fact a rather disorganized group of individuals who spend more time arguing than working together.
				</p>
				<p>
					There are 2 high end restaurants in the city: <%=The_Brass_Boar_Tavern%> (Dwarven) and <%=The_Flying_Griffon%>.
				</p>

				<div style="height: 200px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>




		<a name="The_Brass_Boar_Tavern"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>The Brass Boar Tavern</h1>
					<h2>A high end tavern specializing in Dwarven themed foods</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./Images/Places/Mellys_Valley/Clearwasser/Clearwasser.jpg" title="Clearwasser" class="right" width="900px" height="330px"/><br>


				<table class="MenuFood" align="right">
					<tr>
						<td>
							<table>
								<tr>
									<td colspan="2" align="middle">
										<b>Menu</b>
									</td>
								</tr>
								<tr>
									<td>
										<b>Stuffed Mushroom</b><br>
										A large mushroom cap stuffed with spiced sausage and vegetables
									</td>
									<td align="right" width="40px;">
										5 gp
									</td>
								</tr>
								<tr>
									<td>
										<b>Mossflour Pastry Plateer</b><br>
										A collection of fruit, meat, and cheese pastries that are typically served to a group of people
									</td>
									<td align="right">
										11 gp
									</td>
								</tr>
								<tr>
									<td>
										<b>Catch of the Day</b><br>
										Freshly caught oysters, clams, and shrimp tossed in a spicy dwarven peppersauce and roasted over a fire
									</td>
									<td align="right">
										7 gp
									</td>
								</tr>
								<tr>
									<td>
										<b>Meat of the Mountain</b><br>
										Honey-braised mountain goat, served with pickled vegetables and a side of boruul bread
									</td>
									<td align="right">
										6 gp
									</td>
								</tr>

								<tr>
									<td>
										<br><b>Sides</b>
									</td>
								</tr>
								<tr>
									<td>
										Meat pies, usually made with bear, boar, spiced goat, or lynx
									</td>
									<td align="right">
										4 gp
									</td>
								</tr>
								<tr>
									<td>
										Fruit Tarts (Apple, Berry, Peach)
									</td>
									<td align="right">
										3 gp
									</td>
								</tr>
								<tr>
									<td>
										Leaf Salad topped with mushrooms, nuts, and goat cheese
									</td>
									<td align="right">
										3 gp
									</td>
								</tr>
								<tr>
									<td>
										Boruul bread with Honey
									</td>
									<td align="right">
										2 gp
									</td>
								</tr>
							</table>


							<table class="MenuFood" align="right">
								<tr>
									<td>
										<br><b>Drinks</b>
									</td>
								</tr>
								<tr>
									<td>
										Milk (Cow, goat)
									</td>
									<td align="right">
										1 gp/glass, 4 gp/bottle
									</td>
								</tr>


								<tr>
									<td>
										Water
									</td>
									<td align="right">
										Free (with food order)
									</td>
								</tr>
								<tr>
									<td>
										Mint or floral tea
									</td>
									<td align="right">
										9sp/glass, 4gp/pitcher
									</td>
								</tr>
								<tr>
									<td>
										Sweet Berry Tea
									</td>
									<td align="right">
										7sp/glass, 4gp/pitcher
									</td>
								</tr>
								<tr>
									<td>
										Hot Plumb Cider
									</td>
									<td align="right">
										1gp/glass, 6gp/bottle
									</td>
								</tr>
								<tr>
									<td>
										Kundarak Ale
									</td>
									<td align="right">
										1 gp/glass, 6 gp/tankard
									</td>
								</tr>
								<tr>
									<td>
										Mountain Mead
									</td>
									<td align="right">
										2 gp/glass, 8 gp/tankard
									</td>
								</tr>
								<tr>
									<td>
										Spiced Rum
									</td>
									<td align="right">
										2 gp/glass, 9 gp/tankard
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<p>
					This establishment is much more refined than most other eating establishments in <%=Clearwasser%>.
					It is frequented mostly by well to-do dwarven, bankers, well-off merchants, or anyone in their good graces.
					It is run by Sigva Kundarak, a proud female Dwarf.
				</p>
				<p>
					The Brass Boar is named for it's giant decorative boar head that hangs above the bar, but the building itself is a dark marble, with glass doors and wide windows.
					The windows are enchanted to be one-way, so that only those inside may see who is dining there, and with whom.
				</p>
				<p>
					Unlike many taverns, this one represents itself more as a restaurant- its tables are delicately draped in pristine table cloths, and there is always a clean set of silverware ready for a new patron.
				</p>

				<div style="height: 370px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>




		<a name="The_Flying_Griffon"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>The Flying Griffon</h1>
					<h2>A high end tavern specializing in German themed foods</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./Images/Places/Mellys_Valley/Clearwasser/Clearwasser.jpg" title="Clearwasser" class="right" width="900px" height="330px"/><br>


				<table class="MenuFood" align="right">
					<tr>
						<td>
							<table>
								<tr>
									<td colspan="2" align="middle">
										<b>Menu</b>
									</td>
								</tr>
								<tr>
									<td>
										<b>Skyline Special</b><br>
										Herb-crusted eagle legs served with poached eggs and a light salad
									</td>
									<td align="right" width="40px;">
										15 gp
									</td>
								</tr>
								<tr>
									<td>
										<b>Firelit Dinner</b><br>
										Braised pheasant with steamed vegetables and wild rice
									</td>
									<td align="right">
										18 gp
									</td>
								</tr>
								<tr>
									<td>
										<b>Lucky Sausage Links</b><br>
										Brandy-marinated sausage, served with an herb and bread stuffing and onion cheese
									</td>
									<td align="right">
										9 gp
									</td>
								</tr>
								<tr>
									<td>
										<b>Spitroast Pig</b><br>
										A special meal to celebrate the start of the journey, and included in the ticket price- a fire roasted pig, served with all manner of eggs, meat pies, fruit tarts, and vegetables
									</td>
									<td align="right">
										Free
									</td>
								</tr>
								<tr>
									<td>
										<b>Heron Stew</b><br>
										A concoction of roasted heron, vegetables, and spices
									</td>
									<td align="right">
										7 gp
									</td>
								</tr>

								<tr>
									<td>
										<br><b>Sides</b>
									</td>
								</tr>
								<tr>
									<td>
										Meat pies, usually made with honeyed boar, roasted chicken, or peppered pork
									</td>
									<td align="right">
										3 gp
									</td>
								</tr>
								<tr>
									<td>
										Fruit Tarts (Apple, Berry, Peach)
									</td>
									<td align="right">
										3 gp
									</td>
								</tr>
								<tr>
									<td>
										To-Go Snacks (dried berries, nutcheese, and smoked boar meat)
									</td>
									<td align="right">
										3 gp
									</td>
								</tr>
								<tr>
									<td>
										Leaf Salad topped with nuts and cheese crumbles
									</td>
									<td align="right">
										3 gp
									</td>
								</tr>
							</table>


							<table class="MenuFood" align="right">
								<tr>
									<td>
										<br><b>Drinks</b>
									</td>
								</tr>
								<tr>
									<td>
										Milk (Cow, goat)
									</td>
									<td align="right">
										1 gp/glass, 4 gp/bottle
									</td>
								</tr>

								<tr>
									<td>
										Water
									</td>
									<td align="right">
										Free (with food order)
									</td>
								</tr>
								<tr>
									<td>
										Mint or floral tea
									</td>
									<td align="right">
										8sp/glass, 4gp/pitcher
									</td>
								</tr>
								<tr>
									<td>
										Sweet Berry Tea
									</td>
									<td align="right">
										5sp/glass, 4gp/pitcher
									</td>
								</tr>
								<tr>
									<td>
										Tangerine Brandy
									</td>
									<td align="right">
										4sp/glass, 6gp/bottle
									</td>
								</tr>
								<tr>
									<td>
										Dwarven Ale
									</td>
									<td align="right">
										5sp/pint, 10 gp/tankard
									</td>
								</tr>
								<tr>
									<td>
										Wild Orchard Wine
									</td>
									<td align="right">
										9sp/glass, 5 gp/bottle
									</td>
								</tr>
								<tr>
									<td>
										Moondrop Mead
									</td>
									<td align="right">
										6sp/glass, 4 gp/bottle
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>


				<div style="height: 370px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>




		<a name="Kalter_Fluss"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Kalter Fluss (Cold River)</h1>
					<h2>A mid-size river</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./Images/Places/Kalter_Fluss.jpg" title="Kalter Fluss (Cold River)" class="right" width="450px" height="329px"/>
				<p>
					Flowing from the lake at <%=Clearwasser%> (to the north), this chilly river flows south through the middle of the <%=SouthernMellysValley%>, ultimately disappearing into the ground (and presumably flowing into <%=The_Ruhr_River%> on the opposite side of the mountains.
					Multiple tributaries from the side-valleys feed the river year round, with the waters at their highest in late spring when the snows melt.
					It is fordable in various places, though people tend to avoid doing so because of the bone-chilling temperature.
					At key points, there are stone and wooden bridges that safely cross the river.
				</p>

				<div style="height: 190px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>



		<div class="stat-block-spacer"></div>



		<a name="Temple_of_Fharlanghn_Borin"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Temple of Fharlanghn</h1>
					<h2>A small road-side temple at the entrace of Dusseldorn Hollow</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./Images/Places/Mellys_Valley/Dusseldorn/Temple_of_Fharlanghn_Borin1.jpg" title="Temple of Fharlanghn at the entrance to Dusseldorn Hollow" class="left" width="282px" height="422px"/>
				<img src="./Images/Places/Mellys_Valley/Dusseldorn/Temple_of_Fharlanghn_Borin2.jpg" title="Temple of Fharlanghn at the entrance to Dusseldorn Hollow" class="right" style="-webkit-transform: scaleX(-1); transform: scaleX(-1); margin-top: -0px;" width="282px" height="422px"/>
				<p>
					This small, new temple is located in the pine forest at the intersection of the northern trading road of the <%=Mellys_Valley%> and the road leading to <%=Dusseldorn_Hollow%> and was build by <%=Father_Borin%>.
					The small parcel of land it sits on was donated by the liege of <%=Dusseldorn_Hollow%>, <%=Baron_Caris_Ivsaar%>
					As the god of travels, the temple was strategically built at the intersection of a road through the <%=Mellys_Valley%> and the road to <%=Dusseldorn_Hollow%> to maximize the likelihood of visitors, especially merchants and patrols.
				</p>
				<p>
					When not out adventuring with his employer, the baron, the temple is overseen by its founder, <%=Father_Borin%>.
					During those times when the priest is away, it is tended to by a young acolyte.
				</p>
				<p>
					Located just out of sight of the road and temple are several small homes and a barn, used by <%=Father_Borin%>, the acolyte and an unskilled laborer.
					The Druid <%=Avalina%> has made the building and flora an appealing blend of man and nature.
				</p>

				<div style="height: 100px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>



		<div class="stat-block-spacer"></div>



		<a name="Wizneski"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Wizneski</h1>
					<h2>A small quiet town</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>
				<img src="./Images/Places/Mellys_Valley/Wizneski.jpg" title="Wizneski" class="left" width="640px" height="293px"/>
				<p>
					Located about 7-8 miles to the east of <%=Clearwasser%>, this quiet down is often used by the party as a place to spend the night as they travel.
				</p>

				<div style="height: 230px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>



		<div class="stat-block-spacer"></div>



<!-- #include file="i_footer.asp" -->


	</div>

</body>
</html>