//
//  GameViewController.swift
//  Sizma
//
//  Created by 伊藤 誠 on 2017/06/13.
//  Copyright (c) 2017年 Anycreative, Inc. All rights reserved.
//

import SceneKit
import QuartzCore

class OperationViewController: NSViewController {
    
    @IBOutlet weak var operationView: OperationView!
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = NSColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        // retrieve the ship node
        let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!
        
        // animate the 3d object
        let animation = CABasicAnimation(keyPath: "rotation")
        animation.toValue = NSValue(scnVector4: SCNVector4(x: CGFloat(0), y: CGFloat(1), z: CGFloat(0), w: CGFloat(Double.pi)*2))
        animation.duration = 3
        animation.repeatCount = MAXFLOAT //repeat forever
        ship.addAnimation(animation, forKey: nil)
        
        // set the scene to the view
        self.operationView!.scene = scene
        
        // allows the user to manipulate the camera
        self.operationView!.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        self.operationView!.showsStatistics = true
        
        // configure the view
        self.operationView!.backgroundColor = NSColor.black
    }
    
}
