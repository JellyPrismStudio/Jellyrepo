// Os ativos do script foram alterados para a versão 2.3.0, veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function create_language_PT(){

		///////
		/// CÓDIGO:
		/// global.language.(código).(subcódigo).(subcódigo2)....
		//////

		global.language = {
			presets :
			{
				unknown: "???",
				interact: "Interagir",

			},
			system : {
				// Configurações
				config1 : "Volume da BGM: ",
				config2 : "Volume do SFX: ",
				config3 : "Distância do Seguidor: ",
				config4 : "Intensidade do Bloom: ",
				config5 : "Preenchimento: ",
				config6 : "Alfa do Seguidor: ",
				config7 : "Seguidor fica perto quando HP baixo",
				config8 : "Desativar efeitos de luz auxiliares",
				config9 : "Desativar efeitos básicos de luz",
				config10: "Movimento dinâmico da câmera",
				config11: "Efeito de Bloom",
				config12: "Efeito VHS",
				config13: "Alvo automático para inimigos marcados",
				config14: "Tela cheia",
				config15: "Animações de cenário",
				config16: "Mostrar eventos interativos",

				desc3: "Distância entre você e seu seguidor",
				desc5: "Distância que você precisa estar de objetos grandes para ativar o efeito transparente neles",
				desc6: "Nível alfa do seguidor",
				desc7: "Se você estiver com HP baixo, seu seguidor ficará próximo",
				desc10:"A câmera se move lentamente para o lado em que você está indo quando está andando.",
				desc13:"Quando você mira em um inimigo, suas balas seguirão em sua direção.",
				desc16:"Mostra uma marca onde você pode interagir com o cenário, NPCs, etc.",
			},

			shop: {
				sell: "Vender",
				buy: "Comprar",
				amount: "x",

				page: "Página: ",
				nexpage: "Próxima Página",
				prepage: "Página Anterior",

			},

			// Textos dos menus
			menu : {		
				// Nomes dados aos slots de itens no menu de equipamento
				elm : "Chapéu",
				armor: "Armadura",
				weapon: "Arma",
				acessory: "Acessório",
				notes: "Notas:",

				atk: "Ataque",
				def: "Defesa",
				mag: "Magia",
				eva: "Evasão",
				cri: "Crítico",
				hit: "Acerto",
				hp:  "HP",
				sp:  "SP",

				// Textos do menu de inventário
				inv: "Inventário",
				desc: "Descrição",
				chgp: "Mudar Jogador",
			},

			// Nomes e descrições dos itens
			itens: {
				// Dados das armaduras
				craftarmorname1: "Camiseta Ruim",
				craftarmortext1: "Uma camiseta toda remendada. Teria sido destruída ou o costureiro não era bom o suficiente?",
				craftarmorefct1: " ",

				craftarmorname2: "Camiseta Simples",
				craftarmortext2: "Uma camiseta simples. Não tem nada demais sobre ela, é só uma camiseta (e bem feia)",
				craftarmorefct2: " ",

				craftarmorname3: "Jaqueta de Inverno",
				craftarmortext3: "Uma jaqueta que protege contra o frio",
				craftarmorefct3: " ",

				craftarmorname4: "Chapéu (de bruxa?)",
				craftarmortext4: "É um chapéu que parece ter pertencido a uma bruxa.",
				craftarmorefct4: " ",

				armorname1: "Armadura Leve",
				armortext1: "Uma armadura leve otimizada para ser mais ágil",
				armorefct1: " ",

				// Dados dos itens
				noeffect: "",

				antenna: "Antena de Inseto",
				antennadesc: "Um Saco de Moedas contendo algumas poucas moedas",

				clover: "Trevo de 4 Folhas",
				cloverdesc: "Um Saco de Moedas contendo algumas poucas moedas",

				coin1: "Saco de Moedas",
				coin1desc: "Um Saco de Moedas contendo algumas poucas moedas",

				feather1: "Pena",
				feather1desc: "Uma pena capaz de reanimar seus aliados... Fazendo cócegas neles",
				feather1effect: "Recupera um aliado",

				fur: "Pele de Animal",
				furdesc: "Um Saco de Moedas contendo algumas poucas moedas",

				herb1: "Erva Verde",
				herb1desc: "Uma erva verde com propriedades medicinais",
				herb1effect: "Recupera 10 HP",

				potion1: "Poção Pequena",
				potion1desc: "Uma Pequena Poção que recupera 50 Pontos de Vida",
				potion1effect: "Recupera 50 HP",

				potion2: "Poção Média",
				potion2desc: "Poção Média que recupera 120 Pontos de Vida",
				potion2effect: "Recupera 120 HP",

				sheet: "Lençol",
				sheetdesc: "Um Saco de Moedas contendo algumas poucas moedas",

				slime: "Geleca",
				slimedesc: "Um Saco de Moedas contendo algumas poucas moedas",

				sharpstone: "Pedra Afiada",
				sharpstonedesc: "Lorem Ipsum",

			},

			// Nomes dos inimigos
			enemy: {
				// Nomes dos inimigos
				bat:			"Morcego",	
				snake:			"Cobra",
				frog:			"Sapo",
				mosquitoes:		"Percevejos",
				mosquito:		"Percevejo",
				moth:			"Traça",
				bee:			"Abelha",

			},

			// Descrição dos inimigos no bestiário
			enemydesc: {
				// Descrição dos inimigos (vista no bestiário)
				bat:			"Um morcego temível que espreita suas vítimas à noite. É rápido e tem uma mordida venenosa.",
				snake:			"Cobras em geral são perigosas. Cuidado com sua mordida e seu cuspe venenoso.",
				frog:			"É apenas um sapo. Não é muito perigoso.",
				mosquitoes:		"Uma nuvem de percevejos. Eles não são venenosos ou perigosos, são apenas muitos",
				mosquito:		"Um pernilongo gigante. De onde veio essa coisa?",
				moth:			"Uma traça noturna. Espalha uma fumaça venenosa no ar onde quer que vá",
				bee:			"A abelha",
			},

			// Interações com o cenário
			chat : {
				_empty: " ",
				_interact: {
					_Door1: "Entrar",
					_Door2: "Sair",
					_Window1: "Olhar pela janela",
					_1: "Inspecionar",
					_2: "Conversar",

					_location1: "para o Posto de Gasolina",
					_location2: "para o Diner da Anie",
					_location3: "para o Trailer Park",

				},
				_1 : {
					// Interação com a lixeira em frente ao restaurante
					_default: "É uma lixeira",

					lisa:  "Eu me pergunto se tem algo que eu possa usar aqui...",
					ryan:  "Apenas uma lixeira, nada de especial aqui...",
					hanna: "Eca... Eu não quero tocar em nada aqui",
					dylan: "É uma lixeira antiga legal",
				},

				_2 : {
					// Interação com quadros dentro do restaurante
					_default: "Tem algumas fotos na parede.",

					lisa:  "Hambúrgueres, caminhões, cantores famosos...\nTodos os restaurantes têm esse tipo de fotos?",
					ryan:  "Nossa, é um T-ruck 980? Isso é muito incrível",
					hanna: "É melhor nem pensar em comer um hambúrguer como o da foto",
					dylan: "Hambúrgueres, carros rápidos e...\nESPERA, ESSE É O MALVIS BRADLEY?",
				},

				_3 : {
					// Interação com quadros dentro do restaurante
					_default: "Não, desculpe...",

					lisa:  "",
					ryan:  "",
					hanna: "",
					dylan: "?",
				},

				_4 : {
					// Interação com o balcão do restaurante
					_default: "Olá...\n tem alguém aí?!",

					lisa:  "Deveria ter uma garçonete aqui para anotar os pedidos. \nTalvez ela esteja na cozinha?",
					ryan:  "Eu poderia comer um hambúrguer agora...",
					hanna: "Eu não quero comer nada gorduroso por agora.\n Preciso manter a dieta para me tornar uma líder de torcida",
					dylan: "Eu poderia comer toneladas de hambúrgueres.",
				},

				/* - Múltiplas interações - */
				_5 : {
					a : {
						// Velho no restaurante

						choice1: "Conversar",
						choice2: "Pedir ajuda",

						// Conversar
						oldman1name: "Velho McDons",
						oldman1 : "Você viu a garçonete por aqui?\n Eu quero pedir um hambúrguer.",

						lisa:  "Não vi.",
						ryan:  "Não vi ela. Talvez esteja na cozinha?",
						hanna: "Não, desculpe.",
						dylan: "Não vi, mas se você vê-la, eu também quero um hambúrguer!",						
					},

					b : {
						oldman1name: "Velho McDons",
						oldman1 : "Vou esperar um pouco mais então.",

						lisa:  "Certo.",
						ryan:  "Claro",
						hanna: "Ok, tenha uma boa noite!.",
						dylan: "Legal.",						
					},
					c : {
						oldman1name: "Velho McDons",
						oldman1 : "Vou esperar um pouco mais então.",						
					},

					aa : {
						oldman1name: "Velho McDons",
						oldman1: "Eu sou muito velho para ajudar vocês, crianças. Sinto muito..."
					}
				},

				_6 : {
					lisa:  "Consigo ver a estrada através desta janela e ver\n o pequeno tremor que os arbustos fazem quando\n o vento passa por eles.",
					ryan:  "Não há muitos carros no estacionamento.\n Costumava vir aqui com meu Vista Traveler.\n É um lugar tão legal.",
					hanna: "Olhando a noite, estar aqui dentro do diner\n me faz sentir confortável.",
					dylan: "A noite é uma adolescente e eu sou o animador da festa.\n Lfgo",					
				},
				_7 : {
					lisa:  "Consigo ver a estrada através desta janela e ver\n o pequeno tremor que os arbustos fazem quando\n o vento passa por eles.",
					ryan:  "Não há muitos carros no estacionamento.\n Costumava vir aqui com meu Vista Traveler.\n É um lugar tão legal.",
					hanna: "Olhando a noite, estar aqui dentro do diner\n me faz sentir confortável.",
					dylan: "A noite é uma adolescente e eu sou o animador da festa.\n Lfgo",					
				},

				npc: {
					// Velho no restaurante || OBSOLETO
					oldman1name: "Velho McDons",
					oldman1 : "Você viu a garçonete por aqui?\n Eu quero pedir um hambúrguer.",
					oldman1b: "Se eu tivesse um restaurante \neu faria o meu melhor para fazê-los mais rápidos.\n Eu os chamaria de 'Fast Food'.",

					// Jovem na loja de conveniência do posto
					steve1name: "Steve",
					steve1: "Olá, bem-vindo à conveniência do Jim, posso ajudar você?",

					// Resposta quando alguém fecha a janela de compras
					steve2: "Muito obrigado!",

					// Resposta quando alguém fecha a janela de vendas
					steve3: "Sim, isso seria útil. Obrigado!",
					},

				},

			// Mensagens da missão principal/história
			main :
			{
				s0:
				{
					m1: "Argh",
					m2: "Onde estou?",
					m3: "Como cheguei aqui?",
					m4: "Melhor procurar outra pessoa...",
					m5: "Tem uma luz ali embaixo, pode ser a saída.",

					m6: "Uma cerca... Como abro isso?",
					m7: "Hmmmm, esses fios, eles estão conectados com o portão",
					m8: "Talvez se eu acionar esse gatilho",
					m9: "Funcionou!",
					m10:"Ah, entendi! Preciso ser rápido",
					
					m11: "O que??",
					m12: "O que é isso?",
					m13: "Essas pessoas... Elas estão... Presas?",
					m14: "O quê? Quem é você?",
					m15: "401j 429jk 7694njr sik019k",
					m16: "Nãããããããããããããããão",
				}
			}
		}/////////////////////////////////////////////
}
