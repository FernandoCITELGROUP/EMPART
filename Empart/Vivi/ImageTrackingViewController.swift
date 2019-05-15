//
//  ImageTrackingViewController.swift
//  Empart
//
//  Created by fernando rosa on 15/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ImageTrackingViewController: UIViewController, ARSCNViewDelegate {
    
    // Variables and Constants
    let configuration = ARImageTrackingConfiguration()
    
    // Outlets
    @IBOutlet weak var sceneView: ARSCNView!
    
    
    @IBAction func chiudiAction(_ sender: Any) {
        DataManager.shared().trackedImage = ""
        self.dismiss(animated: true, completion: nil)
    }
    
    // Override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        sceneView.delegate = self
        guard let storedImages =  ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing AR Resources images")
        }
        configuration.trackingImages = storedImages
        sceneView.session.run(configuration)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //sceneView.autoenablesDefaultLighting = true
        if let configuration = sceneView.session.configuration {
            sceneView.session.run(configuration)
        } else {
            sceneView.session.run(configuration)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        sceneView.session.pause()
    }
    
    // Functions
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else { return }
        DataManager.shared().trackedImage = imageAnchor.name!
        self.dismiss(animated: true, completion: nil)
    }
    
}
