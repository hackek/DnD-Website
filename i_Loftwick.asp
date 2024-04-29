<%
' define colors for buildings
GuildColor			= "b300b3"
GovColor				= "b366ff"
MagicCollegeColor	= "66d9ff"
MilColor				= "cc3300"
SchoolColor			= "00cc00"
StoreColor			= "a3a3c2"
TavernColor			= "ff9999"	' Used by bars, taverns, inns, brothels, gabling houses, etc.
TempleColor			= "e68a00"
PrivateHomeColor	= "e68a00"


' All Loftwick arrays have the following format:
'		xxxArray(#,0)	= Unused (for ease of reading)
'		xxxArray(#,1)	= Code
'		xxxArray(#,2)	= Name
'		xxxArray(#,3)	= Web link
'		xxxArray(#,4)	= Full description

' Bridges array
dim BridgeArray(20,5)
for xx1 = 1 to 20
	BridgeArray(xx1, 1) = "B" & xx1
	BridgeArray(xx1, 2)= ""
	BridgeArray(xx1, 3)= ""
	BridgeArray(xx1, 4)= ""
next

BridgeArray(1,2)		= "The Beloved Bridge"
BridgeArray(1,4)		= "There are always guards on this bridge, ensuring unwanted guests to not get to Embassies."

BridgeArray(2,2)		= "Ampersand Bridge"

BridgeArray(3,2)		= "The Diamond Pillars"

BridgeArray(4,2)		= "Nacc Darrow Crossing"

BridgeArray(5,2)		= "Pewtertree' Bridge"

BridgeArray(6,2)		= "The Nine Hammers Bridge"
BridgeArray(6,4)		= "There are always guards on this bridge, ensuring unwanted guests to not get to Embassies."

BridgeArray(7,2)		= "The Courtious Bridge"

BridgeArray(8,2)		= "Fullhens Bridge"
BridgeArray(8,4)		= "A large stone bridge, crossing the xxxx River and connecting the Santica District to the Copsic District. It is fortified against attacks from the water."

BridgeArray(9,2)		= "Orkham`s Bridge"

BridgeArray(10,2)		= "Slum Bridge"
BridgeArray(10,4)		= "A fortified bridge with armed Yeoman on permanent duty."

BridgeArray(11,2)		= "Mafaton Bridge"

BridgeArray(12,2)		= "The Lonely Bridge"

BridgeArray(13,2)		= "The Last Digit"

BridgeArray(14,2)		= "The Bridge of Hate"

BridgeArray(15,2)		= "Lions and Barrels Crossing"
BridgeArray(15,4)		= "There are always guards on this bridge, ensuring unwanted guests to not get to Embassies."

BridgeArray(16,2)		= "Joshuas Knuckle Bridge"
BridgeArray(16,4)		= "There are always guards on this bridge, ensuring unwanted guests to not get to Embassies."

BridgeArray(17,2)		= "Bridge of Saint Yarwe"

BridgeArray(18,2)		= "Emaciation Bridge"

BridgeArray(20,2)		= "Nacc Findings Crossing"

'======================================================

' Buildings array
dim BuildingArray(200, 5)
for xx1 = 1 to 200
	BuildingArray(xx1,1) = xx1
	BuildingArray(xx1,2) = ""
	BuildingArray(xx1,3) = ""
	BuildingArray(xx1,4) = ""
next

' The Urovangians Dictrict
BuildingArray(1,2)		= "The Cathedral of St Cuthbert"
BuildingArray(1,4)		= "A huge temple, dedicated to the worship of St Cutherbert (of the Cudgel). It is the largest temple in the city and is run by |Yandar|."

BuildingArray(2,2)		= "Sacramundi Hospital"
BuildingArray(2,4)		= "One of several hospitals in town."

BuildingArray(3,2)		= "The Skeinholm Citadel"
BuildingArray(3,4)		= "The largest military compound inLoftwick, it ovelooks both the Urovangian's Quarter as well as Sweetwater Lake."

BuildingArray(4,2)		= "Guild-on-the-Waterfront"
BuildingArray(4,4)		= "A large, posh building that serves as the meeting house for several maritime-related guilds."

BuildingArray(5,2)		= "Jaecho Condominiums"
BuildingArray(5,4)		= "A multi-story series of high-end dwellings."

BuildingArray(6,2)		= "Society of the Immaculate Paradox"

BuildingArray(7,2)		= "Ambergriss Hotel"
BuildingArray(7,4)		= "A large, high-end hotel with a fine resturant."

BuildingArray(8,2)		= "The Dagiard ars-Kuniard Building"



' Habadock & Quest
BuildingArray(9,2)		= "City Hall"
BuildingArray(9,4)		= "Mayor Lord Jubal and the city council run the affairs of the city from this large building. Most legal matters for the area are handled here included (but not limited), deeds, documents, the running of Loftwick, etc."

BuildingArray(10,2)		= "The Sovereign`s Unequivocal Authority Courthouse"
BuildingArray(10,4)		= "All trials, both public and pricate are conducted here."

BuildingArray(11,2)		= "Volomae River Community"
BuildingArray(11,4)		= "A small community that has established itself on the rocky edge of the river."

BuildingArray(12,2)		= "Westbremefth Hall"

BuildingArray(13,2)		= "Hall of the Exchequer"

BuildingArray(14,2)		= "Force Vanguard Hall"

BuildingArray(15,2)		= "General Pneumotube Post Office"

BuildingArray(141,2)		= "The Clockwork Beetle"
BuildingArray(141,4)		= "A high end resturant on the east side of the Habadock & Quest District."

BuildingArray(160,2)		= "Town House, home of Thunin-al-Azeed (and several other families)"
BuildingArray(160,4)		= "A large multi-family dwelling. The home in the NW corner is the dwelling of |Thunin_al_Azeed|, Dean of Students at the College of Magi, Evocation College in the adjacent Orichalcum District."

BuildingArray(164,2)		= "The Crystal Dancer"
BuildingArray(164,4)		= "A high-end resturant near city hall."



'Dreodae District
BuildingArray(16,2)		= "Khalep Bazaar"
BuildingArray(16,4)		= "A large, indoor shopping area located near the docks."

BuildingArray(17,2)		= "Temminckstint Stockpile"
BuildingArray(17,4)		= "A large, indoor shopping area located near the docks."

BuildingArray(18,2)		= "Naumannthrush's Emporium"
BuildingArray(18,4)		= "A large complex of indoor shopping at the north of the district."

BuildingArray(19,2)		= "The Scarab Court Building"
BuildingArray(19,4)		= "A large, indoor shopping area at the north of the district."

BuildingArray(20,2)		= "Ninety-Sixth Street Apartments"
BuildingArray(20,4)		= "A multi-story building that rents space by the month."

BuildingArray(21,2)		= "The Imperial Institute"
BuildingArray(21,4)		= "One of several university/colleges in Loftwick."

BuildingArray(22,2)		= "The Geddisstock House"
BuildingArray(22,4)		= "A huge tavern/boarding house"

BuildingArray(23,2)		= "The Verrostyx House"
BuildingArray(23,4)		= "Dormatories for the Imperial Institute"

BuildingArray(24,2)		= "Slough Bend Workshops"
BuildingArray(24,4)		= "A multi-story building housing multiple businesses/workshops."



'Embassy Island
BuildingArray(25,2)		= "Embassy Island"
BuildingArray(25,4)		= "All established emabssies and their ambassedors are housed here. This island is off limits to all but those with offical business with the emabacies. There is a park located in the center of the island."

BuildingArray(26,2)		= "Convocation Hall"
BuildingArray(26,4)		= "A meeting place for ambassadors that is not part of any embassy (i.e. neutral ground)."



' Sanctia District
BuildingArray(27,2)		= "The Asentyne Palace"
BuildingArray(27,4)		= "This is the home of Crispin Redwell, elected ruler of the Yeomanry, and his family. It is also the seat of power for all government matters of the country."

BuildingArray(28,2)		= "Humboldt University"
BuildingArray(28,4)		= "An `Ivy-League` school, available only to the wealthiest of citizens."

BuildingArray(29,2)		= "The Aeromutations Tower"

BuildingArray(30,2)		= "Blackhammer Apartments"

BuildingArray(31,2)		= "Commune of the Watered Flame"

BuildingArray(32,2)		= "Saint Lacqordwaithe Orphanage"

BuildingArray(153,2)		= "The Pretorian House"
BuildingArray(153,4)		= "The barracks of the Pretorian Guard, sworn to defend the ruler of the Yeomanry League and his family."

BuildingArray(154,2)		= "The Sturmbann Barracks"
BuildingArray(154,4)		= "Adjacent to the Hark Darrow Bastion, this building houses a contingent of Yeoman."

BuildingArray(155,2)		= "The Hortus Barracks"
BuildingArray(155,4)		= "A small barracks/precinct that watches over (S9) Anatomy Plaza and (B10) Slum Bridge."



' The Orichalcum District
BuildingArray(33,2)		= "Temple of Baccob"
BuildingArray(33,4)		= "This towering, fortified temple is very popular amoung the Arcane spell casters, sages and historians. In addition to being a temple, it is also a vast library of historic events and arcane lore - much of which is available for a fee (though it is rumored that there are some hidden rooms, housing the most dangerous and secret knowledge). Fees: level 1: 10gp/day, level 2: 50gp/day, level 3 - 100gp/day."

BuildingArray(34,2)		= "College of the Magi, Axii Building (Divination, Abjuration, Conjuration & Transmutation)"
BuildingArray(34,4)		= "The main building of the school of wizards. This building houses the colleges of (a) Divination, (b) Abjuration, (c) Conjuration and (d) Transmutation."

BuildingArray(35,2)		= "Headquarters of the League of Sentient/Near-Sentient Races"

BuildingArray(36,2)		= "Temple of Wee Jas"
BuildingArray(36,4)		= "This small temple is dedicated to Wee Jas, the Sule goddess of Death and Magic"

BuildingArray(37,2)		= "Temple of the Teal Priesthood"

BuildingArray(38,2)		= "The Centralia Fire Station"
BuildingArray(38,4)		= "The largerst fire station in Loftwick"

BuildingArray(39,2)		= "College of the Magi, Qin Building (Evocation)"
BuildingArray(39,4)		= "The 3rd building of the school of wizards. This building houses the college of Evocation. Due to the dangers of this school of magic, many of the training rooms are magically shielded to prevent 'accidents'. The dean of this college is |Thunin_al_Azeed|."

BuildingArray(40,2)		= "College of the Magi, Ganni Building (Illusions & Necromancy)"
BuildingArray(40,4)		= "The 2nd building of the school of wizards. This building houses the colleges of (a) Illusions and (b) Necromancy. The schools are run by deans |Juliette_Devereux| and |Wix| respectively."

BuildingArray(150,2)	= "College of the Magi, Administration Building"
BuildingArray(150,4)	= "This building houses the majority of the mundane, day-to-day activities to keep the College of the Magi running smoothly."

BuildingArray(151,2)	= "College of the Magi, Zon Building (Enchantment)"
BuildingArray(151,4)	= "The 4th building of the school of wizards. This building houses the college of Enchantment."

BuildingArray(165,2)		= "The Fox & Flagon"
BuildingArray(165,4)		= "A respctable tavern in the eastern Orichalcum District."


' Copsic District
BuildingArray(41,2)		= "Porcupine Fortress"
BuildingArray(41,4)		= "Also known as ""The Tongues and Knives Regimental Garrison"", this is the largest fortified garrison in the city."

BuildingArray(42,2)		= "The Tradeworks - The Downriver/Uppriver Complex"
BuildingArray(42,4)		= "A large in-door trading complex which contains all manner of merchandise (though no food stuffs, weapons or armor)."

BuildingArray(43,2)		= "Schadenfreude Tariff House"
BuildingArray(43,4)		= "A government building specializing in taxes."

BuildingArray(44,2)		= "Undinger Docking Pile"
BuildingArray(44,4)		= "One of the many trading houses. It is stratigiacally located to take advantage of both The Centralis Docks and The Oshen-Dan-Desh Plaza"

BuildingArray(45,2)		= "Rhojamasson Docking Pile"
BuildingArray(45,4)		= "A large, 2-story trading house."

BuildingArray(46,2)		= "Nihilius Infirmary"
BuildingArray(46,4)		= "An infirmary that is supported by taxes, donations and the various churches in town."

BuildingArray(47,2)		= "Khalthune Distributions, Inc."
BuildingArray(47,4)		= "One of many distributers throughout the city."

BuildingArray(152,2)	= "The 3 Frogs Tavern"
BuildingArray(152,4)	= "A popular tavern, esp. among the soldiers from the Porcupine Fortress, located beside the city walls. Bar fights are semi-regular event."


'Gorro Hill
BuildingArray(48,2)		= "Bank of the Empire"
BuildingArray(48,4)		= "One of the larger banks in Loftwick."

BuildingArray(49,2)		= "The Palindrome Museum"
BuildingArray(49,4)		= "A museum that caters to the middle & upper class."

BuildingArray(50,2)		= "The Scanoslausington Family Estate"
BuildingArray(50,4)		= "The home of the Scanoslausington Family."

BuildingArray(51,2)		= "The Soillaine-Elbdonic Theater"
BuildingArray(51,4)		= "A large theater that caters to the MIDDLE & upper class."

BuildingArray(52,2)		= "The Culture Collection"
BuildingArray(52,4)		= "A collecion of high end shops all under one roofs."

BuildingArray(53,2)		= "Carothinkias Aurochs Furs"
BuildingArray(53,4)		= "A shop that specializes in high quality fur coats, blankets, rugs, etc."

BuildingArray(54,2)		= "Butterthickes Jewelry Boutique"
BuildingArray(54,4)		= "A high end jewelry and gem shop."

BuildingArray(55,2)		= "New World Order Daguerreotypes"

BuildingArray(56,2)		= "The Von Rheinstaadt Family Estate"
BuildingArray(56,4)		= "Private family estate, owned by one of the wealthiest families in town."


BuildingArray(162,2)		= "Temple of Fharlanghn"
BuildingArray(162,4)		= "A temple to the god of travels, popular among merchants."




'Upper Uther Isle
BuildingArray(57,2)		= "Kiel Naval Shipyard"
BuildingArray(57,4)		= "A large shipbuilding facilty, known throughout the world for their craftsmanship. Ships are then sales down river and to their ultimate owner."

BuildingArray(58,2)		= "Kedriss Apartments"

BuildingArray(59,2)		= "Schwartgrun Library"
BuildingArray(59,4)		= "A private library, available to members only."

BuildingArray(60,2)		= "Spigott Mansion"

BuildingArray(61,2)		= "Ganymeed Concert Hall"

BuildingArray(62,2)		= "Darys Sensibly Priced Couture"

BuildingArray(180,2)		= "Temple of Olidammara"
BuildingArray(180,4)		= "Build in the former Heidelbaun brewery, the Temple of Olidammara is always a joyous place. Tasty food is available to the needy (for an appropriate donation), music fills the air and the beer and wine are always flowing."

BuildingArray(163,2)		= "Mrs. Hudson's Boarding House"
BuildingArray(163,4)		= "A private boarding house owned by Mrs. Hundson, an army widow. The party has over-Wintered at this quiet, clean establishment."




'Lower Uther Isle
BuildingArray(63,2)		= "Thamm Warehouse Complex"

BuildingArray(64,2)		= "Tarbohaal Villa"

BuildingArray(65,2)		= "Daakatun-Kensing House"
BuildingArray(65,4)		= "A popular tavern."

BuildingArray(66,2)		= "Naesenth Student Apartments"
BuildingArray(66,4)		= "A massive dorm complex for foreign students."

BuildingArray(67,2)		= "Schpume Haus"
BuildingArray(67,4)		= "A popular tavern."

BuildingArray(68,2)		= "Dhabiard al-Maniard House"
BuildingArray(68,4)		= "A popular tavern."

BuildingArray(188,2)		= "The Dancing Maiden"
BuildingArray(188,4)		= "A modest tavern."

'The Pinion Isles
BuildingArray(69,2)		= "Ojax Lighthouse"
BuildingArray(69,4)		= "A modest lighthouse used to warn ships of the rocky shores of Loftwick"

BuildingArray(70,2)		= "Shrine to the Lost Fishermen"
BuildingArray(70,4)		= "A small shrine on the southernmost tip of the southernmost Pinion Isle, this shrine is to honor those who have died on Sweetwater Lake."

BuildingArray(71,2)		= "Temple of Fharlanghn"
BuildingArray(71,4)		= "On the southern most of the Pinion Isles, it the Temple of Fharlanghn. Worshippers must ""travel"" from island to island to get to the temple to honor the god."

BuildingArray(72,2)		= "Maritime Pilot`s Station"

BuildingArray(73,2)		= "Pentyas dac Pentos` Laboratorium"

'Isambard District
BuildingArray(74,2)		= "Abjohn House"
BuildingArray(74,4)		= "A popular tarvern."

BuildingArray(75,2)		= "The Swinery Luncheonette"
BuildingArray(75,4)		= "A popular tarvern."

BuildingArray(76,2)		= "Brammer Hall"

BuildingArray(77,2)		= "The Anadelphi Complex"

BuildingArray(78,2)		= "Dignitary Row"

BuildingArray(79,2)		= "Thinkfine`s Hotel"
BuildingArray(75,4)		= "A popular tarvern/Inn."

BuildingArray(80,2)		= "Dryheaver`s Union"

'Smogtown
BuildingArray(81,2)		= "Harbadin`s Oliphaunt Oil Processing Plant"
BuildingArray(81,4)		= "A large business that specialises in the manufactuing and distilation of various oils and sauves. It is the largest business (building) in town and employs hundres of workers."

BuildingArray(82,2)		= "Ibruhaen`s Manufactorum"
BuildingArray(82,4)		= "A large facility that specialises in the manufactuing and distilation of various oils and sauves."

BuildingArray(83,2)		= "Industialst`s Guildhall"
BuildingArray(83,4)		= "A series of meeting halls for various guilds throught town."

BuildingArray(84,2)		= "Greyshrike's Textile Cooperative"
BuildingArray(84,4)		= "A large processing facility that manufactures various textile materials."

BuildingArray(85,2)		= "Driscoll`s Spring Windup Mill"

BuildingArray(86,2)		= "J. Jadrick Pneumatics Company"
BuildingArray(86,4)		= "A manufacturer of pumps, hoses and related items."



'Combine Yard
BuildingArray(87,2)		= "Madame Maeve`s Bordello"
BuildingArray(87,4)		= "One of the larger brothels in town."

BuildingArray(88,2)		= "The Prancing Pony #14"
BuildingArray(88,4)		= "A seedy tavern."

BuildingArray(89,2)		= "The Meatdecks Slaughterhouse"
BuildingArray(89,4)		= "The city`s largest slaughterhouse."

BuildingArray(90,2)		= "Kalbrunner House Blocking"

BuildingArray(91,2)		= "The Slag and Grime Bar"
BuildingArray(91,4)		= "A popular tavern"

BuildingArray(92,2)		= "Sluslick`s Clinic for Indigents"
BuildingArray(92,4)		= "A popular clinic for the poor."

BuildingArray(93,2)		= "Gendarmeie Local Station O86"
BuildingArray(93,4)		= "A popular tavern"

BuildingArray(94,2)		= "Don Larry`s Gambling House"
BuildingArray(94,4)		= "A popular gambling house"

BuildingArray(130,2)	= "The Iron Heart Tavern"
BuildingArray(130,4)	= "A tavern that caters specifically to non-humans and is run by dwarves."



'Shael Town
BuildingArray(95,2)		= "The Opulent Bazaar"
BuildingArray(95,4)		= "A huge, indoor shopping bazaar."

BuildingArray(96,2)		= "Tampyulin University"
BuildingArray(96,4)		= "A popular school for the wealthy."

BuildingArray(97,2)		= "The Triple Y Building"
BuildingArray(97,4)		= "A large indoor shopping area owned by Yimmin, Young & Yearlington."

BuildingArray(98,2)		= "The Society of Kissers and Tellers"
BuildingArray(98,4)		= "A popular brother. Contrary to the name, the staff do not share client information."

'The Meadows
BuildingArray(99,2)		= "Fort Perth"
BuildingArray(99,4)		= "The smallest of the city`s fortifications, this stronhold watches over the South Western portion of the city, primarly ""The Meadows"" and ""Shael Town""."

BuildingArray(100,2)		= "Anchorhal Costal Fortress"

BuildingArray(101,2)		= "De Thakiel Apartments"

BuildingArray(102,2)		= "The Old Armory"
BuildingArray(102,4)		= "Many of the citys weapons and armor are stored in this old facility."

BuildingArray(103,2)		= "Oldwych House"

BuildingArray(104,2)		= "Remembrancers Guild"

BuildingArray(105,2)		= "The Goose &amp; Stag Inn"

BuildingArray(106,2)		= "Richart Hospital"

'Scornwall
BuildingArray(107,2)	= "Old Fort"
BuildingArray(107,4)	= "The original fortification, established when the countryside was first being collonized and Loftwick was in its infantcy. It is hundreds of years old, but has been maintained over the years and is still a formitable stronghold."


BuildingArray(109,2)	= "Galathad Village (AKA Old Town)"

BuildingArray(111,2)	= "Friderich &amp; Voss Apartments"

BuildingArray(113,2)	= "Throbbushire`s Accomodations"

BuildingArray(114,2)	= "The Burgmann Prison"
BuildingArray(114,4)	= "All prisoners who are not on public display (stockages, etc.) or actively in court, are kept in this dark and foreboading complex."

BuildingArray(115,2)	= "The Warren Home for the Deranged"

BuildingArray(117,2)	= "The Ant-Men Den"

BuildingArray(119,2)	= "Curshwington Hall &amp; Court"

BuildingArray(120,2)	= "The Freetown Building"

' Scornwall East
BuildingArray(110,2)	= "Blackbriar House"
BuildingArray(110,4)	= "A popular tavern just outside the walls of Loftwick that caters to travelers and the locals. Food and lodgings range from poor to modest."

BuildingArray(122,2)	= "Yargo`s Clankhorse Stables"
BuildingArray(122,4)	= "Travelers are discouraged from bringing horses within the city limits and Yargo's is a popular place for travelers to stable their steeds. The price to stable a horse is 2sp/day."

BuildingArray(126,2)	= "Morrow`s Clankhourse Stables"
BuildingArray(126,4)	= "Travelers are discouraged from bringing horses within the city limits and Yargo's is a popular place for travelers to stable their steeds. The price to stable a horse is 2sp/day."

BuildingArray(161,2)	= "Dorrin's General Store"
BuildingArray(161,4)	= "A large general store, run by dwarves. Any common item can be purchased here, but nothing special is likely available."

BuildingArray(125,2)	= "Heckler Hall"

BuildingArray(128,2)	= "Castle Court Building"


' Scornwall North
BuildingArray(108,2)	= "Shrine to the Moon"

BuildingArray(112,2)	= "Guild of Thieves, Pilferers, Heisters, Purloiners and Larcenists"

BuildingArray(116,2)	= "The Skulduggery Tavern"
BuildingArray(116,4)	= "A rough and seedy bar that caters to a not-so-gentle clientel."

BuildingArray(118,2)	= "The Old Brando Building"

BuildingArray(129,2)	= "The Menowheth Court House"
BuildingArray(129,4)	= "Though beyond the walls of Loftwick, The Menowheth Court House conducts trials for lesser crimes (which are common in Scornwall)"

BuildingArray(197,2)	= "The Adventurers Guild"
BuildingArray(197,4)	= "Located just beyone the The Teal Gate in Scornwall North, The Adventurers Guild is a place for individuals or partys to find like-minded people. It is run by |Janiq_of_Tarn|. To get in, you must pay 1 gp/day, 100 gp/year or 1,000gp/life membership (not including food, drink, lodging, etc.)"



' Greygwynn Rocky Outcrops
BuildingArray(121,2)	= "The Community of the Snub Folks"
BuildingArray(121,4)	= "These dilapidated buildings are all that remain of an old, played-out mining community. Its residents are considerred to be theives, cheats and beggers."



' Fennlove Farmlands
BuildingArray(123,2)	= "The Nicklefry Silo"
BuildingArray(123,4)	= "A massive grain silo located beyond the city walls. There are several Yeoman guarding it at all times and several clerks and workers during the day."

BuildingArray(127,2)	= "The Yannos dac Yessis Silo"
BuildingArray(127,4)	= "A large grain silo located beyond the city walls. There are several Yeoman guarding it at all times and several clerks and workers during the day."



' Hoyra'am Hill Farms
BuildingArray(124,2)	= "Hobbs Family Farms"
BuildingArray(124,4)	= "The Hobbs Family owns one of the largest collections of farms on Hoyra'am Hills."

BuildingArray(130,2)	= "Monolisk Silo"
BuildingArray(130,4)	= "A large grain silo located beyond the city walls. There are several Yeoman guarding it at all times and several clerks and workers during the day."



BuildingArray(131,2)	= "The Blackheat Family Farm"

BuildingArray(132,2)	= "Fonschaffs Dungspider Silk Farm"

BuildingArray(140,2)	= "Dacc Tharon Forest"









'======================================================

' Docks array
dim DockArray(14, 5)
for xx1 = 1 to 14
	DockArray(xx1,1) = "D" & xx1
	DockArray(xx1,2) = ""
	DockArray(xx1,3) = ""
	DockArray(xx1,4) = ""
next

DockArray(1,2)		= "Hammond the Sage`s Dock"
DockArray(1,4)		= "One of the many stone docks along the waters. It is named for a famous mage from several hundred years ago."

DockArray(2,2)		= "Dock of the Teal Priestess"
DockArray(2,4)		= "One of the many stone docks along the waters."

DockArray(3,2)		= "The Greasy Docklands"
DockArray(3,4)		= "One of the many stone docks along the waters."

DockArray(4,2)		= "Voidsinger Dock"
DockArray(4,4)		= "One of the many stone docks along the waters."

DockArray(5,2)		= "Armorhead Dock"
DockArray(5,4)		= "One of the many stone docks along the waters."

DockArray(6,2)		= "Saint Jormung Dock"
DockArray(6,4)		= "One of the many stone docks along the waters."

DockArray(7,2)		= "Dock of the Saint Westor Lockard"
DockArray(7,4)		= "One of the many stone docks along the waters."

DockArray(8,2)		= "Distiction Dock"
DockArray(8,4)		= "One of the many stone docks along the waters."

DockArray(9,2)		= "The Centralis Docks"
DockArray(9,4)		= "One of the many stone docks along the waters."

DockArray(10,2)	= "The Empress` Private Pier"
DockArray(10,4)	= "One of the many stone docks along the waters."

DockArray(12,2)	= "The Smogtown Docklands"
DockArray(12,4)	= "These docks are located at the base of the cliffs surrounding much of Loftwick."

DockArray(13,2)	= "Garalark Docks"

'======================================================

' Gates array
dim GateArray(10, 5)
for xx1 = 1 to 10
	GateArray(xx1,1) = "G" & xx1
	GateArray(xx1,2) = ""
	GateArray(xx1,3) = ""
	GateArray(xx1,4) = "One of the 7 massive gates to Loftwick. A massive portculis can be lowered and huge door closed to seal the gate. Several Yeoman guard the entrance, with additional guards standing watch on the rampart."
next

GateArray(1,2)		= "The Teal Gate"

GateArray(2,2)		= "Execution Gate"
GateArray(2,4)		= GateArray(2,4) & " This gate gained its name because all prisoners who are executed are marched through this gate to the outskirts of town for sentence to be carried out."

GateArray(3,2)		= "Penderghast`s Gate"

GateArray(4,2)		= "The Gate of Truth"

GateArray(5,2)		= "The Baleful Gate"

GateArray(6,2)		= "The Gate of Melted Cutlery"

GateArray(7,2)		= "The Hydrohymn Gate"

'======================================================

' Parks array
dim ParkArray(20, 5)
for xx1 = 1 to 16
	ParkArray(xx1,1) = "P" & xx1
	ParkArray(xx1,2) = ""
	ParkArray(xx1,3) = ""
	ParkArray(xx1,4) = "One of the many parks provided by the city."
next

ParkArray(1,2)		= "Sanctum Park and Menagerie"
ParkArray(1,4)		= ParkArray(1,4) & " There is a permanent zoo with enclosures throught the park. The price of admission is 1gp/person."
ParkArray(1,4)		= ParkArray(1,4) & "<br>a) Magical Beasts House (hipogriph, gryphon, owlbear, gnoll, displacer beast)"
ParkArray(1,4)		= ParkArray(1,4) & "<br>b) Parafly and Insect House (spiders, giant spider, ant colony, bees)"
ParkArray(1,4)		= ParkArray(1,4) & "<br>c) Large Mammel House (bears, wolves, deer, elk, etc.)"
ParkArray(1,4)		= ParkArray(1,4) & "<br>d) Wyvern Dome/Reptile House (wyvern, alligator, snakes, etc.)"
ParkArray(1,4)		= ParkArray(1,4) & "<br>e) Aquarium (trout, otters, bass, frogs, etc.)"
ParkArray(1,4)		= ParkArray(1,4) & "<br>f) Avian House (hawks, herons, sparrows, hummingbirds, etc.)"
ParkArray(1,4)		= ParkArray(1,4) & "<br>g) Cat House (tiger, panther, etc.)"

ParkArray(2,2)		= "Bulwark Park"

ParkArray(3,2)		= "The Usurper`s Park"

ParkArray(4,2)		= "Concordance Park"
ParkArray(4,4)		= ParkArray(4,4) & " A private park, only available to dignitaries."

ParkArray(5,2)		= "Alchemical Park"

ParkArray(6,2)		= "Lagomorph Park"

ParkArray(7,2)		= "Garden of Faces"
ParkArray(7,4)		= ParkArray(7,4) & " The park gets its name from the numerious statues of past heros of the city."

ParkArray(8,2)		= "Oakenhart Park"

ParkArray(9,2)		= "Aprimina Lovelace`s Park"

ParkArray(10,2)	= "The Rothechidum Gardens"
ParkArray(10,4)	= ParkArray(10,4) & " This is the only parks outside the city walls."

ParkArray(11,2)	= "Omicron Park"

ParkArray(12,2)	= "Carbuncle Park"

ParkArray(13,2)	= "The Oil Gardens"
ParkArray(13,4)	= ParkArray(13,4) & " There are several colored-oil fountains in this area, thus the name."

ParkArray(14,2)	= "The Empress` Commons"

ParkArray(15,2)	= "Roffo`s Park"

ParkArray(16,2)	= "Shrimp Park"

'======================================================

' Regions arrays
dim RegionArray(30, 5)
for xx1 = 1 to 30
	RegionArray(xx1,1) = "R" & xx1
	RegionArray(xx1,2) = ""
	RegionArray(xx1,3) = ""
	RegionArray(xx1,4) = ""
next

RegionArray(1,2)	= "The Urovangian`s Quarter"
RegionArray(1,3)	= "Loftwick_Urovangians_Quarter.asp"

RegionArray(2,2)	= "Habadock & Quest"
RegionArray(2,3)	= "Loftwick_Habadock_Quest.asp"

RegionArray(3,2)	= "Dreodae District"
RegionArray(3,3)	= "Loftwick_Dreodae_District.asp"

RegionArray(4,2)	= "Embassy Island"
RegionArray(4,3)	= "Loftwick_Embassy_Island.asp"

RegionArray(5,2)	= "Sanctia District"
RegionArray(5,3)	= "Loftwick_Sanctia_District.asp"

RegionArray(6,2)	= "The Orichalcum District"
RegionArray(6,3)	= "Loftwick_Orichalcum_District.asp"

RegionArray(7,2)	= "Copsic District"
RegionArray(7,3)	= "Loftwick_Copsic_District.asp"

RegionArray(8,2)	= "Gorro Hill"
RegionArray(8,3)	= "Loftwick_Gorro_Hill.asp"

RegionArray(9,2)	= "Upper Uther Isle"
RegionArray(9,3)	= "Loftwick_Upper_Uther_Isle.asp"

RegionArray(10,2)	= "Lower Uther Isle"
RegionArray(10,3)= "Loftwick_Lower_Uther_Isle.asp"

RegionArray(11,2)	= "The Pinion Isles"
RegionArray(11,3)	= "Loftwick_Pinion_Isles.asp"

RegionArray(12,2)	= "Isambard District"
RegionArray(12,3)	= "Loftwick_Isambard_District.asp"

RegionArray(13,2)	= "Smogtown"
RegionArray(13,3)	= "Loftwick_Smogtown.asp"

RegionArray(14,2)	= "Combine Yard"
RegionArray(14,3)	= "Loftwick_Combine_Yard.asp"

RegionArray(15,2)	= "Shael Town"
RegionArray(15,3)	= "Loftwick_Shael_Town.asp"

RegionArray(16,2)	= "The Meadows"
RegionArray(16,3)	= "Loftwick_The_Meadows.asp"

RegionArray(17,2)	= "Scornwall (East)"
RegionArray(17,3)	= "Loftwick_Scornwall_East.asp"

RegionArray(18,2)	= "Scornwall (West)"
RegionArray(18,3)	= "Loftwick_Scornwall_West.asp"

RegionArray(19,2)	= "Scornwall (North West)"
RegionArray(19,3)	= "Loftwick_Scornwall_North_West.asp"

RegionArray(20,2)	= "Scornwall (North)"
RegionArray(20,3)	= "Loftwick_Scornwall_North.asp"

RegionArray(21,2)	= "Scornwall (South)"
RegionArray(21,3)	= "Loftwick_Scornwall_South.asp"

RegionArray(22,2)	= "Salacus Fields"
RegionArray(22,3)	= "Loftwick_Salacus_Fields.asp"

RegionArray(23,2)	= "The Fennlove Farmlands"
RegionArray(23,3)	= "Loftwick_Fennlove_Farmlands.asp"

RegionArray(24,2)	= "Hoyraam Hill Farms"
RegionArray(24,3)	= "Loftwick_Hoyraam_Hill_Farms.asp"

RegionArray(25,2)	= "Dacc Tharon Forest"
RegionArray(25,3)	= "Loftwick_Dacc_Tharon_Forest.asp"

RegionArray(26,2)	= "Tho`dan Farms"
RegionArray(26,3)	= "Loftwick_Thodan_Farms.asp"

RegionArray(27,2)	= "The Greygwynn Rocky Outcrop"
RegionArray(27,3)	= "Loftwick_Greygwynn_Rocky_Outcrop.asp"

RegionArray(28,2)	= "Parade Grounds/Old Fort/Galathad Village"
RegionArray(28,3)	= "Loftwick_Parade_Grounds.asp"

'======================================================

' Squares arrays
dim SquareArray(18, 5)
for xx1 = 1 to 18
	SquareArray(xx1,1) = "S" & xx1
	SquareArray(xx1,2) = ""
	SquareArray(xx1,3) = ""
	SquareArray(xx1,4) = "One of a dozen large open-air markets."
next

SquareArray(1,2)	= "The Urovangian`s Square"
SquareArray(1,4)	= SquareArray(1,4) & " It surrounds the cathedral."

SquareArray(2,2)	= "Manifold Plaza"

SquareArray(3,2)	= "Merriment Plaza"
SquareArray(3,4)	= SquareArray(3,4) & " Due to the proximity the the Temple of Olidammara, this square has many things in the flavor of the God of Music and Merriment (wine, fruit, cheese). Minstrels and entertainers are scattered throughout."

SquareArray(4,2)	= "Square of the 10,000 Fists"
SquareArray(4,4)	= SquareArray(4,4) & " The name comes from a huge fight over a century ago."

SquareArray(5,2)	= "The Crimson Square"

SquareArray(6,2)	= "Saint Anameeve Brynn Plaza"

SquareArray(7,2)	= "Kappadon Square"

SquareArray(8,2)	= "Piazza Am Al-Veniss"

SquareArray(9,2)	= "Anatomy Plaza"

SquareArray(10,2)	= "Alchemy Square"
SquareArray(10,4)	= SquareArray(10,4) & " It caters specifically to the students in the nearby dorms."

SquareArray(11,2)	= "Nashq e-Throom Square"

SquareArray(12,2)	= "Oshen-Dan-Desh Plaza"

SquareArray(13,2)	= "The Sooty Market"

SquareArray(14,2)	= "Saint Schtraga`s Point"

SquareArray(15,2)	= "The Watercrafter`s Square"

SquareArray(16,2)	= "Archers Square"

SquareArray(17,2)	= "Holistic Plaza"
SquareArray(17,4)	= SquareArray(17,4) & " Located in the middle of the magi colleges, this market specializes in things useful to archane spell casters (material components, un-magiced wands & staffs, boots/cloaks/necklasses of the highest quality, etc.)"

'======================================================

' Wall arrays
dim WallArray(9, 5)
for xx1 = 1 to 9
	WallArray(xx1,1) = "W" & xx1
	WallArray(xx1,2) = ""
	WallArray(xx1,3) = ""
	WallArray(xx1,4) = ""
next

WallArray(1,2)	= "Eternal Bastion"
WallArray(1,4)	= "Originally planned as a gate to Loftwick, this instead is the citys largest tower."

WallArray(2,2)	= "Tower of Saint Mandark"

WallArray(3,2)	= "Hark Darrow Bastion"

WallArray(4,2)	= "The Thirlington Tower"
WallArray(4,4)	= "The final tower of the wall in on the South East of the city. It is build at the edge of the cliff-face and overlooks Sweetwater Lake and The Salacus Fields."

WallArray(5,2)	= "Fractured Wall"
WallArray(5,4)	= "A fractured wall of the city, damaged when a massive mix of flooding, ice and trees came crashing into the stone walls. It is currently being repaired."

WallArray(6,2)	= "Kodd Thaddis Keep"

WallArray(7,2)	= "The Dockland Bulwark"
WallArray(7,4)	= "Build on the waters of Clearwater lake, this wall shelters the The Smogtown Docklands"

'======================================================







function GetAllInfo(Area, Flavors)
	Area		= ucase(Area)		' Area code _ pseudo-name
	Flavors	= ucase(Flavors)	' What to build (a=anchor, t=title, h=hyperlink, d=details)

	' Extract the code & number
	UnderscorPos	= InStr(Area, "_")
	FirstChuck		= Left(Area, (UnderscorPos-1))
	AreaType			= Left(Area, 1)	' Extract the 1st character to determine which array we want

	' If the last character of FirstChuck is a letter, the value is a sub-building.
	' Set SubBuilding and remove the last character. This is a rare condition.
	LastChar = Right(FirstChuck, 1)
	if IsNumeric(LastChar) then
		SubBuilding = ""
	else
		SubBuilding	= LastChar
		NoChars		= Len(FirstChuck)-1
		FirstChuck	= Left(FirstChuck, NoChars)
	end if

	' Extract the code number
	if IsNumeric(AreaType) then
		' AreaType does not have a letter prefix (i.e. its a building)
		AreaNum = FirstChuck
	else
		' Remove the leading letter from AreaType (i.e. NOT a building)
'		AreaNum = Replace(FirstChuck, AreaType, "")
		AreaNum = Mid(FirstChuck, 2, 5)
	end if


'	if (Area = "R17_SCORNWALL_E") then
'		arg = "?UnderscorPos=" & UnderscorPos
'		arg = arg & "&FirstChuck=" & FirstChuck
'		arg = arg & "&AreaType=" & AreaType
'		arg = arg & "&AreaNum=" & AreaNum
'		Hyperlink = "http://www.ourfarm.org" & arg
'		Response.redirect(Hyperlink)
'	end if


	Select Case AreaType
		Case "B"		' Bridges
			RtnValue	= BuildArea(AreaNum, Flavors, BridgeArray, SubBuilding)

		Case "D"		' Docks
			RtnValue	= BuildArea(AreaNum, Flavors, DockArray, SubBuilding)

		Case "G"		' Gates
			RtnValue	= BuildArea(AreaNum, Flavors, GateArray, SubBuilding)

		Case "P"		' Parks
			RtnValue	= BuildArea(AreaNum, Flavors, ParkArray, SubBuilding)

		Case "R"		' Regions
			RtnValue	= BuildArea(AreaNum, Flavors, RegionArray, SubBuilding)

		Case "S"		' Squares
			RtnValue	= BuildArea(AreaNum, Flavors, SquareArray, SubBuilding)

		Case "W"		' Walls
			RtnValue	= BuildArea(AreaNum, Flavors, WallArray, SubBuilding)

		Case else	' Buidings, forts, etc.
			RtnValue	= BuildArea(AreaNum, Flavors, BuildingArray, SubBuilding)
	End Select

	if (RtnValue = "") then
		RtnValue = "title='undefined - " & Area & "'"
		RtnValue = replace(RtnValue, "'", chr(34))
	end if
	GetAllInfo = RtnValue
end function



function BuildArea(Pos, Flavors, PassedArray, SubBuilding)
' All Loftwick PassedArray values have the following format:
'		xxxArray(#,0)	= Unused (for ease of reading)
'		xxxArray(#,1)	= Code
'		xxxArray(#,2)	= Name
'		xxxArray(#,3)	= Web link
'		xxxArray(#,4)	= Full description
	RtnValue = ""
	if (InStr(Flavors, "D") > 0) then
		SpanOn	= ""
		SpanOff	= ""
		AreaType	= Left(PassedArray(Pos,1), 1)
		if IsNumeric(AreaType) then
			SpanOn	= "<span class=""LoftPlace"">"
			SpanOff	= "</span>"
		end if
		if (AreaType = "B") then
			SpanOn	= "<span class=""LoftBridge"">"
			SpanOff	= "</span>"
		end if
		if (AreaType = "D") then
			SpanOn	= "<span class=""LoftDock"">"
			SpanOff	= "</span>"
		end if
		if (AreaType = "G") then
			SpanOn	= "<span class=""LoftGate"">"
			SpanOff	= "</span>"
		end if
		if (AreaType = "P") then
			SpanOn	= "<span class=""LoftPark"">"
			SpanOff	= "</span>"
		end if
		if (AreaType = "S") then
			SpanOn	= "<span class=""LoftSquare"">"
			SpanOff	= "</span>"
		end if
		if (AreaType = "W") then
			SpanOn	= "<span class=""LoftWall"">"
			SpanOff	= "</span>"
		end if

		RtnValue = SpanOn & PassedArray(Pos, 1) & " - " & PassedArray(Pos, 2) & SpanOff
		if (PassedArray(Pos, 4) <> "") then
			PlaceDesc = PassedArray(Pos, 4)
			PipePos = InStr(PlaceDesc, "|")
			If (PipePos > 0) then
				' The pipe character was found.
				' 1) Convert the string into an array based on the pipe.
				' 2) Try to match the values in the array to a value in BacklinkArray(bb1, 0).
				' 3) If found, replace with the value with the value in BacklinkArray(bb1, 1).
				PlaceDesc			= Split(PlaceDesc, "|")
				NoBacklinkArray	= UBound(BacklinkArray)
				NoPlaceDesc			= UBound(PlaceDesc)

				for bb1 = 0 to NoBacklinkArray
					for bb2 = 0 to NoPlaceDesc
						if (PlaceDesc(bb2) = BacklinkArray(bb1, 0)) then
							PlaceDesc(bb2) = BacklinkArray(bb1, 1)
						end if
					next
				next

				PlaceDesc = Join(PlaceDesc, "")
			end if
			RtnValue = RtnValue & " - " & PlaceDesc
		end if
	else
		if (InStr(Flavors, "A") > 0) then
			RtnValue = RtnValue & "alt='" & PassedArray(Pos, 2) & "' "
		end if
		if (InStr(Flavors, "T") > 0) then
			RtnValue = RtnValue & "title='" & PassedArray(Pos, 1) & " - " & PassedArray(Pos, 2) & "' "
		end if
		if (InStr(Flavors, "H") > 0) then
			RtnValue = RtnValue & "href='" & PassedArray(Pos, 3) & Arg & "' "
		end if
	end if

	RtnValue = replace(RtnValue, "'", chr(34))
	BuildArea = RtnValue
end function


%>