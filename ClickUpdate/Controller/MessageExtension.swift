//
//  MessageExtension.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 10/02/21.
//

import UIKit
import MessageUI

extension MainViewController: MFMessageComposeViewControllerDelegate {
    
    func sentSMS(_ phoneNumber: String){
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "Esta é uma mensagem!"
            controller.recipients = [phoneNumber]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
            case .cancelled:
                print("Message was cancelled")
                dismiss(animated: true, completion: nil)
            case .failed:
                print("Message failed")
                dismiss(animated: true, completion: nil)
            case .sent:
                print("Message was sent")
                dismiss(animated: true, completion: nil)
            default:
                break
            }
    }
    
    
}
