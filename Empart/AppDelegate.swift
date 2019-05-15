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
        posizione["latitudine"] = 40.8661075
        posizione["longitudine"] = 14.2483877
        let museo1:Museo = Museo(nome: "Capodimonte", info: "", copertina: "capodimonteCopertina.jpg", toursDisponibili: [TourEmpart](), città: "Napoli", indirizzo: "Via Miano, 2", posizione: posizione)
        
        // test data: aggiungo tour caravaggio
        museo1.toursDisponibili.append(TourEmpart(titolo: "Caravaggio", descrizione: "", copertina: "tourCaravaggio.png", tappe: [Tappa](), dataInizio:"11/03/2019", dataFine:"20/09/2019"))
        
        // test data: aggiungo tappe del tour caravaggio
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Flagellazione", descrizione: "", imagine: "flag1.png", autore: Autore(nome: "Michelangelo", cognome: "Merisi", nomeDarte: "CARAVAGGIO", immagine: ""), anno: 1607, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(id: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5", major: 123, minor: 456), posizione: Dictionary<String,Double>(), copertina: "flag1th.png", imageToTrack: "laflag"))
        
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Flagellazione", descrizione: "", imagine: "flag2.png", autore: Autore(nome: "Michelangelo", cognome: "Merisi", nomeDarte: "CARAVAGGIO", immagine: ""), anno: 1607, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "flag2th.png", imageToTrack: "laflag2"))
        
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Salomè con la testa del Battista", descrizione: "", imagine: "sal1.png", autore: Autore(), anno: 1609, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "sal1th.png", imageToTrack: "salom"))
        
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Martirio di sant’Orsola", descrizione: "", imagine: "mart1.png", autore: Autore(), anno: 1610, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "mart1th.png", imageToTrack: "mart"))
        
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "San Giovanni Battista", descrizione: "", imagine: "gio1.png", autore: Autore(), anno: 1610, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,Double>(), copertina: "gio1th.png", imageToTrack: "sang"))
        
        
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
        
        musei.append(museo1)
        musei.append(museo2)
        musei.append(museo3)
        
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
        mioTour.data = "21 Aprile 2019"
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

