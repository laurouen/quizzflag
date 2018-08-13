//
//  ViewController.swift
//  quizFlag
//
//  Created by Laurent Mery on 09/08/2018.
//  Copyright © 2018 Laurent Mery. All rights reserved.
//

import UIKit



struct Datas {
    static let europe = ["no": ["no", "Norvège", "Oslo", "Europe"], "al": ["al", "Albanie", "Tirana", "Europe"], "gr": ["gr", "Grèce", "Athènes", "Europe"], "mc": ["mc", "Monaco", "Monaco", "Europe"], "ch": ["ch", "Suisse", "Berne", "Europe"], "va": ["va", "Vatican", "Vatican", "Europe"], "ua": ["ua", "Ukraine", "Kiev", "Europe"], "de": ["de", "Allemagne", "Berlin", "Europe"], "pl": ["pl", "Pologne", "Varsovie", "Europe"], "lt": ["lt", "Lituanie", "Vilnius", "Europe"], "ro": ["ro", "Roumanie", "Bucarest", "Europe"], "dk": ["dk", "Danemark", "Copenhague", "Europe"], "hu": ["hu", "Hongrie", "Budapest", "Europe"], "cy": ["cy", "Chypre", "Nicosie", "Europe"], "sm": ["sm", "Saint-Marin", "Saint-Marin", "Europe"], "xk": ["xk", "Kosovo", "Pristina", "Europe"], "be": ["be", "Belgique", "Bruxelles", "Europe"], "gb": ["gb", "Royaume-Uni", "Londres", "Europe"], "ru": ["ru", "Russie", "Moscou", "Europe"], "rs": ["rs", "Serbie", "Belgrade", "Europe"], "sk": ["sk", "Slovaquie", "Bratislava", "Europe"], "is": ["is", "Islande", "Reykjavik", "Europe"], "fi": ["fi", "Finlande", "Helsinki", "Europe"], "ad": ["ad", "Andorre", "Andorre-la-Vieille", "Europe"], "at": ["at", "Autriche", "Vienne", "Europe"], "mk": ["mk", "Macédoine", "Skopje", "Europe"], "li": ["li", "Liechtenstein", "Vaduz", "Europe"], "lu": ["lu", "Luxembourg", "Luxembourg", "Europe"], "es": ["es", "Espagne", "Madrid", "Europe"], "ee": ["ee", "Estonie", "Tallinn", "Europe"], "by": ["by", "Biélorussie", "Minsk", "Europe"], "ie": ["ie", "Irlande", "Dublin", "Europe"], "it": ["it", "Italie", "Rome", "Europe"], "mt": ["mt", "Malte", "La Valette", "Europe"], "pt": ["pt", "Portugal", "Lisbonne", "Europe"], "cz": ["cz", "République Tchèque", "Prague", "Europe"], "si": ["si", "Slovénie", "Ljubljana", "Europe"], "ba": ["ba", "Bosnie-Herzégovine", "Sarajevo", "Europe"], "nl": ["nl", "Pays-Bas", "Amsterdam", "Europe"], "hr": ["hr", "Croatie", "Zagreb", "Europe"], "bg": ["bg", "Bulgarie", "Sofia", "Europe"], "lv": ["lv", "Lettonie", "Riga", "Europe"], "me": ["me", "Monténégro", "Podgorica", "Europe"], "fr": ["fr", "France", "Paris", "Europe"], "md": ["md", "Moldavie", "Chisinau", "Europe"], "se": ["se", "Suède", "Stockholm", "Europe"]]
    static let amerique = ["ht": ["ht", "Haïti", "Port-au-Prince", "Amérique"], "pa": ["pa", "Panama", "Panama", "Amérique"], "gt": ["gt", "Guatemala", "Guatemala", "Amérique"], "us": ["us", "Etats-Unis", "Washington", "Amérique"], "py": ["py", "Paraguay", "Asunción", "Amérique"], "ca": ["ca", "Canada", "Ottawa", "Amérique"], "ag": ["ag", "Antigua-et-Barbuda", "Saint John\'s", "Amérique"], "gy": ["gy", "Guyana", "Georgetown", "Amérique"], "jm": ["jm", "Jamaïque", "Kingston", "Amérique"], "su": ["su", "Suriname", "Paramaribo", "Amérique"], "ve": ["ve", "Venezuela", "Caracas", "Amérique"], "lc": ["lc", "Sainte-Lucie", "Castries", "Amérique"], "br": ["br", "Brésil", "Brasilia", "Amérique"], "do": ["do", "République Dominicaine", "Saint-Domingue", "Amérique"], "bb": ["bb", "Barbade", "Bridgetown", "Amérique"], "co": ["co", "Colombie", "Bogota", "Amérique"], "bs": ["bs", "Bahamas", "Nassau", "Amérique"], "bo": ["bo", "Bolivie", "Sucre", "Amérique"], "cu": ["cu", "Cuba", "La Havane", "Amérique"], "dm": ["dm", "Dominique", "Roseau", "Amérique"], "sv": ["sv", "Salvador", "San Salvador", "Amérique"], "ec": ["ec", "Equateur", "Quito", "Amérique"], "uy": ["uy", "Uruguay", "Montevideo", "Amérique"], "vc": ["vc", "Saint-Vincent-et-les-Grenadines", "Kingstown", "Amérique"], "cl": ["cl", "Chili", "Santiago", "Amérique"], "tt": ["tt", "Trinité-et-Tobago", "Port of Spain", "Amérique"], "hn": ["hn", "Honduras", "Tegucigalpa", "Amérique"], "mx": ["mx", "Mexique", "Mexico", "Amérique"], "ni": ["ni", "Nicaragua", "Managua", "Amérique"], "kn": ["kn", "Saint-Kitts-et-Nevis", "Basseterre", "Amérique"], "cr": ["cr", "Costa Rica", "San José", "Amérique"], "ar": ["ar", "Argentine", "Buenos Aires", "Amérique"], "gd": ["gd", "Grenade", "Saint George\'s", "Amérique"], "pe": ["pe", "Pérou", "Lima", "Amérique"], "bz": ["bz", "Belize", "Belmopan", "Amérique"]]
    static let oceanie = ["tv": ["tv", "Tuvalu", "Fanafuti", "Océanie"], "pw": ["pw", "Palaos", "Melekeok", "Océanie"], "fj": ["fj", "Fidji", "Suva", "Océanie"], "sb": ["sb", "Salomon", "Honiara", "Océanie"], "vu": ["vu", "Vanuatu", "Port-Vila", "Océanie"], "fm": ["fm", "Micronésie", "Palikir", "Océanie"], "to": ["to", "Tonga", "Nukualofa", "Océanie"], "tl": ["tl", "Timor-Oriental", "Dili", "Océanie"], "pg": ["pg", "Papouasie-Nouvelle-Guinée", "Port Moresby", "Océanie"], "ws": ["ws", "Samoa", "Apia", "Océanie"], "nr": ["nr", "Nauru", "Yaren", "Océanie"], "au": ["au", "Australie", "Canberra", "Océanie"], "mh": ["mh", "Marshall", "Majuro", "Océanie"], "ki": ["ki", "Kiribati", "Tarawa", "Océanie"], "nz": ["nz", "Nouvelle-Zélande", "Wellington", "Océanie"]]
    static let asie = ["uz": ["uz", "Ouzbékistan", "Tachkent", "Asie"], "iq": ["iq", "Irak", "Bagdad", "Asie"], "mv": ["mv", "Maldives", "Malé", "Asie"], "sy": ["sy", "Syrie", "Damas", "Asie"], "tj": ["tj", "Tadjikistan", "Douchanbe", "Asie"], "ps": ["ps", "Palestine", "Jérusalem-Est", "Asie"], "ph": ["ph", "Philippines", "Manille", "Asie"], "qa": ["qa", "Qatar", "Doha", "Asie"], "bd": ["bd", "Bangladesh", "Dacca", "Asie"], "my": ["my", "Malaisie", "Kuala Lumpur", "Asie"], "ir": ["ir", "Iran", "Téhéran", "Asie"], "am": ["am", "Arménie", "Erevan", "Asie"], "af": ["af", "Afghanistan", "Kaboul", "Asie"], "tl": ["tl", "Timor oriental", "Dili", "Asie"], "bn": ["bn", "Brunei", "Bandar Seri Begawan", "Asie"], "il": ["il", "Israël", "Jérusalem", "Asie"], "id": ["id", "Indonésie", "Jakarta", "Asie"], "la": ["la", "Laos", "Vientiane", "Asie"], "lb": ["lb", "Liban", "Beyrouth", "Asie"], "mn": ["mn", "Mongolie", "Oulan-Bator", "Asie"], "kg": ["kg", "Kirghizistan", "Bichkek", "Asie"], "ae": ["ae", "Emirats Arabes Unis", "Abu Dhabi", "Asie"], "sa": ["sa", "Arabie Saoudite", "Riyad", "Asie"], "tw": ["tw", "Taïwan", "Taipei", "Asie"], "th": ["th", "Thaïlande", "Bangkok", "Asie"], "bt": ["bt", "Bhoutan", "Thimbu", "Asie"], "kr": ["kr", "Corée du Sud", "Séoul", "Asie"], "ye": ["ye", "Yémen", "Sanaa", "Asie"], "jp": ["jp", "Japon", "Tokyo", "Asie"], "kp": ["kp", "Corée du Nord", "Pyongyang", "Asie"], "bh": ["bh", "Bahreïn", "Manama", "Asie"], "kz": ["kz", "Kazakhstan", "Astana", "Asie"], "om": ["om", "Oman", "Mascate", "Asie"], "kh": ["kh", "Cambodge", "Phnom Penh", "Asie"], "mm": ["mm", "Birmanie", "Naypyidaw", "Asie"], "cn": ["cn", "Chine", "Pékin", "Asie"], "in": ["in", "Inde", "New Delhi", "Asie"], "pk": ["pk", "Pakistan", "Islamabad", "Asie"], "sg": ["sg", "Singapour", "Singapour", "Asie"], "lk": ["lk", "Sri Lanka", "Sri Jayawardenapura", "Asie"], "tr": ["tr", "Turquie", "Ankara", "Asie"], "az": ["az", "Azerbaïdjan", "Bakou", "Asie"], "vn": ["vn", "Viêt Nam", "Hanoi", "Asie"], "jo": ["jo", "Jordanie", "Amman", "Asie"], "np": ["np", "Népal", "Katmandou", "Asie"], "tm": ["tm", "Turkménistan", "Achgabat", "Asie"], "ge": ["ge", "Géorgie", "Tbilissi", "Asie"], "kw": ["kw", "Koweït", "Koweït", "Asie"]]
    static let afrique = ["er": ["er", "Erythrée", "Asmara", "Afrique"], "ma": ["ma", "Maroc", "Rabat", "Afrique"], "mg": ["mg", "Madagascar", "Antananarivo", "Afrique"], "td": ["td", "Tchad", "N\'Djamena", "Afrique"], "na": ["na", "Namibie", "Windhoek", "Afrique"], "mz": ["mz", "Mozambique", "Maputo", "Afrique"], "st": ["st", "São Tomé et Príncipe", "São Tomé", "Afrique"], "sz": ["sz", "Swaziland", "Mbabane", "Afrique"], "ug": ["ug", "Ouganda", "Kampala", "Afrique"], "ao": ["ao", "Angola", "Luanda", "Afrique"], "cd": ["cd", "République Démocratique du Congo", "Kinshasa", "Afrique"], "tz": ["tz", "Tanzanie", "Dodoma", "Afrique"], "ml": ["ml", "Mali", "Bamako", "Afrique"], "za": ["za", "Afrique du Sud", "Pretoria", "Afrique"], "so": ["so", "Somalie", "Mogadiscio", "Afrique"], "lr": ["lr", "Liberia", "Monrovia", "Afrique"], "mw": ["mw", "Malawi", "Lilongwe", "Afrique"], "zm": ["zm", "Zambie", "Lusaka", "Afrique"], "ls": ["ls", "Lesotho", "Maseru", "Afrique"], "tg": ["tg", "Togo", "Lomé", "Afrique"], "al": ["al", "algerie", "alger", "afrique"], "gw": ["gw", "Guinée-Bissau", "Bissau", "Afrique"], "ly": ["ly", "Libye", "Tripoli", "Afrique"], "ne": ["ne", "Niger", "Niamey", "Afrique"], "cm": ["cm", "Cameroun", "Yaoundé", "Afrique"], "bf": ["bf", "Burkina Faso", "Ouagadougou", "Afrique"], "gm": ["gm", "Gambie", "Banjul", "Afrique"], "mu": ["mu", "Île Maurice", "Port Louis", "Afrique"], "eh": ["eh", "Sahara occidental", "Laâyoune, Tifariti", "Afrique"], "ss": ["ss", "Soudan du Sud", "Djouba", "Afrique"], "ng": ["ng", "Nigeria", "Abuja", "Afrique"], "et": ["et", "Ethiopie", "Addis-Abeba", "Afrique"], "mr": ["mr", "Mauritanie", "Nouakchott", "Afrique"], "ga": ["ga", "Gabon", "Libreville", "Afrique"], "bw": ["bw", "Botswana", "Gaborone", "Afrique"], "eg": ["eg", "Egypte", "Le Caire", "Afrique"], "sn": ["sn", "Sénégal", "Dakar", "Afrique"], "zw": ["zw", "Zimbabwe", "Harare", "Afrique"], "cv": ["cv", "Cap-Vert", "Praia", "Afrique"], "cf": ["cf", "République Centrafricaine", "Bangui", "Afrique"], "sl": ["sl", "Sierra Leone", "Freetown", "Afrique"], "cg": ["cg", "République du Congo", "Brazzaville", "Afrique"], "bi": ["bi", "Burundi", "Bujumbura", "Afrique"], "ke": ["ke", "Kenya", "Nairobi", "Afrique"], "bj": ["bj", "Bénin", "Porto-Novo", "Afrique"], "dz": ["dz", "Algérie", "Alger", "Afrique"], "ci": ["ci", "Côte d\'Ivoire", "Yamoussoukro", "Afrique"], "rw": ["rw", "Rwanda", "Kigali", "Afrique"], "km": ["km", "Comores", "Moroni", "Afrique"], "tn": ["tn", "Tunisie", "Tunis", "Afrique"], "sd": ["sd", "Soudan", "Khartoum", "Afrique"], "gh": ["gh", "Ghana", "Accra", "Afrique"], "sc": ["sc", "Seychelles", "Victoria", "Afrique"], "dj": ["dj", "Djibouti", "Djibouti", "Afrique"], "gn": ["gn", "Guinée", "Conakry", "Afrique"], "gq": ["gq", "Guinée équatoriale", "Malabo", "Afrique"]]
    static var monde = ["fr": ["fr", "France", "paris", "Europe"]]
}

struct Buttons {
    static let choixTitre = ["Amérique", "Europe", "Afrique", "Asie", "Océanie", "Monde"]
    static let continents = [Datas.amerique, Datas.europe, Datas.afrique, Datas.asie, Datas.oceanie, Datas.monde]
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var button0Amerique: MyButton!
    @IBOutlet weak var button5Monde: MyButton!
    @IBOutlet weak var Button3Asie: MyButton!
    @IBOutlet weak var button1Europe: MyButton!
    @IBOutlet weak var button2Afrique: MyButton!
    @IBOutlet weak var button4Oceanie: MyButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Datas.monde.merge(Datas.europe, uniquingKeysWith: { (old, new) in new })
        Datas.monde.merge(Datas.afrique, uniquingKeysWith: { (old, new) in new })
        Datas.monde.merge(Datas.oceanie, uniquingKeysWith: { (old, new) in new })
        Datas.monde.merge(Datas.amerique, uniquingKeysWith: { (old, new) in new })
        Datas.monde.merge(Datas.asie, uniquingKeysWith: { (old, new) in new })
        
    
        button0Amerique.setTitle("Amerique (\(Datas.amerique.count))", for: .normal)
        button2Afrique.setTitle("Afrique (\(Datas.afrique.count))", for: .normal)
        button1Europe.setTitle("Europe (\(Datas.europe.count))", for: .normal)
        Button3Asie.setTitle("Asie (\(Datas.asie.count))", for: .normal)
        button4Oceanie.setTitle("Océanie (\(Datas.oceanie.count))", for: .normal)
        button5Monde.setTitle("Monde (\(Datas.monde.count))", for: .normal)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "goQuizz") {
            
            if let vc = segue.destination as? QuizzViewController {
                
                guard let tag = (sender as? MyButton)?.tag else { return }
                vc.titleQuizz = Buttons.choixTitre[tag]
                vc.datasContinent = Buttons.continents[tag]
                
                let backItem = UIBarButtonItem()
                backItem.title = "Abandonner"
                navigationItem.backBarButtonItem = backItem
            }
        }
    }

    @IBAction func handleButton(_ sender: MyButton) {
        performSegue(withIdentifier: "goQuizz", sender: sender)
    }
}


