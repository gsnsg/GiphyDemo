//
//  GIFController.swift
//  Giphy
//
//  Created by Nikhi on 24/09/20.
//

import SwiftUI
import GiphyUISDK
import GiphyCoreSDK

struct GIFController: UIViewControllerRepresentable {

    @Binding var url: String
    @Binding var present: Bool
    
    class Coordinator: NSObject, GiphyDelegate {
        
        
        var parent: GIFController
        
        init(parent: GIFController) {
            self.parent = parent
        }
        
        func didSelectMedia(giphyViewController: GiphyViewController, media: GPHMedia) {
            parent.url = media.url(rendition: .fixedWidth, fileType: .gif)!
            parent.present = false
        }
        
        func didDismiss(controller: GiphyViewController?) {
            
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> some GiphyViewController {
        Giphy.configure(apiKey: "RmAvkXAXCtB4B4r0nCks25S0zjj2pO6U")
        let controller = GiphyViewController()
        controller.mediaTypeConfig = [.emoji, .gifs, .stickers]
        controller.delegate = context.coordinator
        controller.theme = .init(type: .darkBlur)
        GiphyViewController.trayHeightMultiplier = 1.05
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
    
    
}
