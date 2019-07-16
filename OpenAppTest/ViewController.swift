//
//  ViewController.swift
//  OpenAppTest
//
//  Created by Mrlu on 2019/7/16.
//  Copyright © 2019 mrlu. All rights reserved.
//

import Cocoa
//import LogSend
class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func openHandle(_ sender: Any) {
//        guard let app = Bundle.main.bundlePath else { return }
//        let app = "/Users/mrlu/Library/Developer/Xcode/DerivedData/OpenAppTest-cysteolaqiicgzabgwmsjuclqkfu/Build/Products/Debug/InApp.app"
        let app = Bundle.main.bundlePath.appending("/Contents/Develops/InApp.app")
//        runScript(path: app, arguments: [])
//        NSWorkspace.shared.openFile(app)
//        NSWorkspace.shared.launchApplication("OpenAppTest.app")
//        NSWorkspace.shared.launchApplication(at: <#T##URL#>, options: <#T##NSWorkspace.LaunchOptions#>, configuration: <#T##[NSWorkspace.LaunchConfigurationKey : Any]#>)
        let event = NSAppleEventDescriptor(eventClass: AEEventClass(kInternetEventClass), eventID: AEEventID(kAEGetURL), targetDescriptor: nil, returnID: AEReturnID(kAutoGenerateReturnID), transactionID: AETransactionID(kAnyTransactionID))
        event.setParam(NSAppleEventDescriptor(string: "111"), forKeyword: AEKeyword(keyDirectObject))
        let application = try? NSWorkspace.shared.launchApplication(at: URL(fileURLWithPath: app), options: NSWorkspace.LaunchOptions.default, configuration: [NSWorkspace.LaunchConfigurationKey.appleEvent:NSAppleEventDescriptor.currentProcess()])
        debugPrint("\(application)")
    }
    
    public func runScript(path:String, arguments:[String]?) {
//        if #available(OSX 10.13, *) {
//            let process = Process()
//            process.executableURL = URL(fileURLWithPath: path)
//            process.arguments = arguments
//            let pip = Pipe()
//            process.standardOutput = pip
//            let fileHandle = pip.fileHandleForReading
//            do {
//                try process.run()
//            } catch let error {
//                debugPrint("Error:\(error)")
//                return nil
//            }
//            let data = fileHandle.readDataToEndOfFile()
//            return String(data: data, encoding: String.Encoding.utf8) ?? ""
//        }
        let task = Process()
        task.launchPath = path
//        task.arguments = arguments
//        let pip = Pipe()
//        task.standardOutput = pip
//        let fileHandle = pip.fileHandleForReading
        task.launch()
//        let data = fileHandle.readDataToEndOfFile()
//        return String(data: data, encoding: String.Encoding.utf8)
    }
}

