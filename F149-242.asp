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
	<title>D&amp;D - Dusseldorn Hollow, North West</title>
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
					<li><%=Dusseldorn_HollowNW%> - The north west half of <%=Dusseldorn_Hollow%></li>
					<li><%=Whyme%> - The largest town in <%=Dusseldorn_Hollow%>, home to <%=The_Whyme_Pines%></li>
					<li><%=Brandis%> - A small farming village in the north west of <%=Dusseldorn_Hollow%></li>
					<li><%=Wurzback%> - A small mining community in the west of <%=Dusseldorn_Hollow%></li>
					<li><a href="#Improvements" title="Improvements the party has made to the valley"><span class="place">Improvements</span></a> - Improvements to Dusseldorn Hollow</li>
				</ul>

			</div>
			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>




		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="map-placement">
				<a name="<%=HexPage%>"></a>
				<img src="./Images/Maps/F149-242_Dusseldorn_Hollow.png" title="" class="right mapper" usemap="#hexMapper"/>
<%
North			= SetHyperlink("")
NorthEast	= SetHyperlink("")
SouthEast	= SetHyperlink(DusseldornSEHex)
South			= SetHyperlink(ClearwasserHex)
SouthWest	= SetHyperlink(CanyonRoadHex)
NorthWest	= SetHyperlink("")
%>
				<!-- https://www.image-map.net/ -->
				<map name="hexMapper">
<!-- #include file="i_hexMapper.asp" -->
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Whyme" title="Whyme" href="" coords="646, 580, 10" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Bradis" title="Bradis" href="" coords="514, 411, 10" shape="circle">
					<area class="noborder icolor<%=HoverColor%>" target="" alt="Wurzback" title="Wurzback" href="" coords="505, 536, 10" shape="circle">
				</map>
			</div>
			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>





		<a name="Dusseldorn_HollowNW"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Dusseldorn Hollow North West</h1>
					<h2>The north western half of the valley</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./images/Places/Dusseldorn_Hollow7.jpg" title="Dusseldorn Hollow" class="left" width="300px" height="450px"/>
				<img src="./images/People/Party2/Caris_Ivsaar2.jpg" title="Caris Ivsaar" class="right" width="235px" height="400px" />
				<p>
					The western half of <%=Dusseldorn_Hollow%>, and home of <%=Whyme%>, the largest town in the valley.
					There are several communities in this half of the valley, but none large enough to be considered an official town per se (though that may change).
				</p>
				<p>
					The valley itself is ruled by the Wizard <%=Caris_Ivsaar%>, an elf who recently moved to the area with his party.
					He inherited the valley in the form of a <%=Deed%> he received as a gift from his mother (who got it from her brother, who in turn was an adventurer with <%=Freiherr_Maximilian_of_Berry%> in his earlier days, over 100 years ago).
				</p>
				<p>
					As a way to help pay for improvements to the valley, <%=Caris%> granted smaller parcels of the valley to <%=Aerethel%>, <%=Frobo%> and <%=Avalina%> in exchange for money and searing fealty to the Wizard.
				</p>
				<p>
					The valley has the unpleasant reputation of becoming isolated from the rest of the <%=Melleys_Valley%> every winter when the snows seal off the entrance between <%=Dusseldorn_Hollow%> and the <%=CentralMellysValley%>.
				</p>
				<p>
					Unlike the main part of the <%=Mellys_Valley%>, mounted <%=Hippogriff%> patrols are rarely seen, though <%=Caris%>'s foot patrols are a semi-common encounter.
				</p>
				<div style="height: 100px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>





		<a name="Whyme"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Whyme</h1>
					<h2>Largest town in Dusseldorn Hollow</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<img src="./images/Places/Mellys_Valley/Dusseldorn/Whyme01.png" title="Whyme" class="right" width="435px" height="250px"/>
				<p>
					A small but growing town in <%=Dusseldorn_Hollow%>, it serves as the capital of the remote valley.
					<%=Caris%>, <%=Aerethel%>, <%=Frobo%> and <%=Avalina%> have all invested in the town, boosting both the economy and the moral of the small community.
				</p>
				<img src="./Images/People/NPCs/Mellys/Dusseldorn/Hans_Lieber.png" title="Hans Lieber, major domo for Caris" class="left" width="212px" height="316px" />
				<p>
					<%=Caris%> has personally invested most of his wealth into the local economy, boosting the local infrastructure (a tower, a jail, a grand/town hall, etc.) and hired 50 or so soldiers to protect and control the valley.
					While he was viewed with some hesitation by the people initially, he has proven to be a well-liked leader due to his investment in the valley (esp. Whyme).
					His soldiers have brought law and order to the previously ungoverned valley, and most of the people are grateful to him.
				</p>
				<p>
					When <%=Caris%> is away adventuring, the valley if ruled by <%=Hans_Lieber%>, a man hired to keep things moving smoothly.
				</p>
				<img src="./images/People/Party2/Frix_004.jpg" title="Baronette Frix" class="right"  width="240px" height="355px" />
				<p>
					The other person of note in town is <%=Baronette_Frix%>, the adopted daughter of <%=Caris_Ivsaar%> and <%=Aerethel_Nivenor%>.
					Originally a street urchin from <%=Loftwick%>, she proved herself time and time again to be a loyal aid, and soon became the party's unofficial ward until ultimately being legally adopted.
					Shortly after arriving in <%=Dusseldorn_Hollow%>, she decided she would rather stay behind in town.
					<%=Caris%> hired a dedicated tutor for his young daughter, along with a pair of Half-elf twins, <%=Urgan_and_Gurgan%>, to be her body guards.
					The baronnette is well liked by all - she is kind and loving to everyone and is just as comfortable acting the roll of minor royalty as she is tussling with the local youth in the woods.
					She has the reputation of being able to hold her own better than any of her peers, and has given more than one presumptuous boy a blood nose.
				</p>

				<div style="height: 190px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>





		<a name="Improvements"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Improvements</h1>
					<h2>Notable Improvements, People and Places in Dusseldorn Hollow</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<p>
					Upon taking up residence in <%=Dusseldorn_Hollow%>, the party immediately began making it their home.
					As the ruler of the valley, <%=Caris%> knew he needed to establish some infrastructure, and began laying the plans to build a town hall with a clock tower, a sheriff to maintain order, a judge to settle disputes, etc.
					He also had to hire soldiers to patrol his valley and keep the peace.
				</p>
				<p>
					Unfortunately, he had nowhere near the funds to make this happens.
					In true feudal tradition, he granted parcels of land to the <%=Frobo%>, <Aerethel%> and <%=Avalina%> in exchange for gold and searing of fealty to the Elf.
					With this infusion of gold, the Wizard was able to begin building his realm in the valley (though still owing his allegiance to <%=King_Maximilian%>.
				</p>
				<img src="./images/Places/Mellys_Valley/Dusseldorn/TownHall.png" title="Town Hall and residence of Baron Ivsar" class="right" width="900px" height="1000px" />
				<p>
					Picking <%=Whyme%>, the largest settlement in the valley, as his future capital, <%=Caris%> set his plans in motion.
					Construction on the town hall, which would double as his personal residence, began and people were hired.
					<%=Cariss_Mansion%>
				</p>
				<img src="./images/Places/Mellys_Valley/Dusseldorn/Dining_Hall.jpg" title="Caris's dining hall" class="right" width="375px" height="250px" />
				<p>
					<%=Aerethel%> built a modest stone cottage on the outskirts of <%=Whyme%> along with a small barn for her horse.
					There, she and <%=Frix%> (when not with <%=Caris%>, studying with her tutor, or playing with others) would spend their down time together.
				</p>
				<p>
					Picking a quiet section of woods on her tract of land, <%=Avalina%> had a home built where <%=Frobo%> and <%=Kuntas%> also lived.
					A bountiful garden was planted behind the house and was "enhanced" by the Druid's spells and skills.
					In addition, a young peasant, <%=Frita%> was hired to tend to the house and garden when the party was away.
				</p>
				<p>
					Unlike the others, <%=Frobo%> did not build a home.
					Instead, he invested heavily in the <%=Elk_and_Stag%> as a silent partner.
					The tavern was enlarged, worn out assets were replaced, the interior and exterior were painted and the run down establishment took on a new life.
					When in town, the Rogue is often found gambling and dining at the tavern and there is always a room for him and his hirelings as needed.
				</p>
				<p>
					At the entrance of the valley (in the mega-hex to the south), <%=Borin%> has established a simple <%=Temple_of_Fharlanghn_Borin%>.
					<%=Caris%> gave the land, a dozen or so acres, to the priest as a gift as thanks for his loyal assistance.
					Hidden by the pines, <%=Borin%> has a modest home and barn where he and his acolyte live.
				</p>
				<p>
					It was <%=Frix%> who finally came up with a name for the party, <%=The_Whyme_Pines%>, a mix of both their new home, <%=Whyme%> and the vast pine forests that dominate the <%=Mellys_Valley%>.
				</p>

					<table class="monster" width=830px>
						<tr valign="bottom" class="monsterhead">
							<th class="TDcenter">Owner</th>
							<th class="TDcenter">Name</th>
							<th class="TDcenter">Location</th>
							<th class="TDleft">Description</th>
							<th class="TDleft">Name</th>
							<th class="TDright">GPs/month</th>
						</tr>
						<tr>
							<td nowrap class="monster">Avalina</td>
							<td nowrap class="monster">Avalina's Cottage</td>
							<td nowrap class="monster">A mile from Whyme</td>
							<td nowrap class="monster">Avalina's home<br>(also Frobo & Kuntas's home)</td>
							<td nowrap class="TDcenter monster">&nbsp;</td>
							<td nowrap class="TDcenter monster">0</td>
						</tr>
						<tr>
							<td nowrap class="monster">Avalina</td>
							<td nowrap class="monster">Shops</td>
							<td nowrap class="monster">Whyme</td>
							<td nowrap class="monster">Apothacary<sup>&dagger;</sup><br>Textile shop<sup>&dagger;</sup><br>Pottery<sup>&dagger;</sup></td>
							<td nowrap class="monster">Ingrid<br>Charlotte<br>Clay</td>
							<td nowrap class="TDcenter monster">n/a</td>
						</tr>
						<tr>
							<td nowrap class="monster">Aerethel</td>
							<td nowrap class="monster">Aerethel's Home</td>
							<td nowrap class="monster">1/4 mile from Whyme</td>
							<td nowrap class="monster">A simple cottage with a modest barn</td>
							<td nowrap class="TDcenter monster">&nbsp;</td>
							<td nowrap class="TDcenter monster">n/a</td>
						</tr>
						<tr>
							<td nowrap class="monster">Caris</td>
							<td nowrap class="monster">Clock tower</td>
							<td nowrap class="monster">Whyme</td>
							<td nowrap class="monster">Clock master<sup>&dagger;</sup></td>
							<td nowrap class="monster">"Gears" (Gnome)</td>
							<td nowrap class="TDright monster">56</td>
						</tr>
						<tr>
							<td nowrap class="monster">Caris</td>
							<td nowrap class="monster">Stables</td>
							<td nowrap class="monster">Whyme</td>
							<td nowrap class="monster">Stable boy<sup>*</sup></td>
							<td nowrap class="monster">Klein (Human)</td>
							<td nowrap class="TDright monster">5.6</td>
						</tr>
						<tr>
							<td nowrap class="monster">Caris</td>
							<td nowrap class="monster">Town Hall</td>
							<td nowrap class="monster">Whyme</td>
							<td nowrap class="monster">Major Domo<sup>&dagger;</sup><br>Slush Fund<br>Sr Clerk<sup>&dagger;</sup><br>Sr Clerk<sup>&dagger;</sup><br>Judge<sup>&dagger;</sup><br>(12) clerks<sup>*</sup></td>
							<td nowrap class="monster">Hanz Lieber (Human)<br>Hanz Lieber<br>Elbert (Human)<br>Ava (Human)<br>Ulva (Human)<br>n/a</td>
							<td nowrap class="TDright monster">84<br>50<br>64<br>64<br>56<br>67</td>
						</tr>
						<tr>
							<td nowrap class="monster">Caris</td>
							<td nowrap class="monster">Armory</td>
							<td nowrap class="monster">Whyme</td>
							<td nowrap class="monster">Quartermaster<sup>&dagger;</sup></td>
							<td nowrap class="monster">Caladin</td>
							<td nowrap class="TDright monster">56</td>
						</tr>
						<tr>
							<td nowrap class="monster">Caris</td>
							<td nowrap class="monster">Dining Hall</td>
							<td nowrap class="monster">Whyme</td>
							<td nowrap class="monster">Cook<sup>&dagger;</sup><br>(4) Staff<sup>*</sup></td>
							<td nowrap class="monster">Jordan Ramsey<br>n/a</td>
							<td nowrap class="TDright monster">56<br>22</td>
						</tr>
						<tr>
							<td nowrap class="monster">Caris</td>
							<td nowrap class="monster">Sheriff's Office</td>
							<td nowrap class="monster">Whyme</td>
							<td nowrap class="monster">Sheriff<sup>&dagger;</sup><br>(18) Veterans<br>(30) Soldiers</td>
							<td nowrap class="monster">Ingram<br>n/a<br>n/a</td>
							<td nowrap class="TDright monster">56<br>504<br>840</td>
						</tr>
						<tr>
							<td nowrap class="monster">Caris</td>
							<td nowrap class="monster">Mines</td>
							<td nowrap class="monster">Mountains</td>
							<td nowrap class="monster">Foreman<sup>&dagger;</sup><br>(5) Supervisors<sup>&dagger;</sup><br>(50) Miners<sup>*</sup></td>
							<td nowrap class="monster">Godfrey<br>n/a<br>n/a</td>
							<td nowrap class="TDright monster">56<br>280<br>280</td>
						</tr>
						<tr>
							<td nowrap class="monster">Caris</td>
							<td nowrap class="monster">Frix</td>
							<td nowrap class="monster">Whyme</td>
							<td nowrap class="monster">Allowance</td>
							<td nowrap class="monster">-</td>
							<td nowrap class="TDright monster">30</td>
						</tr>
						<tr>
							<td nowrap class="monster">Caris</td>
							<td nowrap class="monster">Frix's staff</td>
							<td nowrap class="monster">Whyme</td>
							<td nowrap class="monster">Tutor<sup>&dagger;</sup><br>Body guard<sup>&dagger;</sup><br>Body guard<sup>&dagger;</sup></td>
							<td nowrap class="monster">Anastasia<br>Urchin<br>Gurchin</td>
							<td nowrap class="TDright monster">56<br>100<br>100</td>
						</tr>
						<tr>
							<td nowrap class="monster">Caris</td>
							<td nowrap class="monster">Druids</td>
							<td nowrap class="monster">Dusseldorn</td>
							<td nowrap class="monster">Druids<sup>&dagger;</sup></td>
							<td nowrap class="monster">Syl (F)<br>Riemin (M)<br>Mina (F)</td>
							<td nowrap class="TDright monster">50<br>50<br>50</td>
						</tr>
						<tr>
							<td nowrap class="monster">Frobo</td>
							<td nowrap class="monster"><%=Elk_and_Stag%> (tavern)</td>
							<td nowrap class="monster">Whyme</td>
							<td nowrap class="monster">Silent partner and half owner</td>
							<td nowrap class="TDcenter monster">&nbsp;</td>
							<td nowrap class="TDcenter monster">n/a</td>
						</tr>
						<tr>
							<td nowrap class="monster">Frobo</td>
							<td nowrap class="monster"><%=Hollows_Brewery%> (brewery)</td>
							<td nowrap class="monster">Whyme</td>
							<td nowrap class="monster">Half owner</td>
							<td nowrap class="TDcenter monster"><%=Hollows_Brewery%></td>
							<td nowrap class="TDcenter monster">n/a</td>
						</tr>
					</table>
					<sup>*</sup> Unskilled laborer<br>
					<sup>&dagger;</sup> Skilled laborer

				<p>
					The party is well know for their seasonal festivals, each of the primary members pumping lots of gold into the <%=Whyme%> economy to cover events, entertainers, food, and beer.
					The <%=Bruisers%> put on displays of strength, while <%=Rebekah%> wanders about town entertaining the townsfolk with songs and stories, some traditional, some of her own composition.
					However, the highlight of each day are the displays of magic conducted by the spell casters.
					And of course, <%=Frix%> is always wandering the crowd as a good will ambassador for her father and friends.
				</p>
				<p>
					As the word of the town's prosperity spread, people from other regions of the valley began to move to the wealthy hollow, hoping to improve their lives.
					While most of these people were common laborers (mainly for all of <%=Caris%>'s projects), a few were skilled artisans.
					These include, but are not limited to:
					<table class="monster" width=830px>
						<tr valign="bottom" class="monsterhead">
							<th class="TDcenter">Business</th>
							<th class="TDcenter">Owner</th>
						</tr>
						<tr>
							<td nowrap class="monster"><%=Hollows_Brewery%></td>
							<td nowrap class="monster"><%=Frobo%>, <%=Glothil_Stoneheart%> (Dwarven brewer) & <%=Begnym_Solmorn%> (Gnome)</td>
						</tr>
						<tr>
							<td nowrap class="monster">Blacksmith</td>
							<td nowrap class="monster"><i>Smitty</i>(<%=Aerethel%> apprentices there in the winter</td>
						</tr>
						<tr>
							<td nowrap class="monster">Baker</td>
							<td nowrap class="monster">TBD</td>
						</tr>
						<tr>
							<td nowrap class="monster">Cooper</td>
							<td nowrap class="monster">TBD</td>
						</tr>
						<tr>
							<td nowrap class="monster">Carpenter</td>
							<td nowrap class="monster">TBD</td>
						</tr>
						<tr>
							<td nowrap class="monster">Joiner</td>
							<td nowrap class="monster">TBD</td>
						</tr>
						<tr>
							<td nowrap class="monster">Cobbler</td>
							<td nowrap class="monster">TBD</td>
						</tr>
						<tr>
							<td nowrap class="monster">Taxidermist</td>
							<td nowrap class="monster">Tom - sent by <%=King_Max%> though services are at normal <%=Taxidermy%> prices</td>
						</tr>
					</table>
				</p>

				<p>
					<%=Caris%> has invested <u><i>heavily</i></u> in the town to make improvements.
					He has convinced the others to invest as well, but the Baron is the primary investor.
					Some of these are relatively short term, while others are multi-year long projects.
					These improvements include, but are not limited to:





	<a name="tabJump"></a>

	<div class="tabWrapper">
		<ul class="tabs tabGroup">
			<li>
				<a href="#tabJump" class="tabOne switch activeTab">Aerethel</a>
			</li>
			<li>
				<a href="#tabJump" class="tabTwo switch">Avalina</a>
			</li>
			<li>
				<a href="#tabJump" class="tabThree switch">Caris</a>
			</li>
			<li>
				<a href="#tabJump" class="tabFour switch">Frobo</a>
			</li>
			<li>
				<a href="#tabJump" class="tabFive switch">Party</a>
			</li>
		</ul>
		<div class="tabContent">
		<p class="tab" id="tabOne">This is Aerethel the Paladin's stuff.
<!--
			<table class="brown" width=750px>
				<tr valign="bottom" class="brownhead">
					<th class="TDcenter">Item</th>
					<th class="TDcenter">Cost</th>
				</tr>
				<tr>
					<td nowrap class="brown">Weekly meals</td>
					<td nowrap class="brownR">175 gp</td>
				</tr>
				<tr>
					<td nowrap class="brown">House expansion</td>
					<td nowrap class="brownR">250 gp</td>
				</tr>
				<tr>
					<td nowrap class="brown">Begun construction on a temple to <%=St_Cuthbert%></td>
					<td nowrap class="brownR">10,000 gp</td>
				</tr>
				<tr>
					<td nowrap class="brown">Built a training hall to help train the peasants in minimal martial skills</td>
					<td nowrap class="brownR">2,500 gp</td>
				</tr>
				<tr>
					<td nowrap class="brown">Built a new smithy for the new smith</td>
					<td nowrap class="brownR">2,500 gp</td>
				</tr>
				<tr>
					<td nowrap class="brown">Upgrades to <%=Darrin%>, the 2nd largest town in the valley</td>
					<td nowrap class="brownR">2,000 gp</td>
				</tr>
				<tr>
					<td nowrap class="brown">Upgrades the other communities in the valley</td>
					<td nowrap class="brownR">6,000 gp</td>
				</tr>
				<tr>
					<td nowrap class="brown">item</td>
					<td nowrap class="brownR">gold gp</td>
				</tr>
				<tr>
					<td nowrap class="brown">item</td>
					<td nowrap class="brownR">gold gp</td>
				</tr>
			</table>
-->
		</p>
		<p class="tab" id="tabTwo">This is Avalina the Druid's stuff.</p>
		<p class="tab" id="tabThree">This is Caris the Wizard's stuff.</p>
		<p class="tab" id="tabFour">This is Frobo the Rogue's stuff.</p>
		<p class="tab" id="tabFive">This is Party stuff.</p>
		</div>
	</div>












					<ul class="circle2" style="margin-left: 30px;">

						<li><%=Aerethel%>
							<ul class="circle2" style="margin-left: 30px;">
								<li>Weekly meals (175 gp)</li>
								<li>House expansion (250 gp)</li>
								<li>Begun construction on a temple to <%=St_Cuthbert%> (10,000 gp )</li>
								<li>Built a training hall to help train the peasants in minimal martial skills (2,500 gp)</li>
								<li>Built a new smithy for the new smith (2,500 gp)</li>
								<li>Upgrades to <%=Darrin%>, the 2nd largest town in the valley (2,000 go)</li>
								<li>Upgrades the other communities in the valley (6,000 gp)</li>
							</ul>
						</li>

						<li><%=Avalina%>
							<ul class="circle2" style="margin-left: 30px;">
								<li>Weekly meals (175 gp)</li>
								<li>House expansion (250 gp)</li>
								<li>Using some of the excess rock from the mines to build cobblestone streets (110 gp/month for 1 dwarven foreman & 10 laborers - 1 year</li>
								<li>With some of the local Druids, have used <%=Plant_Growth%> to create a wall of Hawthorns, Briers, Rhododendrons and other flora, making it extremely hard to simply reach the berm</li>
								<li>Used magic to grow and shape (20) elegant "streetlight-trees", upon which, reflective lanterns have been hung with <%=Continual_Flame%> spells to act as the light sources (100 gp/light)</li>
							</ul>
						</li>

						<li><%=Caris%>
							<ul class="circle2" style="margin-left: 30px;">
								<li>An earthen berm has been built surrounding <%=Whyme%>, with a wooden palisade at the top</li>
								<li>Tunics for most of the employees (soldiers, common staff, etc.) to give the feeling of uniformity and identity</li>
								<li>Using <%=Fabricate%> to help build all new structures, vastly reducing the cost and time</li>
								<li>(8) cisterns have been build underground evenly spaced around the edge of town (2 skilled 18 unskilled to build 8 cisterns 2,554 gp for 1 year)</li>
								<li>(7) new guards<sup>*</sup></li>
								<li>A small school has been built with minor accommodations for students to learn basic skills during the winter (when there is little to do on a farm) - 2.500 gp</li>
								<li>Teacher for the school (56gp/month)<sup>*</sup></li>
								<li>Trading post/dorms (2,500 gp)<sup>*</sup></li>
								<li>Skilled laborer to track the public lodging of new comers to the valley (672 gp)</li>
								<li>(2) ballista crews (red team and blue team) - 73 gp/month/team<sup>*</sup></li>
							</ul>
						</li>

						<li><%=Frobo%>
							<ul class="circle2" style="margin-left: 30px;">
								<li>(2) ballistas (1,000 gp each)</li>
							</ul>
						</li>
					</ul>
					<sup>*</sup> covered by population increase and taxation
				</p>

				<p>
					As a show of strength, power and bravado, the grand hall (and the underground <i>Ironman room</i>) displays all the party's trophies.
					These include:
					<ul class="circle2" style="margin-left: 30px;">
						<li>Stuffed <%=Chimera%> head mounted on the wall</li>
						<li>Pair of crossed <%=Frost_Giant%> axes</li>
						<li>Stuffed <%=Remorhaz%> head</li>
						<li>Tiger skin</li>
						<li>An ancient, regal throne/chair (worth 5,000 gp)</li>
						<li>Magical tapestry</li>
						<li><%=Chasme_Demon%> (destroyed by <%=Borin%>)</li>
						<li><%=Behir%> head</li>
						<li>Platinum broach with a symbol of Loth Gp 2500</li>
						<li><%=Hill_Giant_Chieftain%>'s CrossBow</li>
						<li>Iron ingots (likely given to <%=Aerethel%>)</li>
						<li>(3) large brass gongs & mallets</li>
						<li>Stuffed <%=Glarbezu_Demon%> (destroyed by <%=Borin%> - 3,000 gp)</li>
						<li>Stuffed <%=Nalfeshnee_Demon%> (destroyed by <%=Borin%> - 4,000 gp)</li>
						<li>Adult <%=Black_Dragon%> Head - 1,800 gp</li>
						<li>Hundreds of <%=Black_Dragon%> scales</li>
						<li>more</li>
					</ul>
				</p>






				<div style="height: 0px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>





		<a name="Bradis"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>Bradis</h1>
					<h2>A small farming village in the north west of Dusseldorn Hollow</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<p>
					This village is in the north western edge of the valley, about 10 miles from <%=Whyme%>.
					There are multiple shepherds in the higher elevations who tend to flocks of sheep and goats.
				</p>

				<div style="height: 100px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>





		<a name="Wurzback"></a>
		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div class="section-left">
				<div class="creature-heading">
					<h1>W&uuml;rzback</h1>
					<h2>A small mining community in the west of Dusseldorn Hollow</h2>
				</div>
				<svg height="5" width="100%" class="tapered-rule">
					<polyline points="0,0 875,2.5 0,5"></polyline>
				</svg>

				<p>
					The village is relatively new, having been established by <%=Baron_Caris_Ivsaar%> to mine for gems to supplement the cost of running <%=Dusseldorn_Hollow%>.
					The community is made up of humans and dwarves and their families.
					Other than a simple general store and a small tavern, there are no other businesses.
				</p>

				<div style="height: 100px;"></div>
			</div>

			<hr class="orange-border bottom" />
		</div>




		<div class="stat-block-spacer"></div>





<!-- #include file="i_footer.asp" -->


	</div>

	<script>
		$('.tabOne').click(function() {
			$('a.switch').removeClass("activeTab");
			$(this).addClass("activeTab");
			$("#tabOne").show();
			$("#tabTwo").hide();
			$("#tabThree").hide();
			$("#tabFour").hide();
			$("#tabFive").hide();
			event.preventDefault();
		});

		$('.tabTwo').click(function() {
			$('a.switch').removeClass("activeTab");
			$(this).addClass("activeTab");
			$("#tabOne").hide();
			$("#tabTwo").show()
			$("#tabThree").hide();
			$("#tabFour").hide();
			$("#tabFive").hide();
			event.preventDefault();
		});

		$('.tabThree').click(function() {
			$('a.switch').removeClass("activeTab");
			$(this).addClass("activeTab");
			$("#tabOne").hide();
			$("#tabTwo").hide();
			$("#tabThree").show();
			$("#tabFour").hide();
			$("#tabFive").hide();
			event.preventDefault();
		});

		$('.tabFour').click(function() {
			$('a.switch').removeClass("activeTab");
			$(this).addClass("activeTab");
			$("#tabOne").hide();
			$("#tabTwo").hide();
			$("#tabThree").hide();
			$("#tabFour").show();
			$("#tabFive").hide();
			event.preventDefault();
		});

		$('.tabFive').click(function() {
			$('a.switch').removeClass("activeTab");
			$(this).addClass("activeTab");
			$("#tabOne").hide();
			$("#tabTwo").hide();
			$("#tabThree").hide();
			$("#tabFour").hide();
			$("#tabFive").show();
			event.preventDefault();
		});
	</script>

</body>
</html>
