//
//  AppDelegate.swift
//  Empart
//
//  Created by fernando rosa on 06/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.createTestData()
        return true
    }
    
    //Functions
    func createTestData()
    {
        var musei:[Museo] = [Museo]()
        
        // test data: Oggetti Museo da aggiungere alla collection di test
        var posizione:Dictionary<String,Double> = Dictionary<String,Double>()
        posizione["latitudine"] = 40.867011
        posizione["longitudine"] = 14.250205
        let museo1:Museo = Museo(nome: "Capodimonte", info: "", copertina: "capodimonteCopertina.jpg", toursDisponibili: [TourEmpart](), città: "Napoli", indirizzo: "Via Miano, 2", posizione: posizione)
        
        // test data: aggiungo tour caravaggio
        museo1.toursDisponibili.append(TourEmpart(titolo: "Caravaggio", descrizione: "", copertina: "tourCaravaggio.png", tappe: [Tappa](), dataInizio:"11/03/2019", dataFine:"20/09/2019"))
        
        // test data: aggiungo tappe del tour caravaggio
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Flagellazione", descrizione: "La Flagellazione di Cristo è un dipinto a olio su tela (286x213 cm) di Caravaggio, realizzato tra il 1607 ed il 1608 e conservato nella sala 78 del Museo nazionale di Capodimonte di Napoli. Secondo il resoconto di Giovanni Pietro Bellori, questo dipinto fu commissionato per adornare la cappella della famiglia de Franchis nella Chiesa di San Domenico Maggiore a Napoli. La Flagellazione di Cristo è la tela di formato più grande e più monumentale delle cinque o sei opere eseguite dal pittore alla fine del suo soggiorno napoletano.", imagine: "flag1.png", autore: Autore(nome: "Michelangelo", cognome: "Merisi", nomeDarte: "CARAVAGGIO", immagine: ""), anno: 1607, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(id: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5", major: 123, minor: 456), posizione: Dictionary<String,Double>(), copertina: "flag1th.png", imageToTrack: "laflag"))
        
        museo1.toursDisponibili[0].tappe[0].contenutoInedito.append("flag1Plus1.jpeg")
        museo1.toursDisponibili[0].tappe[0].contenutoInedito.append("flag1Plus2.jpeg")
        museo1.toursDisponibili[0].tappe[0].contenutoInedito.append("flag1Plus3.jpeg")
        museo1.toursDisponibili[0].tappe[0].contenutoInedito.append("flag1Plus4.jpeg")
        museo1.toursDisponibili[0].tappe[0].contenutoInedito.append("flag1Plus5.jpeg")
        museo1.toursDisponibili[0].tappe[0].contenutoInedito.append("flag1Plus6.jpeg")
        museo1.toursDisponibili[0].tappe[0].contenutoInedito.append("flag1Plus7.jpeg")
        
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Flagellazione", descrizione: "", imagine: "flag2.png", autore: Autore(nome: "Michelangelo", cognome: "Merisi", nomeDarte: "CARAVAGGIO", immagine: "La Flagellazione di Cristo è un dipinto a olio su tela di 134,5x175,5 cm, realizzato tra il 1606 e il 1607 dal pittore italiano Caravaggio. È conservato nel Musée des Beaux-Arts a Rouen."), anno: 1607, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "flag2th.png", imageToTrack: "laflag2"))
        
        museo1.toursDisponibili[0].tappe[1].contenutoInedito.append("flag2Plus1.jpeg")
        museo1.toursDisponibili[0].tappe[1].contenutoInedito.append("flag2Plus2.jpeg")
        museo1.toursDisponibili[0].tappe[1].contenutoInedito.append("flag2Plus3.jpeg")
        museo1.toursDisponibili[0].tappe[1].contenutoInedito.append("flag2Plus4.jpeg")
        museo1.toursDisponibili[0].tappe[1].contenutoInedito.append("flag2Plus5.jpeg")
        museo1.toursDisponibili[0].tappe[1].contenutoInedito.append("flag2Plus6.jpeg")
        
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Salomè con la testa del Battista", descrizione: "Salomè con la testa del Battista è un dipinto di Caravaggio realizzato in olio su tela (91x106 cm) tra il 1607 e il 1610. È conservato nella National Gallery di Londra.", imagine: "sal1.png", autore: Autore(), anno: 1609, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "sal1th.png", imageToTrack: "salom"))
        
        museo1.toursDisponibili[0].tappe[2].contenutoInedito.append("salomePlus1.jpeg")
        museo1.toursDisponibili[0].tappe[2].contenutoInedito.append("salomePlus2.jpeg")
        museo1.toursDisponibili[0].tappe[2].contenutoInedito.append("salomePlus3.jpeg")
        museo1.toursDisponibili[0].tappe[2].contenutoInedito.append("salomePlus4.jpeg")
        museo1.toursDisponibili[0].tappe[2].contenutoInedito.append("salomePlus5.jpeg")
        museo1.toursDisponibili[0].tappe[2].contenutoInedito.append("salomePlus6.jpeg")
        museo1.toursDisponibili[0].tappe[2].contenutoInedito.append("salomePlus7.jpeg")
        museo1.toursDisponibili[0].tappe[2].contenutoInedito.append("salomePlus8.jpeg")
        museo1.toursDisponibili[0].tappe[2].contenutoInedito.append("salomePlus9.jpeg")
        
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Martirio di sant’Orsola", descrizione: "Il Martirio di sant'Orsola è un dipinto a olio su tela (140,5 × 170,5 cm) eseguito nel 1610 da Caravaggio e conservato presso la galleria di palazzo Zevallos a Napoli. L'opera è di fatto l'ultima fatica del Merisi[1], essendo stata realizzata poco prima della sua morte.", imagine: "mart1.png", autore: Autore(), anno: 1610, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "mart1th.png", imageToTrack: "mart"))
        
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("martirioPlus1.jpeg")
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("martirioPlus2.jpeg")
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("martirioPlus3.jpeg")
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("martirioPlus4.jpeg")
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("martirioPlus5.jpeg")
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("martirioPlus6.jpeg")
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("martirioPlus7.jpeg")
        
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "San Giovanni Battista", descrizione: "San Giovanni Battista (talvolta chiamato San Giovanni nel deserto) era un soggetto molto frequente nella pittura di Michelangelo Merisi da Caravaggio (1571–1610), il quale realizzò almeno otto dipinti con questo tema.", imagine: "gio1.png", autore: Autore(), anno: 1610, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "gio1th.png", imageToTrack: "sang"))
        
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("sangiovPlus1.jpeg")
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("sangiovPlus2.jpeg")
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("sangiovPlus3.jpeg")
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("sangiovPlus4.jpeg")
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("sangiovPlus5.jpeg")
        museo1.toursDisponibili[0].tappe[3].contenutoInedito.append("sangiovPlus6.jpeg")
        
        // test data: aggiungo tour oro rosso
        museo1.toursDisponibili.append(TourEmpart(titolo: "Oro rosso", descrizione: "", copertina: "tourOroRosso.jpg", tappe: [Tappa](), dataInizio:"06/05/2019", dataFine:"20/12/2019"))
        
        
        var posizione2:Dictionary<String,Double> = Dictionary<String,Double>()
        posizione2["latitudine"] = 40.8552773
        posizione2["longitudine"] = 14.2450081
        let museo2:Museo = Museo(nome: "Museo archeologico", info: "", copertina: "museoArcheologicoCopertina.jpg", toursDisponibili: [TourEmpart](), città: "Napoli", indirizzo: "Piazza Museo, 19", posizione: posizione2)
        
        
        var posizione3:Dictionary<String,Double> = Dictionary<String,Double>()
        posizione3["latitudine"] = 40.8365353
        posizione3["longitudine"] = 14.2482524
        let museo3:Museo = Museo(nome: "Palazzo reale", info: "", copertina: "palazzoRealeCopertina.jpg", toursDisponibili: [TourEmpart](), città: "Napoli", indirizzo: "Piazza del Plebiscito, 1", posizione: posizione3)
        
        
        var posizione4:Dictionary<String,Double> = Dictionary<String,Double>()
        posizione4["latitudine"] = 40.8229316
        posizione4["longitudine"] = 14.1175454
        let museo4:Museo = Museo(nome: "Comune di Pozzuoli", info: "", copertina: "pozzuoli.jpg", toursDisponibili: [TourEmpart](), città: "Pozzuoli", indirizzo: "Comune", posizione: posizione4)
        museo4.toursDisponibili.append(TourEmpart(titolo: "I love Pozzuoli", descrizione: "", copertina: "tourPozzuoli.jpg", tappe: [Tappa](), dataInizio:"01/01/2019", dataFine:"31/12/2019"))
        
        museo4.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Anfiteatro Flavio", descrizione: "L'Anfiteatro Flavio è uno dei due anfiteatri romani esistenti a Pozzuoli e risale alla seconda metà del I secolo d.C. Venne realizzato per far fronte all'incremento demografico di Puteoli, che aveva reso inadatto il vecchio edificio adibito per spettacoli pubblici in età repubblicana", imagine: "anfiteatroFlavio.jpg", autore: Autore(), anno: 305, tecnica: ""), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Posizione, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "anfiteatroFlavioth.png", imageToTrack: ""))
        
        museo4.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Tempio di Serapide", descrizione: "Il Macellum di Pozzuoli è un sito archeologico situato nel comune omonimo della città metropolitana di Napoli. Per il duplice interesse che esso ha, archeologico e scientifico, è uno dei più noti monumenti di tutto il mondo antico", imagine: "serapide.jpg", autore: Autore(), anno: 305, tecnica: ""), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Posizione, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "serapideth.png", imageToTrack: ""))
        
        museo4.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Le grotte della Sibilla", descrizione: "L'Antro della Sibilla è una galleria artificiale di epoca greco-romana, rinvenuta a seguito degli scavi archeologici dell'antica città di Cuma: viene identificato come il luogo all'interno del quale la Sibilla Cumana operava e divulgava i suoi oracoli.", imagine: "sibilla.jpg", autore: Autore(), anno: 305, tecnica: ""), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Posizione, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "sibillath.png", imageToTrack: ""))
       
        museo4.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Rione Terra", descrizione: "Il Rione Terra è un agglomerato urbano che costituisce il primo nucleo abitativo di Pozzuoli, nella città metropolitana di Napoli, abitato fin dal II secolo a.C. Si trova su una piccola altura che permetteva di controllare bene gli arrivi dei nemici provenienti sia dal mare sia dalla terra.", imagine: "rioneterra.jpg", autore: Autore(), anno: 305, tecnica: ""), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Posizione, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "rioneterrath.png", imageToTrack: ""))
        
        museo4.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Accademia Aeronautica", descrizione: "L'Accademia Aeronautica è un istituto militare per la formazione degli ufficiali dell'Aeronautica Militare. La sede è posta nel comune di Pozzuoli al confine con il comune di Napoli", imagine: "accademia.jpg", autore: Autore(), anno: 305, tecnica: ""), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Posizione, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "accademiath.png", imageToTrack: ""))
        
      
        
        musei.append(museo1)
        musei.append(museo2)
        musei.append(museo3)
        musei.append(museo4)
        
        DataManager.shared().musei = musei
        
        let gioia:Emozione = Emozione(nome: "Gioia", descrizione: "", coloreR: 244.0, coloreG: 188.0, coloreB: 71.0, immagineIcona: "")
        let tristezza:Emozione = Emozione(nome: "Tristezza", descrizione: "", coloreR: 0.0, coloreG: 7.0, coloreB: 254.0, immagineIcona: "")
        let rabbia:Emozione = Emozione(nome: "Rabbia", descrizione: "", coloreR: 166.0, coloreG: 7.0, coloreB: 11.0, immagineIcona: "")
        let paura:Emozione = Emozione(nome: "Paura", descrizione: "", coloreR: 111.0, coloreG: 9.0, coloreB: 135.0, immagineIcona: "")
        let disgusto:Emozione = Emozione(nome: "Disgusto", descrizione: "", coloreR: 2.0, coloreG: 153.0, coloreB: 11.0, immagineIcona: "")
        
        var emozioni:[Emozione] = [Emozione]()
        emozioni.append(gioia)
        emozioni.append(tristezza)
        emozioni.append(rabbia)
        emozioni.append(paura)
        emozioni.append(disgusto)
        
        DataManager.shared().emozioni = emozioni
        
        
        let mioTour: MioTour = MioTour()
        mioTour.data = "13 Maggio 2019"
        mioTour.nomeMuseo = "Capodimonte"
        mioTour.citta = "Napoli"
        mioTour.titolo = "Tour Caravaggio"
        mioTour.copertina = "tourCaravaggio"
        
        mioTour.tappe.append(Tappa(opera: Opera(titolo: "Flagellazione", descrizione: "", imagine: "flag1.png", autore: Autore(nome: "Michelangelo", cognome: "Merisi", nomeDarte: "CARAVAGGIO", immagine: ""), anno: 1607, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(id: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5", major: 123, minor: 456), posizione: Dictionary<String,Double>(), copertina: "flag1th.png", imageToTrack: ""))
        mioTour.tappe.append(Tappa(opera: Opera(titolo: "Salomè con la testa del Battista", descrizione: "", imagine: "sal1.png", autore: Autore(), anno: 1609, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "sal1th.png", imageToTrack: ""))
        mioTour.tappe.append(Tappa(opera: Opera(titolo: "Martirio di sant’Orsola", descrizione: "", imagine: "mart1.png", autore: Autore(), anno: 1610, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "mart1th.png", imageToTrack: ""))
        mioTour.tappe.append(Tappa(opera: Opera(titolo: "San Giovanni Battista", descrizione: "", imagine: "gio1.png", autore: Autore(), anno: 1610, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "gio1th.png", imageToTrack: ""))
       
        
        mioTour.tappeVissute.append(MiaTappa(tappa: Tappa(opera: Opera(titolo: "Flagellazione", descrizione: "", imagine: "flag1.png", autore: Autore(nome: "Michelangelo", cognome: "Merisi", nomeDarte: "CARAVAGGIO", immagine: ""), anno: 1607, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(id: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5", major: 123, minor: 456), posizione: Dictionary<String,Double>(), copertina: "flag1th.png", imageToTrack: ""), ricordo: RicordoEmpart(esperienza: EsperienzaEmpart(), urlVideoGenerato: self.copyFileToDocumentsFolder(nameForFile: "video", extForFile: "mov"))))
        
       
        mioTour.tappeVissute.append(MiaTappa(tappa: Tappa(opera: Opera(titolo: "Salomè con la testa del Battista", descrizione: "", imagine: "sal1.png", autore: Autore(), anno: 1609, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "sal1th.png", imageToTrack: ""), ricordo: RicordoEmpart()))
        mioTour.tappeVissute.append(MiaTappa(tappa: Tappa(opera: Opera(titolo: "Martirio di sant’Orsola", descrizione: "", imagine: "mart1.png", autore: Autore(), anno: 1610, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "mart1th.png", imageToTrack: ""), ricordo: RicordoEmpart()))
        mioTour.tappeVissute.append(MiaTappa(tappa: Tappa(opera: Opera(titolo: "San Giovanni Battista", descrizione: "", imagine: "gio1.png", autore: Autore(), anno: 1610, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "gio1th.png", imageToTrack: ""), ricordo: RicordoEmpart()))
        
        DataManager.shared().mieiTour.append(mioTour)
        
    }
    
    func copyFileToDocumentsFolder(nameForFile: String, extForFile: String) -> URL{
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destURL = documentsURL!.appendingPathComponent(nameForFile).appendingPathExtension(extForFile)
        guard let sourceURL = Bundle.main.url(forResource: nameForFile, withExtension: extForFile)
            else {
                print("Source File not found.")
                return URL(fileURLWithPath: "")
        }
        let fileManager = FileManager.default
        do {
            print(destURL)
            try fileManager.copyItem(at: sourceURL, to: destURL)
        } catch {
            print("Unable to copy file")
            return destURL
        }
        return destURL
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

