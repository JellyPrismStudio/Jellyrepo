// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_language(){
	
	if global.lang == "PT" create_language_PT();
	if global.lang == "EN" create_language_EN();
}

function create_language_EN(){
	
		/// CODE:
		/// global.language.(code).(subcode).(subcode2)....
		//////
		
		global.language = {
			presets :
			{
				unknown: "???",	
				interact: "Interact",
				
			},
			system : {
				// Configurações
				config1 : "BGM Volume: ",
				config2 : "SFX Volume: ",
				config3 : "Follower Dist.: ",
				config4 : "Bloom Inten.: ",
				config5 : "Padding: ",
				config6 : "Follower Alpha: ",
				config7 : "Follower keep close when low HP",
				config8 : "Disable auxiliar light effects",
				config9 : "Disable basic light effects",
				config10: "Dynamic camera movement",
				config11: "Bloom FX",
				config12: "VHS FX",
				config13: "Auto aim marked enemies",
				config14: "Fullscreen",
				config15: "Scenario Animations",
				config16: "Show interactable events",
				
				
				desc3: "Distance from you to your follower",
				desc5: "Distance that you need to be of big objects to activate the transparent effect on them",
				desc6: "The alpha level of the follower",
				desc7: "If you are with HP low, your follower will keep close",
				desc10:"The camera slowly goes to the side your heading when walking.",
				desc13:"When you focuse on an enemy, your bullets will go in his direction.",
				desc16:"Show an mark where you can interact with the cenery, npcs and etc.",
			},
			
			shop: {
				sell: "Sell",
				buy: "Buy",
				amount: "x",
				
				page: "Page: ",
				nexpage: "Next Page",
				prepage: "Previous Page",
				
			},
			
			// Textos dos menus
			menu : {		
				// Nomes dado aos slots de itens no menu de equipamento
				elm : "Hat",
				armor: "Armor",
				weapon: "Weapon",
				acessory: "Gadget",
				notes: "Notes:",
				
				atk: "Attack",
				def: "Defense",
				mag: "Magic",
				eva: "Evasion",
				cri: "Critical",
				hit: "Hit",
				hp:  "HP",
				sp:  "SP",
				
				// Textos do menu de inventario
				inv: "Inventory",
				desc: "Description",
				chgp: "Change Player",
				
				filter: "Filter: ",
				effects: "Effects:",
				itemqt: "x on Inventory",
				useon: "Use on:",
				
				// Item classes:
				ic1: "all",
				ic2: "misc",
				ic3: "usable",
				ic4: "material",
				ic5: "craftable",
				ic6: "key",
				ic7: "equip",
				ic8: "weapon",
				ic9: "helmet",
				ic10: "armor",
				ic11: "acessories",
				
			},
			
			// Nomes e descrições dos itens
			itens: {
				// Dados das armaduras
				craftarmorname1: "Camiseta Ruim",
				craftarmortext1: "Uma camiseta toda remendada. Teria ela sido destruida ou o costureiro não era bom o suficiente?",
				craftarmorefct1: "",
				
				craftarmorname2: "Camiseta Simples",
				craftarmortext2: "Uma camiseta simples. Não tem nada demais sobre ela, é só uma camiseta (e bem feia)",
				craftarmorefct2: "",
				
				craftarmorname3: "Jaqueta de Inverno",
				craftarmortext3: "Uma jaqueta que protege contra o frio",
				craftarmorefct3: " ",
				
				craftarmorname4: "Chapeu (de bruxa?)",
				craftarmortext4: "É um chapéu que parece ter sido de alguma bruxa.",
				craftarmorefct4: "",
				
				armorname1: "Light Armor",
				armortext1: "A Light armor optimized to be more agile",
				armorefct1: "",
				
				// Dados dos itens
				noeffect: "",
				
				antenna: "Insect Antennae",
				antennadesc: "A Coin Sack containing some few coins",
				
				clover: "4-leaf clover",
				cloverdesc: "A Coin Sack containing some few coins",
				
				coin1: "Coin Sack",
				coin1desc: "A Coin Sack containing some few coins",
				
				feather1: "Feather",
				feather1desc: "A Feather capable of reanimate your allies... Tickling them",
				feather1effect: "Recoves one ally",
				
				fur: "Animal Fur",
				furdesc: "A Coin Sack containing some few coins",
				
				herb1: "Green Herb",
				herb1desc: "An Green herb containing medicinal properties",
				herb1effect: "Recovers 10 HP",
				
				potion1: "Small Potion",
				potion1desc: "A Small Potion that recover 50 Health Points",
				potion1effect: "Recovers 50 HP",
				
				potion2: "Medium Potion",
				potion2desc: "Medium Potion that recover 120 Health Points",
				potion2effect: "Recovers 120 HP",
				
				sheet: "Sheet",
				sheetdesc: "A Coin Sack containing some few coins",
				
				slime: "Slime",
				slimedesc: "A Coin Sack containing some few coins",

				sharpstone: "Sharp Stone",
				sharpstonedesc: "Lorem Ipsum",
				
			},
			
			// Nomes dos inimigos
			enemy: {
				// Nome dos inimigos
				bat:			"Bat",	
				snake:			"Snake",
				frog:			"Frog",
				mosquitoes:		"Mosquitoes",
				mosquito:		"Mosquito",
				moth:			"Moth",
				bee:			"Bee",
				
			},
			
			// Descrição dos inimigos no bestiário
			enemydesc: {
				// Descrição dos inimigos (vista no bestiário)
				bat:			"A Fearsome bat that lurks for his victims at night. Its fast and have an venomous bite.",	
				snake:			"Snakes in general are dangerous. Be aware of his bite and his poison spit",
				frog:			"Its just a frog. Not very dangerous.",	
				mosquitoes:		"A cloud of mosquitoes. They aren't venomous or poisonous, the're just too much",
				mosquito:		"An giant mosquito. From where this thing came from?",
				moth:			"A night moth. Spreads a poisonous smog on the air wherever it goes",
				bee:			"A belha",
			},
			
			// Interações com o cenário
			chat : {
				_empty: " ",
				_interact: {
					_Door1: "Enter",
					_Door2: "Exit",
					_Window1: "Look at Window",
					_1: "Inspect",
					_2: "Talk",
					
					_location1: "to Gas Station",
					_location2: "to Anie's Diner",
					_location3: "to Trailer Park",
					
				},
				_1 : {
					// Interação com lata de lixo em frente ao restaurante
					_default: "It's a trash can",
					
					lisa:  "I wonder if there's something that I can use here...",
					ryan:  "Just a trash can, nothing special here...",
					hanna: "Eew... I don't want to touch on anything here",
					dylan: "It's a cool old trash can",
				},
				
				_2 : {
					// Interação com quadros dentro do restaurante
					_default: "There's some pictures on the wall.",
					
					lisa:  "Burgers, trucks, famous singers... \nAll of restaurants have these kind of pictures?",
					ryan:  "Wow, it's a T-ruck 980? That's so awesome",
					hanna: "It's better not even think on \n eat an burguer like the one of this photo",
					dylan: "Burguers, Fast cars and...\n WAIT, THIS IS MALVIS BRADLEY?",
				},
				
				_3 : {
					// Interação com quadros dentro do restaurante
					_default: "No, I'm sorry...",
					
					lisa:  "",
					ryan:  "",
					hanna: "",
					dylan: "?",
				},
				
				_4 : {
					// Interação com o balcão do resutarante
					_default: "Hello...\n there's anyone there?!",
					
					lisa:  "Should have an waitress here to take the orders. \nMaybe she's in the kitchen?",
					ryan:  "I could eat an burger right now...",
					hanna: "I don't want to eat anything fat for now.\n I need to keep the diet to become an cheerleader",
					dylan: "I could eat thousand tons of burgers.",
				},
				
				/* - Multiple interaction - */
				_5 : {
					a : {
						// Velho no restaurante
						
						choice1: "Talk",
						choice2: "Ask for help",
						
						// Talk
						oldman1name: "Ol'  McDons",
						oldman1 : "Did you saw the waitress around here?\n I want to order a burger.",
						
						lisa:  "Nope.",
						ryan:  "I didn't saw her. Maybe in the kitchen?",
						hanna: "No, sorry.",
						dylan: "I didn't saw, but if you see her, I'll want a burger too!",						
					},
					
					b : {
						oldman1name: "Ol'  McDons",
						oldman1 : "I'll wait a little bit more then.",
						
						lisa:  "Alright.",
						ryan:  "Sure thing",
						hanna: "Okay, have a good night!.",
						dylan: "Nice.",						
					},
					c : {
						oldman1name: "Ol'  McDons",
						oldman1 : "I'll wait a little bit more then.",						
					},
					
					aa : {
						oldman1name: "Ol' McDons",
						oldman1: "I'm too old to help you, kids. I'm sorry..."
					}
				},
					
				_6 : {
					lisa:  "I can see the road through this window and see\n the litle shake that bushes do when\n the wind pass through them.",
					ryan:  "Theresn't much cars on the parking lot.\n I use to come here with my Vista Traveler.\n Its such a cool place.",
					hanna: "Looking at the night, be here inside the diner\n makes me fell comfy.",
					dylan: "The night is a teenager and I'm the party animator.\n Lfgo",					
				},
				_7 : {
					lisa:  "I can see the road through this window and see\n the litle shake that bushes do when\n the wind pass through them.",
					ryan:  "Theresn't much cars on the parking lot.\n I use to come here with my Vista Traveler.\n Its such a cool place.",
					hanna: "Looking at the night, be here inside the diner\n makes me fell comfy.",
					dylan: "The night is a teenager and I'm the party animator.\n Lfgo",					
				},
				
				npc: {
					// Velho no restaurante || OBSOLETO
					oldman1name: "Ol'  McDons",
					oldman1 : "Did you saw the waitress around here?\n I want to order a burger.",
					oldman1b: "If I have one restaurant \nI'll  do it my best to make them faster.\n I would call them 'Fast Food'.",
					
					// Jovem na conveniencia do posto
					steve1name: "Steve",
					steve1: "Hello, welcome to Jim's convenience, can I help you?",
					
					// Resposta de quando alguem fecha a janela de compras
					steve2: "Thank you very much!",
					
					// Resposta de quando alguem fecha a janela de vendas
					steve3: "Yep, that would be useful. Thanks!",
					},
					
				},
			
			// Mensagens da main quest/história
			main :
			{
				s0:
				{
					m1: "Ugh",
					m2: "Where am I?",
					m3: "How did I get here?",
					m4: "Better look for someone else...",
					m5: "There's a light down there, may be the exit.",
					
					m6: "A fence... How do I open?",
					m7: "Hmmmm, those wires, thei're conected with the gate",
					m8: "Maybe if I pull this trigger",
					m9: "It worked!",
					m10:"Ah, got it! I need to be fast",
					
					m11: "What??",
					m12: "What is this thing?",
					m13: "Thoose people... They're... Trapped?",
					m14: "What? Who are you?",
					m15: "401j 429jk 7694njr sik019k",
					m16: "Nooooooooooooo",
				}
				
				
			}
		}/////////////////////////////////////////////
}