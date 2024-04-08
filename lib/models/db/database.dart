import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Banco {
  static final Banco instance = Banco._();
  static Database? _database;
  // Construtor privado

  Banco._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'airports.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE IF NOT EXISTS airport_data (
"index" INTEGER,
  "ident" TEXT,
  "type" TEXT,
  "name" TEXT,
  "elevation_ft" INTEGER,
  "continent" TEXT,
  "iso_country" TEXT,
  "iso_region" TEXT,
  "municipality" TEXT,
  "gps_code" TEXT,
  "iata_code" TEXT,
  "local_code" TEXT,
  "coordinates" TEXT
);''');

    await db.rawInsert(
        '''INSERT INTO airport_data ("index", "ident", "type", "name", "elevation_ft", "continent", "iso_country", "iso_region", "municipality", "gps_code", "iata_code", "local_code", "coordinates") 
VALUES 
(1, "BR-0569", "medium_airport", "Glauber de Andrade Rocha Airport", "2940", "SA", "BR", "BR-BA", "Vitória da Conquista", "SBVC", "VDC", "BA0005", "-14.907885, -40.914804"),
(2, "JJD", "medium_airport", "Jericoacoara - Comandante Ariston Pessoa Regional Airport", "89", "SA", "BR", "BR-CE", "Cruz", "SBJE", "JJD", "CE0003", "-2.906425, -40.357338"),
(3, "SBAA", "medium_airport", "Conceição do Araguaia Airport", "653", "SA", "BR", "BR-PA", "Conceição do Araguaia", "SBAA", "CDJ", "PA0008", "-8.34835, -49.301498"),
(4, "SBAC", "medium_airport", "Aracati Dragão do Mar Regional Airport", "128", "SA", "BR", "BR-CE", "Aracati", "SBAC", "ARX", "CE0004", "-4.568896, -37.805135"),
(5, "SBAF", "medium_airport", "Campo Délio Jardim de Mattos Airport", "110", "SA", "BR", "BR-RJ", "Rio de Janeiro", "SBAF", "NULL", "RJ9002", "-22.875099, -43.384701"),
(6, "SBAN", "medium_airport", "Base Aérea Airport", "3731", "SA", "BR", "BR-GO", "Anápolis", "SBAN", "NULL", "GO9001", "-16.2292, -48.964298"),
(7, "SBAQ", "medium_airport", "Araraquara Airport", "2334", "SA", "BR", "BR-SP", "Araraquara", "SBAQ", "AQA", "SP0012", "-21.812, -48.132999"),
(8, "SBAR", "medium_airport", "Aracaju - Santa Maria International Airport", "139", "SA", "BR", "BR-SE", "Aracaju", "SBAR", "AJU", "SE0001", "-10.984, -37.070301"),
(9, "SBAT", "medium_airport", "Piloto Osvaldo Marques Dias Airport", "948", "SA", "BR", "BR-MT", "Alta Floresta", "SBAT", "AFL", "MT0003", "-9.866389, -56.106298"),
(10, "SBAU", "medium_airport", "Araçatuba Airport", "1361", "SA", "BR", "BR-SP", "Araçatuba", "SBAU", "ARU", "SP0009", "-21.141479, -50.424575"),
(11, "SBBE", "large_airport", "Val de Cans Júlio Cezar Ribeiro International Airport", "54", "SA", "BR", "BR-PA", "Belém", "SBBE", "BEL", "PA0001", "-1.379279, -48.476207"),
(12, "SBBG", "medium_airport", "Comandante Gustavo Kraemer Airport", "600", "SA", "BR", "BR-RS", "Bagé", "SBBG", "BGX", "RS0010", "-31.390499, -54.112202"),
(13, "SBBH", "medium_airport", "Pampulha - Carlos Drummond de Andrade Airport", "2589", "SA", "BR", "BR-MG", "Belo Horizonte", "SBBH", "PLU", "MG0003", "-19.8512, -43.9506"),
(14, "SBBI", "medium_airport", "Bacacheri Airport", "3057", "SA", "BR", "BR-PR", "Curitiba", "SBBI", "BFH", "PR0006", "-25.4051, -49.231998"),
(15, "SBBQ", "medium_airport", "Major Brigadeiro Doorgal Borges Airport", "3657", "SA", "BR", "BR-MG", "Barbacena", "SBBQ", "NULL", "MG9002", "-21.2672, -43.76101"),
(16, "SBBR", "large_airport", "Presidente Juscelino Kubitschek International Airport", "3497", "SA", "BR", "BR-DF", "Brasília", "SBBR", "BSB", "DF0001", "-15.869167, -47.920834"),
(17, "SBBT", "medium_airport", "Chafei Amsei Airport", "1898", "SA", "BR", "BR-SP", "Barretos", "SNBA", "BAT", "SNBA", "-20.584499359131, -48.594100952148"),
(18, "SBBV", "medium_airport", "Atlas Brasil Cantanhede Airport", "276", "SA", "BR", "BR-RR", "Boa Vista", "SBBV", "BVB", "RR0001", "2.845855, -60.690944"),
(19, "SBBW", "medium_airport", "Barra do Garças Airport", "1147", "SA", "BR", "BR-MT", "Barra do Garças", "SBBW", "BPG", "MT0008", "-15.861417, -52.389008"),
(20, "SBBZ", "medium_airport", "Umberto Modiano Airport", "10", "SA", "BR", "BR-RJ", "Cabo Frio", "SSBZ", "BZC", "RJ0012", "-22.770881, -41.96308"),
(21, "SBCA", "medium_airport", "Coronel Adalberto Mendes da Silva Airport", "2481", "SA", "BR", "BR-PR", "Cascavel", "SBCA", "CAC", "PR0005", "-25.000323, -53.501208"),
(22, "SBCC", "medium_airport", "Campo de Provas Brigadeiro Veloso", "1777", "SA", "BR", "BR-PA", "Novo Progresso", "SBCC", "NULL", "PA9001", "-9.33394, -54.965401"),
(23, "SBCF", "large_airport", "Tancredo Neves International Airport", 2721, "SA", "BR", "BR-MG", "Belo Horizonte", "SBCF", "CNF", "MG0001", "-19.63571, -43.966928"),
(24, "SBCG", "medium_airport", "Campo Grande Airport", "1833", "SA", "BR", "BR-MS", "Campo Grande", "SBCG", "CGR", "MS0001", "-20.469998, -54.673988"),
(25, "SBCH", "medium_airport", "Serafin Enoss Bertaso Airport", "2154", "SA", "BR", "BR-SC", "Chapecó", "SBCH", "XAP", "SC0003", "-27.134199, -52.656601"),
(26, "SBCI", "medium_airport", "Brig. Lysias Augusto Rodrigues Airport", "565", "SA", "BR", "BR-MA", "Carolina", "SBCI", "CLN", "MA0003", "-7.32044, -47.458698"),
(27, "SBCJ", "medium_airport", "Carajás Airport", "2064", "SA", "BR", "BR-PA", "Parauapebas", "SBCJ", "CKS", "PA0006", "-6.117841, -50.003372"),
(28, "SBCM", "medium_airport", "Forquilhinha - Criciúma  Airport", "92", "SA", "BR", "BR-SC", "Criciúma", "SSIM", "CCM", "SC0009", "-28.725743, -49.424475"),
(29, "SBCO", "medium_airport", "Canoas Air Force Base", "26", "SA", "BR", "BR-RS", "Porto Alegre", "SBCO", "NULL", "RS9002", "-29.945928, -51.144413"),
(30, "SBCP", "medium_airport", "Bartolomeu Lisandro Airport", "57", "SA", "BR", "BR-RJ", "Campos Dos Goytacazes", "SBCP", "CAW", "RJ0006", "-21.698299, -41.301701"),
(31, "SBCR", "medium_airport", "Corumbá International Airport", "463", "SA", "BR", "BR-MS", "Corumbá", "SBCR", "CMG", "MS0009", "-19.01193, -57.672772"),
(32, "SBCT", "medium_airport", "Afonso Pena Airport", "2988", "SA", "BR", "BR-PR", "Curitiba", "SBCT", "CWB", "PR0001", "-25.5285, -49.1758"),
(33, "SBCV", "medium_airport", "Caravelas Airport", "36", "SA", "BR", "BR-BA", "Caravelas", "SSCV", "CRQ", "BA0012", "-17.6523, -39.253101"),
(34, "SBCX", "medium_airport", "Hugo Cantergiani Regional Airport", "2472", "SA", "BR", "BR-RS", "Caxias Do Sul", "SBCX", "CXJ", "RS0007", "-29.197183, -51.187647"),
(35, "SBCY", "medium_airport", "Marechal Rondon Airport", "617", "SA", "BR", "BR-MT", "Cuiabá", "SBCY", "CGB", "MT0001", "-15.6529, -56.116699"),
(36, "SBCZ", "medium_airport", "Cruzeiro do Sul Airport", "637", "SA", "BR", "BR-AC", "Cruzeiro Do Sul", "SBCZ", "CZS", "AC0002", "-7.59991, -72.769501"),
(37, "SBDN", "medium_airport", "Presidente Prudente Airport", "1477", "SA", "BR", "BR-SP", "Presidente Prudente", "SBDN", "PPB", "SP0005", "-22.1751, -51.424599"),
(38, "SBEG", "large_airport", "Eduardo Gomes International Airport", "264", "SA", "BR", "BR-AM", "Manaus", "SBEG", "MAO", "AM0001", "-3.03861, -60.049702"),
(39, "SBEK", "medium_airport", "Jacareacanga Airport", "295", "SA", "BR", "BR-PA", "Jacareacanga", "SBEK", "JCR", "PA0011", "-6.23316, -57.776901"),
(40, "SBFI", "medium_airport", "Cataratas International Airport", "786", "SA", "BR", "BR-PR", "Foz do Iguaçu", "SBFI", "IGU", "PR0002", "-25.594167, -54.489444"),
(41, "SBFL", "large_airport", "Hercílio Luz International Airport", "16", "SA", "BR", "BR-SC", "Florianópolis", "SBFL", "FLN", "SC0001", "-27.670277, -48.547203"),
(42, "SBFN", "medium_airport", "Francisco de Assis Airport", "14", "SA", "BR", "BR-MG", "Belo Horizonte", "SBFI", "PLU", "MG0003", "-19.8512, -43.9506"),
(43, "SBFZ", "large_airport", "Pinto Martins International Airport", "25", "SA", "BR", "BR-CE", "Fortaleza", "SBFZ", "FOR", "CE0001", "-3.7762799263000, -38.5326004028320"),
(44, "SBGL", "large_airport", "Rio Galeão – Tom Jobim International Airport", "28", "SA", "BR", "BR-RJ", "Rio De Janeiro", "SBGL", "GIG", "RJ0001", "-22.808899, -43.243698"),
(45, "SBGM", "medium_airport", "Guajará-Mirim Airport", "478", "SA", "BR", "BR-RO", "Guajará-Mirim", "SBGM", "GJM", "RO0006", "-10.78641, -65.28486"),
(46, "SBGO", "medium_airport", "Santa Genoveva Airport", "2450", "SA", "BR", "BR-GO", "Goiânia", "SBGO", "GYN", "GO0001", "-16.632, -49.220699"),
(47, "SBGR", "large_airport", "Guarulhos - Governador André Franco Montoro International Airport", "2461", "SA", "BR", "BR-SP", "São Paulo", "SBGR", "GRU", "SP0002", "-23.431944, -46.467778"),
(48, "SBGW", "medium_airport", "Guaratinguetá Airport", "1761", "SA", "BR", "BR-SP", "Guaratinguetá", "SBGW", "GUJ", "SP0076", "-22.791599, -45.2048"),
(49, "SBHT", "medium_airport", "Altamira Interstate Airport", "368", "SA", "BR", "BR-PA", "Altamira", "SBHT", "ATM", "PA0003", "-3.253144, -52.253938"),
(50, "SBIC", "medium_airport", "Itacoatiara Airport", "142", "SA", "BR", "BR-AM", "Itacoatiara", "SBIC", "ITA", "AM0012", "-3.126539, -58.481668"),
(51, "SBIH", "medium_airport", "Itaituba Airport", "110", "SA", "BR", "BR-PA", "Itaituba", "SBIH", "ITB", "PA0010", "-4.242131, -56.000651"),
(52, "SBIL", "medium_airport", "Bahia - Jorge Amado Airport", "15", "SA", "BR", "BR-BA", "Ilhéus", "SBIL", "IOS", "BA0004", "-14.815929, -39.033458"),
(53, "SBIP", "medium_airport", "Vale do Aço Regional Airport", "786", "SA", "BR", "BR-MG", "Ipatinga", "SBIP", "IPN", "MG0007", "-19.470699, -42.487598"),
(54, "SBIZ", "medium_airport", "Prefeito Renato Moreira Airport", "430", "SA", "BR", "BR-MA", "Imperatriz", "SBIZ", "IMP", "MA0002", "-5.53129, -47.459999"),
(55, "SBJF", "medium_airport", "Francisco de Assis Airport", "2989", "SA", "BR", "BR-MG", "Juiz de Fora", "SBJF", "JDF", "MG0016", "-21.791482, -43.386072"),
(56, "SBJH", "medium_airport", "São Paulo Catarina Executive Airport", "2547", "SA", "BR", "BR-SP", "São Roque", "SBJH", "JHF", "SP1176", "-23.426886, -47.165658"),
(57, "SBJP", "medium_airport", "Presidente Castro Pinto International Airport", "217", "SA", "BR", "BR-PB", "João Pessoa", "SBJP", "JPA", "PB0001", "-7.148691, -34.950554"),
(58, "SBJV", "medium_airport", "Lauro Carneiro de Loyola Airport", "15", "SA", "BR", "BR-SC", "Joinville", "SBJV", "JOI", "SC0004", "-26.224501, -48.797401"),
(59, "SBKG", "medium_airport", "Presidente João Suassuna Airport", "1646", "SA", "BR", "BR-PB", "Campina Grande", "SBKG", "CPV", "PB0003", "-7.269662, -35.896057"),
(60, "SBKP", "medium_airport", "Viracopos International Airport", "2170", "SA", "BR", "BR-SP", "Campinas", "SBKP", "VCP", "SP0003", "-23.007404, -47.134502"),
(61, "SBLJ", "medium_airport", "Lages Airport", "3065", "SA", "BR", "BR-SC", "Lages", "SBLJ", "LAJ", "SC0007", "-27.782101, -50.281502"),
(62, "SBLN", "medium_airport", "Lins Airport", "1559", "SA", "BR", "BR-SP", "Lins", "SWXQ", "LIP", "SWXQ", "-21.663999557495, -49.730499267578"),
(63, "SBLO", "medium_airport", "Governador José Richa Airport", "1867", "SA", "BR", "BR-PR", "Londrina", "SBLO", "LDB", "PR0003", "-23.333599, -51.1301"),
(64, "SBLP", "medium_airport", "Bom Jesus da Lapa Airport", "1454", "SA", "BR", "BR-BA", "Bom Jesus da Lapa", "SBLP", "LAZ", "BA0037", "-13.2621, -43.4081"),
(65, "SBMA", "medium_airport", "João Correa da Rocha Airport", "357", "SA", "BR", "BR-PA", "Marabá", "SBMA", "MAB", "PA0004", "-5.36859, -49.138"),
(66, "SBMC", "medium_airport", "Minaçu Airport", "1401", "SA", "BR", "BR-GO", "Minaçu", "SWIQ", "MQH", "SWIQ", "-13.5491, -48.195301"),
(67, "SBMD", "medium_airport", "Monte Dourado - Brigadeiro Protásio de Oliveira Airport", "42", "SA", "BR", "BR-PA", "Almeirim", "SBMD", "MEU", "PA0011", "-0.889839, -52.6022"),
(68, "SBME", "medium_airport", "Macaé Airport", "10", "SA", "BR", "BR-RJ", "Macaé", "SBME", "MEA", "RJ0012", "-22.343, -41.7668"),
(69, "SBMG", "medium_airport", "Mário Ribeiro Airport", "1225", "SA", "BR", "BR-MG", "Montes Claros", "SBMG", "MOC", "MG0021", "-16.706899642944, -43.818901062012"),
(70, "SBMK", "medium_airport", "Monte Carmelo Airport", "858", "SA", "BR", "BR-MG", "Monte Carmelo", "SBMK", "MQH", "MG0014", "-18.480999, -47.480999"),
(71, "SBML", "medium_airport", "Marília Airport", "637", "SA", "BR", "BR-SP", "Marília", "SBML", "MII", "SP0040", "-22.196899, -49.926399"),
(72, "SBMN", "medium_airport", "Montenegro Airport", "44", "SA", "BR", "BR-RS", "Montenegro", "SBMN", "RRS", "RS0003", "-29.6884, -52.743698"),
(73, "SBMO", "medium_airport", "Zumbi dos Palmares Airport", "387", "SA", "BR", "BR-AL", "Maceió", "SBMO", "MCZ", "AL0001", "-9.51081, -35.791901"),
(74, "SBMQ", "medium_airport", "Mário de Almeida Franco Airport", "568", "SA", "BR", "BR-MT", "Sinop", "SBMQ", "OPS", "MT0028", "-11.885, -55.586105"),
(75, "SBMS", "medium_airport", "Campo de Marte Airport", "2569", "SA", "BR", "BR-SP", "São Paulo", "SBMS", "QHP", "SP1175", "-23.5095, -46.637798"),
(76, "SBMT", "medium_airport", "Campo de Marte Airport", "2575", "SA", "BR", "BR-SP", "São Paulo", "SBMT", "QHP", "SP1175", "-23.5095005035, -46.6377983093"),
(77, "SBMY", "medium_airport", "Manicoré Airport", "251", "SA", "BR", "BR-AM", "Manicoré", "SBMY", "MNX", "AM0006", "-5.81137990952, -61.278301239"),
(78, "SBNF", "medium_airport", "Navegantes Airport", "17", "SA", "BR", "BR-SC", "Navegantes", "SBNF", "NVT", "SC0010", "-26.879999, -48.651402"),
(79, "SBNM", "medium_airport", "Campo Fontenelle Airport", "502", "SA", "BR", "BR-MT", "Nortelândia", "SBNM", "NQL", "MT0021", "-14.4217, -56.502201"),
(80, "SBNT", "medium_airport", "Augusto Severo Airport", "169", "SA", "BR", "BR-RN", "Natal", "SBNT", "NAT", "RN0001", "-5.911389, -35.247501"),
(81, "SBOI", "medium_airport", "Amaury Feitosa Tomaz Airport", "194", "SA", "BR", "BR-RO", "Ouro Preto do Oeste", "SBOI", "OPO", "RO0007", "-10.723888, -62.281666"),
(82, "SBOU", "medium_airport", "Bazileu Nazareno Airport", "468", "SA", "BR", "BR-PA", "Ourilândia do Norte", "SBOU", "OIA", "PA0012", "-6.7631, -51.05"),
(83, "SBPB", "medium_airport", "Paranaíba Airport", "433", "SA", "BR", "BR-MS", "Paranaíba", "SBPB", "PBB", "MS0024", "-19.673399, -51.1917"),
(84, "SBPC", "medium_airport", "Pocos de Caldas Airport", "4677", "SA", "BR", "BR-MG", "Poços de Caldas", "SBPC", "POO", "MG0017", "-21.843000411987, -46.567901611328"),
(85, "SBPF", "medium_airport", "Lauro Kurtz Airport", "693", "SA", "BR", "BR-RS", "Passo Fundo", "SBPF", "PFB", "RS0007", "-28.2439994812, -52.3265991211"),
(86, "SBPI", "medium_airport", "Pindamonhangaba Airport", "1794", "SA", "BR", "BR-SP", "Pindamonhangaba", "SBPI", "QHB", "SP1163", "-22.833099365234, -45.201900482178"),
(87, "SBPJ", "medium_airport", "Palmas Airport", "769", "SA", "BR", "BR-TO", "Palmas", "SBPJ", "PMW", "TO0001", "-10.2915000916, -48.3569984436"),
(88, "SBPK", "medium_airport", "Pelotas Airport", "16", "SA", "BR", "BR-RS", "Pelotas", "SBPK", "PET", "RS0005", "-31.718399, -52.327702"),
(89, "SBPL", "medium_airport", "Pampulha - Carlos Drummond de Andrade Airport", "2562", "SA", "BR", "BR-MG", "Belo Horizonte", "SBPL", "PLU", "MG0005", "-19.851200, -43.9506"),
(90, "SBPN", "medium_airport", "Base Aérea de Santa Cruz", "33", "SA", "BR", "BR-RJ", "Rio de Janeiro", "SBPN", "SNZ", "RJ0001", "-22.9324, -43.7191"),
(91, "SBPP", "medium_airport", "Presidente João Suassuna Airport", "483", "SA", "BR", "BR-PB", "Campina Grande", "SBPP", "CPV", "PB0004", "-7.26991, -35.8964"),
(92, "SBPV", "medium_airport", "Governador Jorge Teixeira de Oliveira Airport", "86", "SA", "BR", "BR-RO", "Porto Velho", "SBPV", "PVH", "RO0001", "-8.70928955078125, -63.90230178833008"),
(93, "SBQV", "medium_airport", "Governador André Franco Montoro International Airport", "750", "SA", "BR", "BR-SP", "São Paulo", "SBQV", "GRU", "SP1178", "-23.4302005768, -46.4696006775"),
(94, "SBRB", "medium_airport", "Presidente Médici Airport", "101", "SA", "BR", "BR-RO", "Rio Branco", "SBRB", "RBR", "AC0001", "-9.9575, -67.800903320312"),
(95, "SBRF", "medium_airport", "Recife Airport", "10", "SA", "BR", "BR-PE", "Recife", "SBRF", "REC", "PE0001", "-8.1264896392822266, -34.92359924316406"),
(96, "SBRG", "medium_airport", "Rio Grande Airport", "7", "SA", "BR", "BR-RS", "Rio Grande", "SBRG", "RIG", "RS0002", "-32.08259963989258, -52.16619873046875"),
(97, "SBRJ", "medium_airport", "Santos Dumont Airport", "3", "SA", "BR", "BR-RJ", "Rio de Janeiro", "SBRJ", "SDU", "RJ0003", "-22.910499572753906, -43.16310119628906"),
(98, "SBRP", "medium_airport", "Leite Lopes Airport", "546", "SA", "BR", "BR-SP", "Ribeirão Preto", "SBRP", "RAO", "SP0082", "-21.1345005035, -47.7742996216"),
(99, "SBRQ", "medium_airport", "Pres. Vargas Airport", "291", "SA", "BR", "BR-SP", "Ribeirão Preto", "SBRQ", "RAO", "SP0082", "-21.1355018616, -47.7767982483"),
(100, "SBRT", "medium_airport", "Roraima Airport", "88", "SA", "BR", "BR-RR", "Boa Vista", "SBRT", "BVB", "RR0001", "2.839, -60.692902"),
(101, "SBSM", "medium_airport", "Santa Maria Airport", "287", "SA", "BR", "BR-RS", "Santa Maria", "SBSM", "RIA", "RS0003", "-29.711399, -53.688202"),
(102, "SBSN", "medium_airport", "Santarém - Maestro Wilson Fonseca International Airport", "198", "SA", "BR", "BR-PA", "Santarém", "SBSN", "STM", "PA0002", "-2.422423, -54.79306"),
(103, "SBSP", "medium_airport", "Congonhas Airport", "2631", "SA", "BR", "BR-SP", "São Paulo", "SBSP", "CGH", "SP0001", "-23.627657, -46.654601"),
(104, "SBSR", "medium_airport", "Prof. Eribelto Manoel Reino State Airport", "1784", "SA", "BR", "BR-SP", "São José do Rio Preto", "SBSR", "SJP", "SP0006", "-20.817113, -49.406963"),
(105, "SBST", "medium_airport", "Santos Nero Moura Air Base / Guarujá Airport", "13", "SA", "BR", "BR-SP", "Guarujá", "SBST", "SSZ", "SP9006", "-23.928192, -46.300195"),
(106, "SBSV", "large_airport", "Deputado Luiz Eduardo Magalhães International Airport", "64", "SA", "BR", "BR-BA", "Salvador", "SBSV", "SSA", "BA0001", "-12.908611, -38.322498"),
(107, "SBTA", "medium_airport", "Base de Aviação de Taubaté", "1902", "SA", "BR", "BR-SP", "Taubaté", "SBTA", "NULL", "SP9004", "-23.0401, -45.51615"),
(108, "SBTB", "medium_airport", "Trombetas Airport", "167", "SA", "BR", "BR-PA", "Oriximiná", "SBTB", "TMT", "PA0012", "-1.4896, -56.396801"),
(109, "SBTE", "medium_airport", "Senador Petrônio Portela Airport", "219", "SA", "BR", "BR-PI", "Teresina", "SBTE", "THE", "PI0001", "-5.06025, -42.823712"),
(110, "SBTF", "medium_airport", "Tefé Airport", "186", "SA", "BR", "BR-AM", "Tefé", "SBTF", "TFF", "AM0004", "-3.38294, -64.724098"),
(111, "SBTK", "medium_airport", "Tarauacá Airport", "646", "SA", "BR", "BR-AC", "Tarauacá", "SBTK", "TRQ", "AC0004", "-8.155534, -70.782985"),
(112, "SBTL", "medium_airport", "Telêmaco Borba Airport", "2610", "SA", "BR", "BR-PR", "Telêmaco Borba", "SSVL", "TEC", "PR0007", "-24.317801, -50.6516"),
(113, "SBTS", "medium_airport", "Tiriós Airport", "1127", "SA", "BR", "BR-PA", "Aldeia Tiriós", "SBTS", "NULL", "PA9002", "2.224537, -55.944711"),
(114, "SBTT", "medium_airport", "Tabatinga Airport", "263", "SA", "BR", "BR-AM", "Tabatinga", "SBTT", "TBT", "AM0005", "-4.25567, -69.935799"),
(115, "SBTU", "medium_airport", "Tucuruí Airport", "830", "SA", "BR", "BR-PA", "Tucuruí", "SBTU", "TUR", "PA0007", "-3.78601, -49.720299"),
(116, "SBUA", "medium_airport", "São Gabriel da Cachoeira Airport", "249", "SA", "BR", "BR-AM", "São Gabriel da Cachoeira", "SBUA", "SJL", "AM0003", "-0.14835, -66.9855"),
(117, "SBUF", "medium_airport", "Paulo Afonso Airport", "883", "SA", "BR", "BR-BA", "Paulo Afonso", "SBUF", "PAV", "BA0007", "-9.40088, -38.250599"),
(118, "SBUG", "medium_airport", "Rubem Berta Airport", "256", "SA", "BR", "BR-RS", "Uruguaiana", "SBUG", "URG", "RS0012", "-29.7822, -57.0382"),
(119, "SBUL", "medium_airport", "Ten. Cel. Aviador César Bombonato Airport", "3094", "SA", "BR", "BR-MG", "Uberlândia", "SBUL", "UDI", "MG0002", "-18.883579, -48.225936"),
(120, "SBUR", "medium_airport", "Mário de Almeida Franco Airport", "2655", "SA", "BR", "BR-MG", "Uberaba", "SBUR", "UBA", "NULL", "-19.764722824097, -47.966110229492"),
(121, "SBVG", "medium_airport", "Major Brigadeiro Trompowsky Airport", "3025", "SA", "BR", "BR-MG", "Varginha", "SBVG", "VAG", "MG0019", "-21.591375, -45.474116"),
(122, "SBVH", "medium_airport", "Brigadeiro Camarão Airport", "2018", "SA", "BR", "BR-RO", "Vilhena", "SBVH", "BVH", "RO0003", "-12.6944, -60.098301"),
(123, "SBVT", "medium_airport", "Eurico de Aguiar Salles Airport", "34", "SA", "BR", "BR-ES", "Vitória", "SBVT", "VIX", "ES0001", "-20.258, -40.285"),
(124, "SBYS", "medium_airport", "Campo Fontenelle", "1968", "SA", "BR", "BR-SP", "Pirassununga", "SBYS", "QPS", "SP9002", "-21.984692, -47.341207"),
(125, "SBZM", "medium_airport", "Presidente Itamar Franco Airport", "1348", "SA", "BR", "BR-MG", "Juiz de Fora", "SBZM", "IZA", "NULL", "-21.513086, -43.173069"),
(126, "SJTC", "medium_airport", "Bauru/Arealva/Moussa Nakhal Tobias State Airport", "1962", "SA", "BR", "BR-SP", "Bauru", "SBAE", "JTC", "SP0010", "-22.160755, -49.070325"),
(127, "SN6L", "medium_airport", "Dr. Luciano de Arruda Coelho Regional Airport", "299", "SA", "BR", "BR-CE", "Sobral", "SN6L", "JSO", "CE0164", "-3.614488, -40.231426"),
(128, "SNCP", "medium_airport", "Planalto Serrano Regional Airport", "2887", "SA", "BR", "BR-SC", "Correia Pinto", "SNCP", "EEA", "NULL", "-27.634128, -50.358253"),
(129, "SNRS", "medium_airport", "Russas - João De Deus Regional Airport", "115", "SA", "BR", "BR-CE", "Russas", "NULL", "NULL", "SNRS", "-4.94727, -38.008202"),
(130, "SSZW", "medium_airport", "Ponta Grossa Airport - Comandante Antonio Amilton Beraldo", "2588", "SA", "BR", "BR-PR", "Ponta Grossa", "SBPG", "PGZ", "PR0012", "-25.184476, -50.143822"),
(131, "SWGN", "medium_airport", "Araguaína Airport", "771", "SA", "BR", "BR-TO", "Araguaína", "SWGN", "AUX", "TO0002", "-7.22787, -48.240501"),
(132, "SWRD", "medium_airport", "Maestro Marinho Franco Airport", "1467", "SA", "BR", "BR-MT", "Rondonópolis", "SBRD", "ROO", "MT0004", "-16.584292, -54.724803");''');
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
