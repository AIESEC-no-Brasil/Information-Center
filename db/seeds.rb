# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([},{ name: 'Chicago' }, },{ name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([},{ name: 'Chicago' }, },{ name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tags = Tag.create([{ name: 'TM' }, { name: 'ICX' },{ name: 'OGX' },{ name: 'GCDP' },{ name: 'GIP' }, { name: 'FIN' },
	{ name: 'MKT' },{ name: 'OUTPUT' },{ name: 'APRESENTAÇÃO' },{name: 'TREINAMENTO' },
	{name: 'FERRAMENTA'}, {name: 'RELATÒRIO'}   ])

offices = ExpaOffice.create([
	{ xp_id: 1300 ,xp_name: "BRASILIA" ,xp_full_name: "AIESEC in BRASILIA"  ,xp_url: "https://gis.aiesec.org/v1/offices/1300" 
},{xp_id:1606, xp_name: "BRAZIL",xp_full_name: "AIESEC in BRAZIL",xp_url: "https://gis.aiesec.org/v1/offices/1606"},
{xp_id:288, xp_name: "PUC SP",xp_full_name: "AIESEC in PUC SP",xp_url: "https://gis.aiesec.org/v1/offices/288"},
{ xp_id: 541, xp_name: "Recife",xp_full_name: "AIESEC in Recife",xp_url: "https://gis.aiesec.org/v1/offices/541"
},{ xp_id: 777, xp_name: "RIO DE JANEIRO",xp_full_name: "AIESEC in RIO DE JANEIRO",xp_url: "https://gis.aiesec.org/v1/offices/777"
},{ xp_id: 854, xp_name: "PORTO ALEGRE",xp_full_name: "AIESEC in PORTO ALEGRE",xp_url: "https://gis.aiesec.org/v1/offices/854"
},{ xp_id: 286, xp_name: "Fortaleza",xp_full_name: "AIESEC in Fortaleza",xp_url: "https://gis.aiesec.org/v1/offices/286"
},{ xp_id: 1248, xp_name: "BELO HORIZONTE",xp_full_name: "AIESEC in BELO HORIZONTE",xp_url: "https://gis.aiesec.org/v1/offices/1248"
},{ xp_id: 1178, xp_name: "CURITIBA",xp_full_name: "AIESEC in CURITIBA",xp_url: "https://gis.aiesec.org/v1/offices/1178"
},{ xp_id: 943, xp_name: "GETULIO VARGAS",xp_full_name: "AIESEC in GETULIO VARGAS",xp_url: "https://gis.aiesec.org/v1/offices/943"
},{ xp_id: 1766, xp_name: "Campo Grande",xp_full_name: "AIESEC in Campo Grande",xp_url: "https://gis.aiesec.org/v1/offices/1766"
},{ xp_id: 1003, xp_name: "USP",xp_full_name: "AIESEC in USP",xp_url: "https://gis.aiesec.org/v1/offices/1003"
},{ xp_id: 1666, xp_name: "João Pessoa",xp_full_name: "AIESEC in João Pessoa",xp_url: "https://gis.aiesec.org/v1/offices/1666"
},{ xp_id: 1121, xp_name: "SALVADOR",xp_full_name: "AIESEC in SALVADOR",xp_url: "https://gis.aiesec.org/v1/offices/1121"
},{ xp_id: 436, xp_name: "ESPM",xp_full_name: "AIESEC in ESPM",xp_url: "https://gis.aiesec.org/v1/offices/436"
},{ xp_id: 100,xp_name: "ARACAJU",xp_full_name: "AIESEC in ARACAJU",xp_url: "https://gis.aiesec.org/v1/offices/100"
},{ xp_id: 434, xp_name: "GOIANIA",xp_full_name: "AIESEC in GOIANIA",xp_url: "https://gis.aiesec.org/v1/offices/434"
},{ xp_id: 467, xp_name: "RIBEIRAO PRETO",xp_full_name: "AIESEC in RIBEIRAO PRETO",xp_url: "https://gis.aiesec.org/v1/offices/467"
},{ xp_id: 723, xp_name: "Maringá",xp_full_name: "AIESEC in Maringá",xp_url: "https://gis.aiesec.org/v1/offices/723"
},{ xp_id: 233, xp_name: "Insper",xp_full_name: "AIESEC in Insper",xp_url: "https://gis.aiesec.org/v1/offices/233"
},{ xp_id: 988, xp_name: "FLORIANOPOLIS",xp_full_name: "AIESEC in FLORIANOPOLIS",xp_url: "https://gis.aiesec.org/v1/offices/988"
},{ xp_id: 284, xp_name: "FRANCA",xp_full_name: "AIESEC in FRANCA",xp_url: "https://gis.aiesec.org/v1/offices/284"
},{ xp_id: 230, xp_name: "SOROCABA",xp_full_name: "AIESEC in SOROCABA",xp_url: "https://gis.aiesec.org/v1/offices/230"
},{ xp_id: 437, xp_name: "LONDRINA",xp_full_name: "AIESEC in LONDRINA",xp_url: "https://gis.aiesec.org/v1/offices/437"
},{ xp_id: 148, xp_name: "PELOTAS",xp_full_name: "AIESEC in PELOTAS",xp_url: "https://gis.aiesec.org/v1/offices/148"
},{ xp_id: 232, xp_name: "Joinville",xp_full_name: "AIESEC in Joinville",xp_url: "https://gis.aiesec.org/v1/offices/232"
},{ xp_id: 1731, xp_name: "Balneário Camboriú",xp_full_name: "AIESEC in Balneário Camboriú",xp_url: "https://gis.aiesec.org/v1/offices/1731"
},{ xp_id: 287, xp_name: "UBERLANDIA",xp_full_name: "AIESEC in UBERLANDIA",xp_url: "https://gis.aiesec.org/v1/offices/287"
},{ xp_id: 285, xp_name: "SANTA CRUZ DO SUL",xp_full_name: "AIESEC in SANTA CRUZ DO SUL",xp_url: "https://gis.aiesec.org/v1/offices/285"
},{ xp_id: 479, xp_name: "ITAJUBA",xp_full_name: "AIESEC in ITAJUBA",xp_url: "https://gis.aiesec.org/v1/offices/479"
},{ xp_id: 909, xp_name: "VITORIA",xp_full_name: "AIESEC in VITORIA",xp_url: "https://gis.aiesec.org/v1/offices/909"
},{ xp_id: 435, xp_name: "São Carlos",xp_full_name: "AIESEC in São Carlos",xp_url: "https://gis.aiesec.org/v1/offices/435"
},{ xp_id: 231, xp_name: "MANAUS",xp_full_name: "AIESEC in MANAUS",xp_url: "https://gis.aiesec.org/v1/offices/231"
},{ xp_id: 958, xp_name: "Santa Maria",xp_full_name: "AIESEC in Santa Maria",xp_url: "https://gis.aiesec.org/v1/offices/958"
},{ xp_id: 1368, xp_name: "ITA",xp_full_name: "AIESEC in ITA",xp_url: "https://gis.aiesec.org/v1/offices/1368"
},{ xp_id: 32, xp_name: "Bauru",xp_full_name: "AIESEC in Bauru",xp_url: "https://gis.aiesec.org/v1/offices/32"
},{ xp_id: 1816, xp_name: "Santos (Baixada Santista)",xp_full_name: "AIESEC in Santos (Baixada Santista)",xp_url: "https://gis.aiesec.org/v1/offices/1816"
},{ xp_id: 283, xp_name: "Chapecó",xp_full_name: "AIESEC in Chapecó",xp_url: "https://gis.aiesec.org/v1/offices/283"}

	])