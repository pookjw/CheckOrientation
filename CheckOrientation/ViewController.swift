//
//  ViewController.swift
//  CheckOrientation
//
//  Created by Jinwoo Kim on 10/5/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        updateLabel()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        updateLabel()
//    }
//
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateLabel()
    }
    
    private func updateLabel() {
        statusLabel.text = getStatusText()
    }
    
    private func getStatusText() -> String {
        switch UIDevice.current.orientation {
        case .unknown:
            guard let orientation = UIApplication.shared.windows.first?.windowScene?.interfaceOrientation else {
                return "unknown"
            }
            switch orientation {
            case .portrait:
                return "portrait"
            case .portraitUpsideDown:
                return "portraitUpsideDown"
            case .landscapeLeft:
                return "landscapeRight"
            case .landscapeRight:
                return "landscapeLeft"
            case .unknown:
                return "unknown"
            @unknown default:
                return "unknown"
            }
        case .portrait:
            return "portrait"
        case .portraitUpsideDown:
            return "portraitUpsideDown"
        case .landscapeLeft:
            return "landscapeLeft"
        case .landscapeRight:
            return "landscapeRight"
        case .faceUp:
            return "faceUp"
        case .faceDown:
            return "faceDown"
        @unknown default:
            return "unknown"
        }
    }
}

