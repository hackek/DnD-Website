<%





' Global arrays for character display
LevelDescs		= Array("Cantrips","1st Level","2nd Level","3rd Level","4th Level","5th Level","6th Level","7th Level","8th Level","9th Level")
AbilitiesTxt	= Array("Strength","Dexterity","Constitution","Intelligence","Wisdom","Charisma")
SkillsTxt		= Array("Acrobatics","Animal Handling","Arcana","Athletics","Deception","History","Insight","Intimidation","Investigation","Medicine","Nature","Perception","Performance","Persuation","Religion","Slight of Hand","Stealth","Survival")
SkillsAbilities= Array(1, 4, 3, 0, 5, 3, 4, 5, 3, 4, 3, 4, 5, 5, 3, 1, 1, 4)


dim WeaponNames(37)
dim WeaponDamages(37)
dim WeaponProperties(37)

'Simple melee weapons
WeaponNames(0)			= "Club"
WeaponDamages(0)		= "1d4 bludgeoning"
WeaponProperties(0)	= "Light"
WeaponNames(1)			= "Dagger"
WeaponDamages(1)		= "1d4 piercing"
WeaponProperties(1)	= "Finesse, light, thrown (range 20/60)"
WeaponNames(2)			= "Greatclub"
WeaponDamages(2)		= "1d8 bludgeoning"
WeaponProperties(2)	= "Two-handed"
WeaponNames(3)			= "Handaxe"
WeaponDamages(3)		= "1d6 slashing"
WeaponProperties(3)	= "Light, thrown (range 20/60)"
WeaponNames(4)			= "Javelin"
WeaponDamages(4)		= "1d6 piercing"
WeaponProperties(4)	= "Thrown (range 30/120)"
WeaponNames(5)			= "Light hammer"
WeaponDamages(5)		= "1d4 bludgeoning"
WeaponProperties(5)	= "Light, thrown (range 20/60)"
WeaponNames(6)			= "Mace"
WeaponDamages(6)		= "1d6 bludgeoning"
WeaponProperties(6)	= "-"
WeaponNames(7)			= "Quarterstaff"
WeaponDamages(7)		= "1d6 bludgeoning"
WeaponProperties(7)	= "Versatile (1d8)"
WeaponNames(8)			= "Sickle"
WeaponDamages(8)		= "1d4 slashing"
WeaponProperties(8)	= "Light"
WeaponNames(9)			= "Spear"
WeaponDamages(9)		= "1d6 piercing"
WeaponProperties(9)	= "Thrown (range 20/60), versatile (1d8)"
WeaponNames(10)		= "Unarmed strike"
WeaponDamages(10)		= "1 bludgeoning"
WeaponProperties(10)	= "-"

' Simple ranged weapons
WeaponNames(11)		= "Crossbow, light"
WeaponDamages(11)		= "ld8 piercing"
WeaponProperties(11)	= "Ammunition (range 80/320), loading, two.handed"
WeaponNames(12)		= "Dart"
WeaponDamages(12)		= "1d4 piercing"
WeaponProperties(12)	= "Finesse, thrown (range 20/60)"
WeaponNames(13)		= "Shortbow"
WeaponDamages(13)		= "1d6 piercing"
WeaponProperties(13)	= "Ammunition (range 80/320), two.handed"
WeaponNames(14)		= "Sling"
WeaponDamages(14)		= "1d4 bludgeoning"
WeaponProperties(14)	= "Ammunition (range 30/120)"

' Martial melee weapons
WeaponNames(15)		= "Battleaxe"
WeaponDamages(15)		= "1d8slashing"
WeaponProperties(15)	= "Versatile (ld10)"
WeaponNames(16)		= "Flail"
WeaponDamages(16)		= "1d8 bludgeoning"
WeaponProperties(16)	= "-"
WeaponNames(17)		= "Glaive"
WeaponDamages(17)		= "1dl O slashing"
WeaponProperties(17)	= "Heavy, reach, two-handed"
WeaponNames(18)		= "Greataxe"
WeaponDamages(18)		= "1d12 slashing"
WeaponProperties(18)	= "Heavy, two-handed"
WeaponNames(19)		= "Greatsword"
WeaponDamages(19)		= "2d6 slashing"
WeaponProperties(19)	= "Heavy, two-handed"
WeaponNames(20)		= "Halberd"
WeaponDamages(20)		= "1d10 slashing"
WeaponProperties(20)	= "Heavy, reach, two-handed"
WeaponNames(21)		= "Lance"
WeaponDamages(21)		= "1d12 piercing"
WeaponProperties(21)	= "Reach, special"
WeaponNames(22)		= "Longsword"
WeaponDamages(22)		= "1d8 slashing"
WeaponProperties(22)	= "Versatile (1dl0)"
WeaponNames(23)		= "Maul"
WeaponDamages(23)		= "2d6 bludgeoning"
WeaponProperties(23)	= "Heavy, two-handed"
WeaponNames(24)		= "Morningstar"
WeaponDamages(24)		= "1d8 piercing"
WeaponProperties(24)	= "-"
WeaponNames(25)		= "Pike"
WeaponDamages(25)		= "1d10 piercing"
WeaponProperties(25)	= "Heavy, reach, two-handed"
WeaponNames(26)		= "Rapier"
WeaponDamages(26)		= "1d8 piercing"
WeaponProperties(26)	= "Finesse"
WeaponNames(27)		= "Scimitar"
WeaponDamages(27)		= "1d6 slashing"
WeaponProperties(27)	= "Finesse, light"
WeaponNames(28)		= "Shortsword"
WeaponDamages(28)		= "1d6 piercing"
WeaponProperties(28)	= "Finesse, light"
WeaponNames(29)		= "Trident"
WeaponDamages(29)		= "ld6 piercing"
WeaponProperties(29)	= "Thrown (range 20/60), versatile (1d8)"
WeaponNames(30)		= "War pick"
WeaponDamages(30)		= "ld8 piercing"
WeaponProperties(30)	= "1"
WeaponNames(31)		= "Warhammer"
WeaponDamages(31)		= "1d8 bludgeoning"
WeaponProperties(31)	= "Versatile (1d10)"
WeaponNames(32)		= "Whip"
WeaponDamages(32)		= "1d4slashing"
WeaponProperties(32)	= "Finesse, reach"

'Martial ranged weapons
WeaponNames(33)		= "Blowgun"
WeaponDamages(33)		= "1 piercing"
WeaponProperties(33)	= "Ammunition (range 25/100), loading"
WeaponNames(34)		= "Crossbow, hand"
WeaponDamages(34)		= "1d6 piercing"
WeaponProperties(34)	= "Ammunition (range 30/120), light, loading"
WeaponNames(35)		= "Crossbow, heavy"
WeaponDamages(35)		= "1dlO piercing"
WeaponProperties(35)	= "Ammunition (range 100/400), heavy, loading, two.handed"
WeaponNames(36)		= "Longbow"
WeaponDamages(36)		= "1d8 piercing"
WeaponProperties(36)	= "Ammunition (range 150/600), heavy, two-handed"
WeaponNames(37)		= "Net"
WeaponDamages(37)		= "-"
WeaponProperties(37)	= "Special, thrown (range 5/15)"

MaxWeapons = uBound(WeaponNames)

' Define magical stuff
dim MagicNames(1)
dim MagicDamages(1)
dim MagicProperties(1)

MagicNames(0)			= "Flame Tongue"
MagicDamages(0)		= "2d6 fire"
MagicProperties(0)	= ""
MagicNames(1)			= "Frostbrand"
MagicDamages(1)		= "2d6 cold"
MagicProperties(1)	= ""

MaxMagicNames = uBound(MagicNames)








Function InitializeSpells()
	' Common logic to initialize the Spells array for every character (even non-spell casters)
	dim Spells(10)
	for xx1 = 0 to 9
		Spells(xx1) = ""
	next
	InitializeSpells = Spells
End Function


Function InitializeSkills()
	' Common logic to initialize the Spells array for every character (even non-spell casters)
	dim Skills(18)
	for xx1 = 0 to 17
		Skills(xx1) = false
	next
	InitializeSkills = Skills
End Function


Function CalcAbilityBonus(Att, ShowSign)
	Modifier = Int((Att - 10)/2)
	if (ShowSign = true) then
		if (Modifier > "0") then
			Modifier = "+" & Modifier
		end if
	end if
	CalcAbilityBonus = Modifier
End Function






Sub RenderCharacter2(Name, Race, CharLevel, CharClass, Portrait, AbilityScores, AbilityProf, Skills, AC, HP, Speed, Slots, Spells, Weapons, Armors, Languages, Gear, Comments, Proficiencies)
	LevelClass	= ""	' Could be multi-class
	totalLevel	= 0
	noClasses	= uBound(CharClass)
	for xx1 = 0 to noClasses
		if (xx1 > 0) then
			' Add a slash to separate for multi-class characters
			LevelClass = LevelClass & "/"
		end if
		level	= CharLevel(xx1)

		' Determine the suffix for the level
		if (level = "1") then
			Suffix = "st"
		else
			if (level = "2") then
				Suffix = "nd"
			else
				if (level = "3") then
					Suffix = "rd"
				else
					Suffix = "th"
				end if
			end if
		end if
		LevelClass	= LevelClass & level & Suffix & " " & CharClass(xx1)
		totalLevel	= totalLevel + level
	next

	' Determine the proficiency bonus based on total levels (could be multi-classed)
	if (totalLevel < 5) then
		ProfBonus = 2
	else
		if (totalLevel < 9) then
			ProfBonus = 3
		else
			if (totalLevel < 13) then
				ProfBonus = 4
			else
				if (totalLevel < 17) then
					ProfBonus = 5
				else
					ProfBonus = 6
				end if
			end if
		end if
	end if

	' Build the proficiency bonus based on level
	Dim BonusSigned(6)
	for xx1 = 0 to 5
		BonusSigned(xx1) = CalcAbilityBonus(AbilityScores(xx1), true)
	next
%>
		<div class="charContainer">
			<div class="characterNameRankLevelContainer">
				<span class="characterNameBig"><%=Name%></span>
				&nbsp;<%=Race%> &nbsp;<%=LevelClass%><% if (noClasses > 0) then %> (Total level: <%=totalLevel%>)<% end if %>
			</div>

<div class="row2">
			<div class="characterPortrait">
				<img src="<%=Portrait%>" />
			</div>

			<div class="characterDetailsContainer">

				<!-- Render the 5 ability scores & modifiers -->
				<div class="characterAbilities">
<% for xx1 = 0 to 5 %>
					<div class="characterAbilitiesBox">
						<span class="characterAbilityTxt"><%=ucase(AbilitiesTxt(xx1))%></span>
						<br>
						<span class="characterAbility"><%=AbilityScores(xx1)%></span>
						<br>
						<span class="characterAbilityModBox">
							<%=BonusSigned(xx1)%>
						</span>
					</div>
<% next %>
				</div>

				<div class="characterCol3">
					<!-- Render the level based proficiency bonus -->
					<div class="characterProfBonusTxt">
						<div class="characterProfBonus">+<%=ProfBonus%></div> Proficiency Bonus
					</div>

					<!-- Render the ability saving throws -->
					<div class="savingThrowContainer">
						<table>
							<tr>
								<td align="center" colspan="3">Saving Throws</td>
							</tr>
<% for xx1 = 0 to 5
		if (AbilityProf(xx1) = true) then
			dot = "&#9673;"
		else
			dot = "&#9711;"
		end if
		SkillPtr	= SkillsAbilities(xx1)
%>
							<tr>
								<td class="pad5" align="center"><%=dot%></td>
								<td class="pad5" align="right"><%=BonusSigned(xx1)%></td>
								<td><%=AbilitiesTxt(xx1)%></td>
							</tr>
<% next %>
							</tr>
						</table>
					</div>

					<!-- Render skills -->
					<div class="skillsContainer">
						<table>
							<tr>
								<td align="center" colspan="3">Skills</td>
							</tr>
<% for xx1 = 0 to 17
		if (Skills(xx1) = true) then
			dot = "&#9673;"
		else
			dot = "&#9711;"
		end if
		SkillPtr		= SkillsAbilities(xx1)
		SkillBonus	= BonusSigned(SkillPtr)
		Ability		= Left(AbilitiesTxt(SkillPtr), 3)
%>
							<tr>
								<td class="pad5" align="center"><%=dot%></td>
								<td class="pad5" align="right"><%=SkillBonus%></td>
								<td><%=SkillsTxt(xx1)%> (<%=Ability%>)</td>
							</tr>
<%	next %>
						</table>
					</div>
				</div>	<!-- col 3 -->

				<div class="characterCol4">
					<div class="characterCol4_1">
						<div class="AcHpInitSpeed">
							<span class="characterAbilityTxt">AC</span>
							<br>
							<span class="characterAbility"><%=AC%></span>
						</div>
						<div class="AcHpInitSpeed">
							<span class="characterAbilityTxt">Hit Points</span>
							<br>
							<span class="characterAbility"><%=HP%></span>
						</div>
						<div class="AcHpInitSpeed">
							<span class="characterAbilityTxt">Init</span>
							<br>
							<span class="characterAbility"><%=BonusSigned(1)%></span>
						</div>
						<div class="AcHpInitSpeed">
							<span class="characterAbilityTxt">Speed</span>
							<br>
							<span class="characterAbility"><%=Speed%></span>
						</div>
						<div class="AcHpInitSpeed">
							<span class="characterAbilityTxt">Pas Per</span>
							<br>
							<span class="characterAbility"><%=10%></span>
						</div>
					</div>

					<div class="spellsContainer">
						<!-- Spells -->
						<table class="characterStuff">
							<tr>
								<th class="characterStuff" width="200px">
									Spells
								</th>
								<th class="characterStuff" width="200px">
									Spells
								</th>
							</tr>
<%
	if (Spells(0) = "") and (Spells(1) = "") then
%>
						
							<tr>
								<td colspan="2">None</td>
							</tr>
<% else %>
							<tr>
								<td>
									<table>
<%
		for Lvl = 0 to 9
			if (Spells(Lvl) <> "") then
				noSlots	= Slots(lvl)
				SlotDesc	= ""
				if (Lvl > 0) then
					SlotDesc = " (" & noSlots & " slots)"
				end if
%>
										<tr>
											<td>
												<u><%=LevelDescs(Lvl)%><%=SlotDesc%></u><br>
												<div style="margin-left: 8px;">
												<%=Replace(Spells(Lvl), ",", "<br>")%>
												</div>
											</td>
										</tr>
<%			end if
			if (Lvl = 5) then %>
									</table>
								</td>
								<td>
									<table>
<%			end if
		next %>
									</table>
								</td>
							</tr>
<% end if %>
						</table>

					</div>
				</div>	<!-- Col 4 -->
			</div>	<!-- box box bext to portrait -->
</div>

<div class="row3">
			<div class="weaponsPannel">
				<table class="weaponsArmor">
					<tr>
						<th class="weaponsArmor" colspan="4">Weapons</th>
					</tr>
					<tr>
						<th class="weaponsArmor">Bonus</th>
						<th class="weaponsArmor">Weapon</th>
						<th class="weaponsArmor">Damage/Type</th>
						<th class="weaponsArmor">Weapon Properties</th>
					</tr>
<%
	noWeapons = uBound(Weapons)
	if (noWeapons < "0") then
%>
					<tr>
						<td colspan="4" align="center">-- none --</td>
					</tr>
<%
	else
		for xx1 = 0 to noWeapons
			Weapon = Weapons(xx1)
			if (Left(Weapon, 1) = "+") then
				' extract the bonus from the weapon
				temp = Split(Weapon, " ")
				Bonus = temp(0)
				Weapon = Replace(Weapon, Bonus, "")
			else
				Bonus = ""
			end if
			Weapon = trim(Weapon)

			' Get the weapon damage, type & properties
			WeaponDamage	= ""
			WeaponProperty	= ""
			for xx2 = 0 to MaxWeapons
'				if (Weapon = WeaponNames(xx2)) then
				if (InStr(Weapon, WeaponNames(xx2)) > 0) then
					WeaponDamage	= WeaponDamages(xx2)
					WeaponProperty	= WeaponProperties(xx2)
					xx2				= MaxWeapons
				end if
			next

			' Get any special (magical) properties
			MagicDamage = ""
			for xx2 = 0 to MaxMagicNames
				if (InStr(Weapon, MagicNames(xx2)) > 0) then
					MagicDamage	= MagicDamages(xx2)
					xx2			= MaxMagicNames
				end if
			next
%>
					<tr>
						<td align="center"><%=Bonus%></td>
						<td><%=Weapon%></td>
						<td><%=WeaponDamage%><% if (MagicDamage <> "") then response.write("<br><span class=""magic"">+" & MagicDamage & "</span>") %></td>
						<td><%=WeaponProperty%></td>
					</tr>
<%
		next
	end if
%>
				</table>
			</div>	<!-- Weapons -->

			<div class="armorPannel">
				<table class="weaponsArmor">
					<tr>
						<th class="weaponsArmor" colspan="2">Armor</th>
					</tr>
					<tr>
						<th class="weaponsArmor">Bonus</th>
						<th class="weaponsArmor">Armor</th>
					</tr>
<%
	noArmors = uBound(Armors)
	if (noArmors < "0") then
%>
					<tr>
						<td colspan="2" align="center" width="100px">-- none --</td>
					</tr>
<%
	else
		for xx1 = 0 to noArmors
			Armor = Armors(xx1)
			if (Left(Armor, 1) = "+") then
				' extract the bonus from the armor
				temp = Split(Armor, " ")
				Bonus = temp(0)
				Armor = Replace(Armor, Bonus, "")
			else
				Bonus = ""
			end if
			Armor = trim(Armor)
%>
					<tr>
						<td align="center"><%=Bonus%></td>
						<td><%=Armor%></td>
					</tr>
<%
		next
	end if
%>
				</table>
			</div>	<!-- armor -->

</div>

			<div class="gearPannel">
				<b>Gear:</b> <%=Gear%>
			</div>

			<div class="commentsPannel">
				<b>Comments:</b> <%=Comments%>
			</div>
			<div class="languagesPannel">
				<b>Languages:</b> <%=Languages%>
			</div>
			<div class="proficienciesPannel">
				<b>Proficiencies:</b> <%=Proficiencies%>
			</div>


		</div>	<!-- character -->




<%
End Sub