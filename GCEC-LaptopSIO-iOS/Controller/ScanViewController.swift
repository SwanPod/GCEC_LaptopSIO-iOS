//
//  ScanViewController.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 4/11/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import UIKit
import AVFoundation

class ScanViewController: UIViewController {

    @IBOutlet weak var cameraViewport: UIView!
    
    let showAddSegueIdentifier = "segueShowAdd"
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var input: AVCaptureDeviceInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
//
//        do {
//            input = try AVCaptureDeviceInput(device: captureDevice!)
//        } catch {
//            print(error)
//        }
//
//        captureSession = AVCaptureSession()
//        captureSession?.addInput(input!)
//
//        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
//        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
//        videoPreviewLayer?.bounds = view.layer.bounds
//        cameraViewport.layer.addSublayer(videoPreviewLayer!)
//
//        captureSession?.startRunning()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let isEdit = false
        performSegue(withIdentifier: showAddSegueIdentifier, sender: isEdit)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AddDeviceViewController {
            if let isEditBool = sender as? Bool {
                destination.screenTypeEdit = isEditBool
            }
        }
    }

}
