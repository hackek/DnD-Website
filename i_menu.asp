	<!-- This is the standard menu for each web page -->
	<!-- Based on code from Stu Nicholls -->
<!--	<div class="navbar">	-->


		<ul id="NewNav">
			<li class="top"><a href="default.asp<%=Arg%>" class="top_link"><span>Home</span></a></li>





			<li class="top"><a href="#" id="places" class="top_link"><span class="down">Places</span></a>
				<ul class="sub">
					<li><a href="#" class="fly">Regions</a>
						<ul>
							<li><a href="#" class="fly">Mellys Valley</a>
								<ul>
									<li><b>Cities</b></li>
									<li><a href="F149-243.asp<%=Arg%>#Clearwasser" class="fly">Clearwasser</a>
										<ul>
											<li><a href="F149-243.asp<%=Arg%>#Clearwasser">Temple of St. Cuthbert</a></li>
											<li><a href="F149-243.asp<%=Arg%>">Rising Sun Tavern</a></li>
											<li><a href="F149-243.asp<%=Arg%>">Fellowship of Hussain</a></li>
										</ul>
									</li>
									<li><b>Towns</b></li>
									<li><a href="F150-242.asp<%=Arg%>#Darrin">Darrin</a></li>
									<li><a href="F149-244.asp<%=Arg%>#Hollis" class="fly">Hollis</a>
										<ul>
											<li><a href="F149-244.asp<%=Arg%>#The_Black_Swan">The Black Swan</a></li>
										</ul>
									</li>
									<li><a href="F149-242.asp<%=Arg%>#Whyme" class="fly">Whyme</a>
										<ul>
											<li><a href="F149-242.asp<%=Arg%>#Whyme">Elk & Stag Inn</a></li>
										</ul>
									</li>


									<li><b>Fortifications</b></li>
									<li><a href="F149-243.asp<%=Arg%>#Mellys_Castle">Mellys Castle</a></li>
									<li><a href="F149-245.asp<%=Arg%>#Southgate">Southgate</a></li>

									<li><b>Temples</b></li>
									<li><a href="F149-243.asp<%=Arg%>#Clearwasser">Temple of St. Cuthbert</a></li>
									<li><a href="F149-243.asp<%=Arg%>#Temple_of_Fharlanghn_Borin">Temple of Fharlanghn</a></li>

									<li><b>Valleys</b></li>
									<li><%=Mellys_Valley_Map%></li>
									<li><%=Dusseldorn_Hollow_Map%></li>
								</ul>
							</li>

<% if (userId = "DM") or (Campaign = "2") then %>
							<li><a href="#" class="fly">Ruhr Valley</a>
								<ul>
									<li><a href="#" class="fly">Western Valley</a>
										<ul>
											<li><a href="F149-245.asp<%=Arg%>#Southgate">Southgate</a></li>
											<li><a href="F149-245.asp<%=Arg%>#Caerbannog">Caerbannog</a></li>
											<li><a href="F149-245.asp<%=Arg%>#SanctuaryCave1">Sanctuary Cave 1</a></li>
										</ul>
									</li>
									<li><a href="#" class="fly">Central Valley</a>
										<ul>
											<li><a href="F150-245.asp<%=Arg%>#Jakalla">Ruins of Jakalla</a></li>
											<li><a href="F150-245.asp<%=Arg%>#Tribal_Village1">Tribal Village</a></li>
											<li><a href="F150-245.asp<%=Arg%>#WitchDoctorCave">Witchdoctor Cave</a></li>
											<li><a href="F150-245.asp<%=Arg%>#SanctuaryCave2">Sanctuary Cave 2</a></li>
											<li><a href="F150-245.asp<%=Arg%>#SanctuaryCave3">Sanctuary Cave 3</a></li>
										</ul>
									</li>
									<li><a href="#nogo38" class="fly">Eastern Valley</a>
										<ul>
											<li><a href="F151-246.asp<%=Arg%>#The_Arch">The Arch</a></li>
											<li><a href="F151-246.asp<%=Arg%>#Bosigraud_Lake">Bosgiraud Lake</a></li>
											<li><a href="F151-246.asp<%=Arg%>#The_Eagles_Nest">The Eagles Nest</a></li>
											<li><a href="F151-246.asp<%=Arg%>#Grunes_Zuhause">Grunes Zuhause</a></li>
											<li><a href="F151-246.asp<%=Arg%>#SanctuaryCave4">Sanctuary Cave 4</a></li>
										</ul>
									</li>
									<li><a href="#nogo38" class="fly">Eastern Tip</a>
										<ul>
											<li><a href="F152-245.asp<%=Arg%>#Bosigraud_Lake">Bosgiraud Lake</a></li>
											<li><a href="F152-245.asp<%=Arg%>#Durahl_Durh">Durahl-Durh</a></li>
										</ul>
									</li>
								</ul>
							</li>
<% end if %>


<% if (userId = "DM") or (Campaign = "2") then %>
							<li><a href="#" class="fly">Durhahl Valley</a>
								<ul>
									<li><a href="F152-245.asp<%=Arg%>" class="fly">Western Edge</a>
										<ul>
											<li><a href="F152-245.asp<%=Arg%>#Durahl_Durh">Durahl-Durh</a></li>
										</ul>
									</li>
									<li><a href="F153-245.asp<%=Arg%>" class="fly">Western Central</a>
										<ul>
											<li><a href="F153-245.asp<%=Arg%>#Kun">Kuhn</a></li>
											<li><a href="F153-245.asp<%=Arg%>#Wilson_Farm">Wilson Farm</a></li>
											<li><a href="F153-245.asp<%=Arg%>#Cave_of_Pentagornaphoria">Cave of Pentagornaphoria</a></li>
											<li><a href="F153-245.asp<%=Arg%>#Ruhrbach_Falls">Ruhbach Falls</a></li>
										</ul>
									</li>
									<li><a href="F154-245.asp<%=Arg%>">Eastern Central</a></li>
									<li><a href="F155-245.asp<%=Arg%>" class="fly">Eastern</a>
										<ul>
											<li><a href="F155-245.asp<%=Arg%>#Kelzad">Kelzad</a></li>
											<li><a href="F155-245.asp<%=Arg%>#Termlane_Forest">The Termlane Forest</a></li>
										</ul>
									</li>
								</ul>
							</li>
<% end if %>


<% if (userId = "DM") or (Campaign = "2") then %>
							<li><a href="#" class="fly">Kelzad - Loftwick</a>
								<ul>
									<li><a href="F155-245.asp<%=Arg%>#Kelzad">Kelzad</a></li>
									<li><a href="F156-245.asp<%=Arg%>">Fields of Kelzad</a></li>
									<li><a href="F157-245.asp<%=Arg%>">Western High Crags</a></li>
									<li><a href="F157-246.asp<%=Arg%>" class="fly">Kelzad/Loftwick Road</a>
										<ul>
											<li><a href="F157-246.asp<%=Arg%>#The_Hill_Giant_Steading">The Hill Giant Steading</a></li>
										</ul>
									</li>
								</ul>
							</li>
<% end if %>


<% if (userId = "DM") or (Campaign = "2") then %>
							<li><a href="#" class="fly">Ur-Un Valley</a>
								<ul>
									<li><a href="#" class="fly">Western Valley</a>
										<ul>
											<li><a href="F160-246.asp<%=Arg%>#Loftwick">Loftwick</a></li>
											<li><a href="F160-246.asp<%=Arg%>#Katz">Katz Castle</a></li>
											<li><a href="F160-246.asp<%=Arg%>#Marksburg">Castle Marksburg</a></li>
											<li><a href="F160-246.asp<%=Arg%>#The_Eagles_Nest">The Eagles Nest</a></li>
											<li><a href="F160-246.asp<%=Arg%>#Raveslan">Raveslan</a></li>
										</ul>
									</li>
									<li><a href="#" class="fly">Eastern Valley</a>
										<ul>
											<li><a href="F161-245.asp<%=Arg%>#Darby">Darby</a></li>
											<li><a href="F161-245.asp<%=Arg%>#Karlstejn_Castle">Kalstejn Castle</a></li>
											<li><a href="F161-245.asp<%=Arg%>#Gwynedd_Castle">Gwynedd Castle</a></li>
											<li><a href="F161-245.asp<%=Arg%>#Ruins_Near_Darby">Ruins</a></li>
										</ul>
									</li>
								</ul>
							</li>
<% end if %>


<% if (userId = "DM") or (Campaign = "2") then %>
							<li><a href="#" class="fly">Farn Lake</a>
								<ul>
									<li><a href="F162-243.asp<%=Arg%>" class="fly">The Bowl</a>
										<ul>
											<li><a href="F162-243.asp<%=Arg%>#The_Lost_City_of_Tor_a_Jarq">Necropolis of Tor-a-Jarq</a></li>
										</ul>
									</li>
									<li><a href="F163-242.asp<%=Arg%>" class="fly">The Cool Mist Forest</a>
										<ul>
											<li><a href="F163-242.asp<%=Arg%>#Yvalond">Yvalond</a></li>
											<li><a href="F163-242.asp<%=Arg%>">Sacred Grove</a></li>
										</ul>
									</li>
									<li><a href="F164-242.asp<%=Arg%>" class="fly">Open Fields</a>
										<ul>
											<li><a href="F164-242.asp<%=Arg%>#Greenest">Greenest</a></li>
										</ul>
									</li>
									<li><a href="F163-243.asp<%=Arg%>" class="fly">Open Fields</a>
										<ul>
											<li><a href="F163-243.asp<%=Arg%>#The_Burrows">The Burrows</a></li>
										</ul>
									</li>
									<li><a href="F162-244.asp<%=Arg%>">The Bend</a></li>
									<li><a href="F163-244.asp<%=Arg%>" class="fly">Western Farn Lake</a>
										<ul>
											<li><a href="F163-244.asp?userId=DM#Portsmouth">Portsmouth</a></li>
											<li><a href="F163-244.asp<%=Arg%>#Delar_Kars_Tower">Riverbend</a></li>
											<li><a href="F163-244.asp<%=Arg%>#Delar_Kars_Tower">Delar' Kar's Tower</a></li>
										</ul>
									</li>
									<li><a href="F164-243.asp<%=Arg%>" class="fly">Northern Farn Lake</a>
										<ul>
											<li><a href="F164-243.asp<%=Arg%>#Dunral">Dunral</a></li>
											<li><a href="F164-243.asp<%=Arg%>#The_Valley_of_the_Chosen">Valley of the Chosen</a></li>
											<li><a href="F164-243.asp<%=Arg%>#The_Old_Man">The Old Man</a></li>
											<li><a href="F164-243.asp<%=Arg%>#Crypt_of_Zolba_a_Na_Exterior">Crypt of Zolba-a-Na</a></li>
										</ul>
									</li>
									<li><a href="F164-244.asp<%=Arg%>" class="fly">Southern Farn Lake</a>
										<ul>
											<li><a href="F164-244.asp<%=Arg%>#Dagger_Falls">Dagger Falls</a></li>
										</ul>
									</li>
									<li><a href="F165-244.asp<%=Arg%>" class="fly">Easter Farn Lake</a>
										<ul>
											<li><a href="F165-244.asp<%=Arg%>#Farriers_Ramp">Farrier's Ramp</a></li>
											<li><a href="F165-244.asp<%=Arg%>#The_Outpost">The Outpost</a></li>
										</ul>
									</li>
								</ul>
							</li>
<% end if %>
<% if (userId = "DM") or (Campaign = "2") then %>
							<li><a href="#" class="fly">Dry Steppes</a>
								<ul>
									<li><a>The Sultanate of Arir</a>
										<ul>
											<li><a>Bab-al-Djebel Oasis</a></li>
											<li><a>Beni-Waha Oasis</a></li>
											<li><a>Bou-Farfa Oasis</a></li>
											<li><a>Ksar-es-Nefad Oasis - destroyed</a></li>
											<li><a>Khaibar - Capital City</a></li>
											<li><a>Lake of Death</a></li>
										</ul>
									</li>
									<li><a>Lands of the Hokrodden</a>
										<ul>
											<li><a>Kanak - Capital City</a></li>
											<li><a>Karnoosh Hills</a></li>
											<li><a>Tovag Baragu</a></li>
											<li><a>Lake Udrukankar</a></li>
											<li><a>Rumikalath River</a></li>
										</ul>
									</li>
								</ul>
							</li>
<% end if %>
						</ul>
					</li>

					<li><a href="#" class="fly">Cities</a>
						<ul>
							<li><b>Human</b></li>
							<li><a href="F149-243.asp<%=Arg%>#Clearwasser">Clearwasser</a></li>
<% if (userId = "DM") or (Campaign = "2") then %>
							<li><a href="F161-245.asp<%=Arg%>#Darby">Darby</a></li>
							<li><a href="F155-245.asp<%=Arg%>#Kelzad">Kelzad</a></li>
							<li><a href="F160-246.asp<%=Arg%>#Loftwick" class="fly">Loftwick</a>
								<ul>
									<li><a href="Vanderboren_Manor.asp<%=Arg%>">Vanderboren Manor</a>
								</ul>
							</li>
							<li><a>Khaibar - Paynim City</a></li>
							<li><a>Kanak - Paynim City</a></li>
<% end if %>
							<li><b>Dwarf</b></li>
							<li><a href="#">Beg Moldir</a></li>
							<li><a href="F149-245.asp<%=Arg%>#Caerbannog">Caerbannog</a></li>
							<li><a href="F152-245.asp<%=Arg%>#Durahl_Durh">Durahl-Durh</a></li>
<% if (userId = "DM") or (Campaign = "2") then %>
							<li><b>Elf</b></li>
							<li><a href="F163-242.asp<%=Arg%>#Yvalond">Yvalong</a></li>
<% end if %>
						</ul>
					</li>


					<li><a href="#" class="fly">Towns</a>
						<ul>
							<li><b>Human</b></li>
<% if (userId = "DM") or (Campaign = "2") then %>
							<li><a href="F164-244.asp<%=Arg%>#Dagger_Falls">Dagger Falls</a></li>
							<li><a href="F150-242.asp<%=Arg%>#Darrin">Darrin</a></li>
							<li><a href="F164-243.asp<%=Arg%>#Dunral">Dunral</a></li>
							<li><a href="F164-242.asp<%=Arg%>#Greenest">Greenest</a></li>
							<li><a href="F149-244.asp<%=Arg%>#Hollis">Hollis</a></li>
							<li><a href="F153-245.asp<%=Arg%>#Kun">Kuhn</a></li>
							<li><a href="F163-244.asp?userId=DM#Portsmouth">Portsmouth</a></li>
							<li><a href="F163-244.asp<%=Arg%>#Delar_Kars_Tower">Riverbend</a></li>
<% end if %>
							<li><a href="F149-242.asp<%=Arg%>#Whyme">Whyme</a></li>
<% if (userId = "DM") or (Campaign = "2") then %>
							<li><b>Halfling</b></li>
							<li><a href="F163-243.asp<%=Arg%>#The_Burrows">The Burrows</a></li>
							<li><b>Dwarf</b></li>
							<li><a href="xxx">xxxx</a></li>
							<li><b>Elf</b></li>
							<li><a href="xxx">xxxx</a></li>
<% end if %>
						</ul>
					</li>

<% if (userId = "DM") or (Campaign = "2") then %>
					<li><a href="#" class="fly">Dungeons/Ruins</a>
						<ul>
							<li><a href="F164-243.asp<%=Arg%>#Crypt_of_Zolba_a_Na_Exterior">Crypt of Zolba-a-Na</a></li>
							<li><a href="F164-244.asp<%=Arg%>#Crypt_of_Charis_a_Na">Crypt of Charis-a-Na</a></li>
							<li><a href="F162-243.asp<%=Arg%>#The_Lost_City_of_Tor_a_Jarq">Necropolis of Tor-a-Jarq</a></li>
							<li><a href="F150-245.asp<%=Arg%>#Jakalla">Ruins of Jakalla</a></li>
							<li><a href="F161-245.asp<%=Arg%>#Ruins_Near_Darby">Ruins near Darby</a></li>
						</ul>
					</li>
<% end if %>

<% if (userId = "DM") or (Campaign = "2") then %>
					<li><a href="#" class="fly">Planes</a>
						<ul>
<% if (userId = "DM") then %>
							<li><a target="_blank" href="https://dumpstatadventures.com/the-gm-is-always-right/the-planes-astral-plane" target="_blank">Astral Plane</a></li>
<% end if %>
							<li><a href="#" class="fly">Hells</a>
								<ul>
									<li><a href="Hell4.asp<%=Arg%>#">4th - Phlegethos</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li><%=Everything_Map%></li>
<% end if %>
				</ul>
			</li>







<% if (userId = "DM") or (Campaign = "2") or (Campaign = "3") then %>
			<li class="top"><a href="#" id="backStories" class="top_link"><span class="down">Back Stories</span></a>
				<ul class="sub">
<% if (userId = "DM") or (Campaign = "2") then %>
					<li><a href="Back_Stories2.asp<%=Arg%>" class="fly">Campaign 2</a>
						<ul>
							<li><a href="Back_Stories2.asp<%=Arg%>#Caris_Ivsaar">Caris</a></li>
							<li><a href="Back_Stories2.asp<%=Arg%>#Frobo_Oglethorpe">Frobo</a></li>
							<li><a href="Back_Stories2.asp<%=Arg%>#Aerethel">Aerethel</a></li>
							<li><a href="Back_Stories2.asp<%=Arg%>#Balthazar">Balthazar</a></li>
						</ul>
					</li>
<% end if %>
<% if (userId = "DM") or (Campaign = "3") then %>
					<li><a href="Back_Stories3.asp<%=Arg%>" class="fly">Campaign 3</a>
						<ul>
							<li><a href="Back_Stories3.asp<%=Arg%>#Alti_Reyt ">Alti Reyt</a></li>
							<li><a href="Back_Stories3.asp<%=Arg%>#Amanthi ">Amanthi</a></li>
							<li><a href="Back_Stories3.asp<%=Arg%>#Kwartz ">Kwartz</a></li>
							<li><a href="Back_Stories3.asp<%=Arg%>#Lee_Daers ">Lee_Daers</a></li>
							<li><a href="Back_Stories3.asp<%=Arg%>#Sigfried_Miller ">Sigfried_Miller</a></li>
							<li><a href="Back_Stories3.asp<%=Arg%>#Tragin ">Tragin</a></li>
							<li><a href="Back_Stories3.asp<%=Arg%>#Winlocke ">Winlocke</a></li>
						</ul>
					</li>
<% end if %>
				</ul>
			</li>
<% end if %>






<% if (userId = "DM") or (Campaign = "2") or (Campaign = "3") then %>
			<li class="top"><a href="Gear.asp<%=Arg%>" class="top_link"><span>Gear</span></a></li>
<% end if %>







			<li class="top"><a href="#" id="maps" class="top_link"><span class="down">Maps</span></a>
				<ul class="sub">
					<li><a href="https://www.annabmeyer.com/greyhawk-maps/online-map-1/" target="_blank">Oerth Map</a></li>
					<li><a href="https://easyzoom.com/image/151627" target="_blank">Oerth Map w/ Hexes</a></li>
					<li><a href="https://www.annabmeyer.com/greyhawk-maps/" target="_blank">Anna's Page</a></li>

					<li><a href="./images/Places/Clothos/Highwalls_Clothos1.png" target="_blank" >Map #1</a></li>
					<li><a href="./images/Places/Clothos/Highwalls_Clothos2.png" target="_blank" >Map #2</a></li>
					<li><a href="./images/Places/Clothos/Highwalls_Clothos3.png" target="_blank" >Map #3</a></li>
<% if (userId = "DM") or (Campaign = "2") then %>
					<li><a href="./images/Places/Clothos/Everything.png" target="_blank" >Everything</a></li>
<% end if %>
				</ul>
			</li>







<% if (userId = "DM") then %>
			<li class="top"><a href="#" id="DM" class="top_link"><span class="down">DM</span></a>
				<ul class="sub">
					<li><a href="#" class="fly">Internal</a>
						<ul>
							<li><a href="Ideas.asp<%=Arg%>">Ideas</a></li>
							<li><a href="NPC_Templates.asp<%=Arg%>">NPC Templates</a></li>
							<li><a href="Astral_Ships.asp<%=Arg%>">Githyanki Astral Ships</a></li>
							<li><a href="Bad_Guys.asp<%=Arg%>">Bad Guys</a></li>
							<li><a href="Mystic.asp<%=Arg%>">Mystic</a></li>
							<li><a href="TreasureGenerator.asp<%=Arg%>">Treasure Generator</a></li>
							<li><a href="Keep_of_Clothos_Descs.asp<%=Arg%>">The Keep of Clothos D</a></li>
							<li><a href="Keep_of_Clothos_Maps.asp<%=Arg%>">The Keep of Clothos M</a></li>
							<li><a href="./images/Places/Dungeons/Necropolis_Master.jpg" target="_blank" >Necropolis</a></li>
							<li><a href="./images/Places/Dungeons/Charis/Crypt_of_Charis_a_Na_Full.png" target="_blank" >Charis Master</a></li>
							<li><a href="./images/Places/Clothos/Everything.png" target="_blank" >Clothos Everything</a></li>


						</ul>
					</li>
					<li><a href="#" class="fly">External</a>
						<ul>
							<li><a target="_blank" href="https://5e.tools/" target="_blank">5etools</a></li>
							<li><a target="_blank" href="https://www.dndbeyond.com/" target="_blank">D&D Beyond</a></li>
							<li><a target="_blank" href="https://www.wizards.com/dnd/dice/dice.htm" target="_blank">Dice Roller</a></li>
							<li><a target="_blank" href="https://adventurelookup.com/adventures/" target="_blank">Adventure Lookup</a></li>
							<li><a target="_blank" href="https://www.pbegames.com/gemstone/" target="_blank">Gem Generator</a></li>
							<li><a target="_blank" href="https://thetrove.net/Books/Dungeons%20&%20Dragons/D&D%205th%20Edition/Core/index.html" target="_blank">All Books in PDF</a></li>
							<li><a target="_blank" href="https://kobold.club/fight/#/encounter-builder" target="_blank">Kobald Fight Club</a></li>
							<li><a target="_blank" href="http://greyhawk.wikia.com/wiki/Main_Page" target="_blank">Greyhawk Wiki</a></li>
							<li><a target="_blank" href="https://www.5thsrd.org/" target="_blank">5th Edition SRD</a></li>
							<li><a target="_blank" href="https://deathbymage.com/2017/09/12/guide-to-the-feywild-the-summer-court/" target="_blank">Guide to the Feywild - the Summer Court</a></li>
							<li><a target="_blank" href="https://deathbymage.com/2017/09/21/guide-to-the-feywild-the-autumn-court/" target="_blank">Guide to the Feywild - the Autumn Court</a></li>
							<li><a target="_blank" href="http://dndbits.com/dm_screen.php" target="_blank">Tables</a></li>
							<li><a target="_blank" href="https://www.miniaturemarket.com/collectible-miniatures/dungeons-dragons.html">Miniature Market</a></li>
							<li><a target="_blank" href="http://www.meeplemart.com/store/c/3917-Fantasy-Miniatures-3917.aspx">Meeplemart</a></li>
							<li><a target="_blank" href="https://beta.trollandtoad.com/d-d-swm-more-minis/1285">Troll and Toad</a></li>
							<li><a target="_blank" href="https://www.coolstuffinc.com/page/1907">Cool Stuff Inc</a></li>
							<li><a target="_blank" href="https://www.minisgallery.com/index.php">Minis Gallery</a></li>
							<li><a target="_blank" href="https://www.heroforge.com/">Hero Forge</a></li>
							<li><a target="_blank" href="http://dndspeak.com/2018/08/100-useless-people-you-find-on-a-failed-gather-information-check/">100 Useless People</a></li>
							<li><a target="_blank" href="http://dndspeak.com/2018/05/100-jobs-posted-to-a-tavern-community-board/">100 Job Postings</a></li>
							<li><a target="_blank" href="https://thetrove.net/Books/Dungeons%20&%20Dragons/5th%20Edition%20(5e)/3rd%20Party/%20DMsGuild/Dragonix/">Dragonix</a></li>
						</ul>
					</li>
				</ul>
			</li>
<% end if %>








<% if (userId = "DM") or (Campaign = "2") or (Campaign = "3") then %>
			<li class="top"><a href="#" id="recap" class="top_link"><span class="down">Recap</span></a>
				<ul class="sub">
<% if (userId = "DM") or (Campaign = "2") then %>
					<li><a href="#" class="fly">Recap 2</a>
						<ul>
							<li><a href="#" class="fly">1 - 10</a>
								<ul>
									<li><a href="Recap_C2_001.asp<%=Arg%>">Session 1</a></li>
									<li><a href="Recap_C2_002.asp<%=Arg%>">Session 2</a></li>
									<li><a href="Recap_C2_003.asp<%=Arg%>">Session 3</a></li>
									<li><a href="Recap_C2_004.asp<%=Arg%>">Session 4</a></li>
									<li><a href="Recap_C2_005.asp<%=Arg%>">Session 5</a></li>
									<li><a href="Recap_C2_006.asp<%=Arg%>">Session 6</a></li>
									<li><a href="Recap_C2_007.asp<%=Arg%>">Session 7</a></li>
									<li><a href="Recap_C2_008.asp<%=Arg%>">Session 8</a></li>
									<li><a href="Recap_C2_009.asp<%=Arg%>">Session 9</a></li>
									<li><a href="Recap_C2_010.asp<%=Arg%>">Session 10</a></li>
								</ul>
							</li>
							<li><a href="#" class="fly">11 - 20</a>
								<ul>
									<li><a href="Recap_C2_011.asp<%=Arg%>">Session 11</a></li>
									<li><a href="Recap_C2_012.asp<%=Arg%>">Session 12</a></li>
									<li><a href="Recap_C2_013.asp<%=Arg%>">Session 13</a></li>
									<li><a href="Recap_C2_014.asp<%=Arg%>">Session 14</a></li>
									<li><a href="Recap_C2_015.asp<%=Arg%>">Session 15</a></li>
									<li><a href="Recap_C2_016.asp<%=Arg%>">Session 16</a></li>
									<li><a href="Recap_C2_017.asp<%=Arg%>">Session 17</a></li>
									<li><a href="Recap_C2_018.asp<%=Arg%>">Session 18</a></li>
									<li><a href="Recap_C2_019.asp<%=Arg%>">Session 19</a></li>
									<li><a href="Recap_C2_020.asp<%=Arg%>">Session 20</a></li>
								</ul>
							</li>
							<li><a href="#" class="fly">21 - 30</a>
								<ul>
									<li><a href="Recap_C2_021.asp<%=Arg%>">Session 21</a></li>
									<li><a href="Recap_C2_022.asp<%=Arg%>">Session 22</a></li>
									<li><a href="Recap_C2_023.asp<%=Arg%>">Session 23</a></li>
									<li><a href="Recap_C2_024.asp<%=Arg%>">Session 24</a></li>
									<li><a href="Recap_C2_025.asp<%=Arg%>">Session 25</a></li>
									<li><a href="Recap_C2_026.asp<%=Arg%>">Session 26</a></li>
									<li><a href="Recap_C2_027.asp<%=Arg%>">Session 27</a></li>
									<li><a href="Recap_C2_028.asp<%=Arg%>">Session 28</a></li>
									<li><a href="Recap_C2_029.asp<%=Arg%>">Session 29</a></li>
									<li><a href="Recap_C2_030.asp<%=Arg%>">Session 30</a></li>
								</ul>
							</li>
							<li><a href="#" class="fly">31 - 40</a>
								<ul>
									<li><a href="Recap_C2_031.asp<%=Arg%>">Session 31</a></li>
									<li><a href="Recap_C2_032.asp<%=Arg%>">Session 32</a></li>
									<li><a href="Recap_C2_033.asp<%=Arg%>">Session 33</a></li>
									<li><a href="Recap_C2_034.asp<%=Arg%>">Session 34</a></li>
									<li><a href="Recap_C2_035.asp<%=Arg%>">Session 35</a></li>
									<li><a href="Recap_C2_036.asp<%=Arg%>">Session 36</a></li>
									<li><a href="Recap_C2_037.asp<%=Arg%>">Session 37</a></li>
									<li><a href="Recap_C2_038.asp<%=Arg%>">Session 38</a></li>
									<li><a href="Recap_C2_039.asp<%=Arg%>">Session 39</a></li>
									<li><a href="Recap_C2_040.asp<%=Arg%>">Session 40</a></li>
								</ul>
							</li>
							<li><a href="#" class="fly">41 - 50</a>
								<ul>
									<li><a href="Recap_C2_041.asp<%=Arg%>">Session 41</a></li>
									<li><a href="Recap_C2_042.asp<%=Arg%>">Session 42</a></li>
									<li><a href="Recap_C2_043.asp<%=Arg%>">Session 43</a></li>
									<li><a href="Recap_C2_044.asp<%=Arg%>">Session 44</a></li>
									<li><a href="Recap_C2_045.asp<%=Arg%>">Session 45</a></li>
									<li><a href="Recap_C2_046.asp<%=Arg%>">Session 46</a></li>
									<li><a href="Recap_C2_047.asp<%=Arg%>">Session 47</a></li>
									<li><a href="Recap_C2_048.asp<%=Arg%>">Session 48</a></li>
									<li><a href="Recap_C2_049.asp<%=Arg%>">Session 49</a></li>
									<li><a href="Recap_C2_050.asp<%=Arg%>">Session 50</a></li>
								</ul>
							</li>
							<li><a href="#" class="fly">51 - 60</a>
								<ul>
									<li><a href="Recap_C2_051.asp<%=Arg%>">Session 51</a></li>
									<li><a href="Recap_C2_052.asp<%=Arg%>">Session 52</a></li>
									<li><a href="Recap_C2_053.asp<%=Arg%>">Session 53</a></li>
									<li><a href="Recap_C2_054.asp<%=Arg%>">Session 54</a></li>
									<li><a href="Recap_C2_055.asp<%=Arg%>">Session 55</a></li>
									<li><a href="Recap_C2_056.asp<%=Arg%>">Session 56</a></li>
									<li><a href="Recap_C2_057.asp<%=Arg%>">Session 57</a></li>
									<li><a href="Recap_C2_058.asp<%=Arg%>">Session 58</a></li>
									<li><a href="Recap_C2_059.asp<%=Arg%>">Session 59</a></li>
									<li><a href="Recap_C2_060.asp<%=Arg%>">Session 60</a></li>
								</ul>
							</li>
							<li><a href="#" class="fly">61 - 70</a>
								<ul>
									<li><a href="Recap_C2_061.asp<%=Arg%>">Session 61</a></li>
									<li><a href="Recap_C2_062.asp<%=Arg%>">Session 62</a></li>
									<li><a href="Recap_C2_063.asp<%=Arg%>">Session 63</a></li>
									<li><a href="Recap_C2_064.asp<%=Arg%>">Session 64</a></li>
									<li><a href="Recap_C2_065.asp<%=Arg%>">Session 65</a></li>
									<li><a href="Recap_C2_066.asp<%=Arg%>">Session 66</a></li>
									<li><a href="Recap_C2_067.asp<%=Arg%>">Session 67</a></li>
									<li><a href="Recap_C2_068.asp<%=Arg%>">Session 68</a></li>
								</ul>
							</li>


						</ul>
					</li>
<% end if %>
<% if (userId = "DM") or (Campaign = "3") then %>
					<li><a href="#" class="fly">Recap 3</a>
						<ul>
							<li><a href="#" class="fly">1 - 10</a>
								<ul>
									<li><a href="Recap_C3_001.asp<%=Arg%>">Session 1</a></li>
									<li><a href="Recap_C3_002.asp<%=Arg%>">Session 2</a></li>
									<li><a href="Recap_C3_003.asp<%=Arg%>">Session 3</a></li>
									<li><a href="Recap_C3_004.asp<%=Arg%>">Session 4</a></li>
								</ul>
							</li>
						</ul>
					</li>
<% end if %>
				</ul>
			</li>
<% end if %>








			<li class="top"><a href="#" id="ref" class="top_link"><span class="down">Ref</span></a>
				<ul class="sub">
					<li><a href="#" class="fly">Internal</a>
						<ul>
							<li><a href="Appendix.asp<%=Arg%>">Appendix</a></li>
							<li><a href="Calendar.asp<%=Arg%>">Calendar</a></li>
							<li><a href="Calculations.asp<%=Arg%>">Calculations</a></li>
							<li><a href="Deities.asp<%=Arg%>">Deities</a></li>
							<li><a href="House_Rules.asp<%=Arg%>">House Rules</a></li>
							<li><a href="Languages.asp<%=Arg%>">Languages</a></li>
							<li><a href="NPCs.asp<%=Arg%>">NPCs</a></li>
							<li><a href="NPC_Templates.asp<%=Arg%>">NPC Templates</a></li>
<!--							<li><a href="Sulois_History.asp<%=Arg%>">Sulois History (old)</a></li>	-->
							<li><a href="Timeline/default.asp<%=Arg%>">Sulois History (new)</a></li>
							<li><a href="Timeline/PartyHistory.asp<%=Arg%>">Party History</a></li>
							<li><a href="TreasureGenerator.asp<%=Arg%>">Treasure Generator</a></li>
						</ul>
					</li>
					<li><a href="#" class="fly">External</a>
						<ul>
							<li><a target="_blank" href="https://www.dndbeyond.com/">D&D Beyond</a></li>
							<li><a target="_blank" href="https://media.wizards.com/2020/dnd/downloads/SA-Compendium.pdf">Sage Advice</a></li>
							<li><a target="_blank" href="https://nerdsonearth.com/2016/06/brief-primer-different-editions-dungeons-and-dragons/">Versions of D&D</a></li>
							<li><a target="_blank" href="https://olddungeonmaster.com/2017/09/21/dd5e-character-sheet-rev7/">Character Sheets</a></li>
							<li><a target="_blank" href="https://www.battlefields.org/learn/articles/glossary-fortification-terms">Fortification Terms</a></li>
							<li><a target="_blank" href="https://olddungeonmaster.com/2012/06/10/gems/">Gems</a></li>
							<li><a target="_blank" href="https://olddungeonmaster.com/2016/12/07/dd-5e-item-weights/">Weights of Items</a></li>
							<li><a target="_blank" href="https://olddungeonmaster.com/2016/12/06/dd-5e-weights-of-materials/">Weights of Materials</a></li>
						</ul>
					</li>
				</ul>
			</li>





		</ul>


<!--	</div>	-->
