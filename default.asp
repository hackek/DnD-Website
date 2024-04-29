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
	<title>D&amp;D - Home</title>
	<!-- #include file="i_head.asp" -->
</head>

<body translate="no" >
	<div id="wrap">
		<!-- #include file="i_header.asp" -->
		<!-- #include file="i_menu.asp" -->

		<div class="stat-block fullwidth">
			<hr class="orange-border" />

			<div id="content">
<!--
				<div id="leftColumn">
					<div class="box">
						<div class="creature-heading">
							<h1>Places</h1>
						</div>
						<svg height="5" width="100%" class="tapered-rule">
							<polyline points="0,0 200,2.5 0,5"></polyline>
						</svg>

						<div class="boxContent">
						</div>
					</div>
				</div>
-->



				<div id="rightColumn">
					<div class="box">
						<div class="creature-heading">
							<h1>Member Login</h1>
						</div>
						<svg height="5" width="100%" class="tapered-rule">
							<polyline points="0,0 200,2.5 0,5"></polyline>
						</svg>
						<div class="boxContent">
							<div id="loginBox" style="height: 80px">
								<form action="default.asp<%=Arg%>" method="post">
<% if (userId = "") then %>
									<input type="text" name="userId" id="userId" value="username" class="loginInput" style="margin-bottom: 5px; border-width: 2px;"/><br />
									<input type="password" value="passwordhere" class="loginInput" style="margin-bottom: 5px; border-width: 2px;" /><br />
									<div id="loginButtons">
										<input type="submit" value="Login" class="loginButton" />
										<input type="button" value="Register" onclick="location.href='#'" class="loginButton" />
									</div>
<% else %>
									<input type="hidden" name="userId" id="userId" value="logout">
									<div id="loginButtons">
										<input type="submit" value="Logout" class="loginButton" />
									</div>
<% end if %>
								</form>
							</div>
						</div>
					</div>


<% if (userId = "DM") or (Campaign = "2") or (Campaign = "3") then %>
					<div class="box">
						<div class="creature-heading">
							<h1>Party Roster</h1>
						</div>
						<svg height="5" width="100%" class="tapered-rule">
							<polyline points="0,0 200,2.5 0,5"></polyline>
						</svg>
						<div class="boxContent">
							<div id="rosterBox">
								<table cellpadding="0" cellspacing="0" border="0" id="rosterTable">
<% if (userId = "DM") or (Campaign = "2") then %>
									<tr>
										<td><a href="Back_Stories2.asp<%=Arg%>#Caris_Ivsaar" onmouseover="ctRoster('Baron Caris Ivsaar<br>High Elf Wizard');" onmouseout="ctRosterClean();"><img src="./images/People/Party2/Caris_Ivsaar2_Head.png" alt="Caris Ivsaar"/></a></td>
										<td><a href="Back_Stories2.asp<%=Arg%>#Frobo_Oglethorpe" onmouseover="ctRoster('Frobo Oglethorpe<br>Halfling Rogue');" onmouseout="ctRosterClean();"><img src="./images/People/Party2/Frobo_Head.jpg" alt="Frobo Oglethorpe" /></a></td>
										<td><a href="Back_Stories2.asp<%=Arg%>#Aerethel" onmouseover="ctRoster('Lady Aerethel Nivenor<br>Half-elf Paladin');" onmouseout="ctRosterClean();"><img src="./images/People/Party2/Aerethel_Head.png" alt="Aerethel" /></a></td>
										<td><a href="#" onmouseover="ctRoster('Avalina<br>Wood Elf Druid');" onmouseout="ctRosterClean();"><img src="./images/People/Party2/Avalina_Head.png" alt="Avalina" /></a></td>
									</tr>

									<tr>
										<td><a href="NPCs.asp<%=Arg%>#Borin" onmouseover="ctRoster('Father Borin Wedgewick<br>Human Cleric');" onmouseout="ctRosterClean();"><img src="./images/People/Party2/Borin2_Head.jpg" alt="Borin" /></a></td>
										<td><a href="#" onmouseover="ctRoster('Kuntas<br>Human Barbarian');" onmouseout="ctRosterClean();"><img src="./images/People/Party2/Kuntas_Head.jpg" alt="Kuntas" /></a></td>
										<td><a href="NPCs.asp<%=Arg%>#Frix" onmouseover="ctRoster('Baronette Frix<br>Human Rogue (ward)');" onmouseout="ctRosterClean();"><img src="./images/People/Party2/Frix_Head4b.jpg" alt="Frix" /></a></td>
										<td><a href="#" onmouseover="ctRoster('Victor<br>Human Ranger');" onmouseout="ctRosterClean();"><img src="./images/People/Party2/Victor_Head.png" alt="Victor" /></a></td>
									</tr>

									<tr>
										<td><a href="#" onmouseover="ctRoster('Petra<br>Human Cleric');" onmouseout="ctRosterClean();"><img src="./images/People/Party2/Petra_Head.png" alt="Petra" /></a></td>
										<td><a href="#" onmouseover="ctRoster('Gimley<br>Human Fighter');" onmouseout="ctRosterClean();"><img src="./images/People/Party2/Gimley_Head.png" alt="Gimley" /></a></td>
										<td><a href="#" onmouseover="ctRoster('Rebekah<br>Half Elf Bard');" onmouseout="ctRosterClean();"><img src="./images/People/Party2/Rebekah_Wolfgang_Head.png" alt="Rebekah" /></a></td>
										<td><a href="#" onmouseover="ctRoster('Balthazar<br>Paynim Wizard');" onmouseout="ctRosterClean();"><img src="./images/People/Party2/Balthazar_Head.jpg" alt="Balthazar" /></a></td>
									</tr>
<% end if %>
<% if (userId = "DM") or (Campaign = "3") then %>
									<tr>
										<td colspan="4">&nbsp;</td>
									</tr>
<% end if %>
<% if (userId = "DM") or (Campaign = "3") then %>
									<tr>
										<td><a href="Back_Stories3.asp<%=Arg%>#Alti" onmouseover="ctRoster('Alti Reyt<br>Halfling Rogue');" onmouseout="ctRosterClean();"><img src="./images/People/Party3/Alti_Head.png" alt="Alti Reyt"/></a></td>
										<td><a href="Back_Stories3.asp<%=Arg%>#Kwartz" onmouseover="ctRoster('Kwartz<br>Half-Orc Barbarian');" onmouseout="ctRosterClean();"><img src="./images/People/Party3/Kwartz_Head.jpg" alt="Kwartz" /></a></td>
										<td><a href="Back_Stories3.asp<%=Arg%>#Lee" onmouseover="ctRoster('Lee Daers<br>Dwarven Fighter');" onmouseout="ctRosterClean();"><img src="./images/People/Party3/Lee_Head.png" alt="Lee Daers" /></a></td>
										<td><a href="Back_Stories3.asp<%=Arg%>#Shi_Ru" onmouseover="ctRoster('Shi Ru Amanthi<br>Human Monk');" onmouseout="ctRosterClean();"><img src="./images/People/Party3/Shi_Ru2_Head.jpg" alt="Shi Ru Amanthi" /></a></td>
									</tr>

									<tr>
										<td><a href="Back_Stories3.asp<%=Arg%>#Sigfried" onmouseover="ctRoster('Sigfried Miller<br>Half-Elf Paladin');" onmouseout="ctRosterClean();"><img src="./images/People/Party3/Sigfried_Miller1_Head.png" alt="Sigfried Miller" /></a></td>
										<td><a href="Back_Stories3.asp<%=Arg%>#Tragin" onmouseover="ctRoster('Tragin<br>Deep Gnome Cleric');" onmouseout="ctRosterClean();"><img src="./images/People/Party3/Tragin_Head.png" alt="Tragin" /></a></td>
										<td><a href="Back_Stories3.asp<%=Arg%>#Winlocke" onmouseover="ctRoster('Winlocke<br>Human Warlock');" onmouseout="ctRosterClean();"><img src="./images/People/Party3/Winlocke_Head.png" alt="Winlocke" /></a></td>
										<td><a href="#" onmouseover="ctRoster('Roster8');" onmouseout="ctRosterClean();"><img src="./Images/roster2.jpg" alt="Roster 2" /></a></td>
									</tr>
<% end if %>
								</table>
								<div id="rosterUser">Mouseover the players!</div>
							</div>
						</div>
					</div>
<% end if %>
					<img src="./images/Shadow.png" title="Enter if you dare" style="display: block; align-left: auto; margin-right: auto; margin-top: 50px;" />
				</div>





				<div id="leftColumn2">
					<div class="boxWelcome">
						<div class="creature-heading">
							<h1>Welcome <%=UserName%></h1>
						</div>
						<svg height="5" width="100%" class="tapered-rule">
							<polyline points="0,0 600,2.5 0,5"></polyline>
						</svg>
						<br>
						<p>
							Welcome to John's 5e D&D campaign web site.
							Here you will find maps, characters, recaps of adventures, magical gear, and all related things to these campaigns<sup>*</sup>.
							Login as one of the characters to see what they have experienced.
							Have fun!
						</p>
						<br>
						<img src="./images/Places/Yvalond_02.jpg" title="Elven city of Yvalond" class="left" style="padding-left: 40px"/>

					</div>
					<div class="boxWelcome">
						<br>
						<svg height="5" width="100%" class="tapered-rule">
							<polyline points="0,0 600,2.5 0,5"></polyline>
						</svg>
						<br>
						<sup>*</sup> There have been 3 campaigns thus far:
						<ol style="list-style-type: decimal; margin-left: 30px;">
							<li>
								The 1st campaign was in 2017 did not last long.
								However, it was the launching of the 2nd campaign</li>
							<li>
								The 2nd campaign has been running since early 2018.
								It has been played remotely with Zoom since 2020.
							</li>
							<li>
								The 3d campaign was started to bring in my two nephew's and then my son's friend.
								It has been played remotely with Zoom since it began in early 2021.
							</li>
						</ol>
					</div>
				</div>

			</div>
		</div>


		<div class="stat-block-spacer"></div>


<!-- #include file="i_footer.asp" -->


	</div>