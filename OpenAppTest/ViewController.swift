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
//        FourCharCode(stringLiteral: "ascr")
//        FourCharCode(stringLiteral: "psbr")
//        FourCharCode(stringLiteral: "snam")
        let event = NSAppleEventDescriptor(eventClass:FourCharCode(stringLiteral: "aevt"), eventID:FourCharCode(stringLiteral: "oapp") , targetDescriptor: nil, returnID: AEReturnID(kAutoGenerateReturnID), transactionID: AETransactionID(kAnyTransactionID))
        event.setParam(NSAppleEventDescriptor(string: "111"), forKeyword: keyDirectObject)
        let application = try? NSWorkspace.shared.launchApplication(at: URL(fileURLWithPath: app), options: NSWorkspace.LaunchOptions.default, configuration: [NSWorkspace.LaunchConfigurationKey.appleEvent:event])
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

extension FourCharCode: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: StringLiteralType) {
        var code: FourCharCode = 0
        // Value has to consist of 4 printable ASCII characters, e.g. '420v'.
        // Note: This implementation does not enforce printable range (32-126)
        if value.count == 4 && value.utf8.count == 4 {
            for byte in value.utf8 {
                code = code << 8 + FourCharCode(byte)
            }
        }
        else {
            print("FourCharCode: Can't initialize with '\(value)', only printable ASCII allowed. Setting to '????'.")
            code = 0x3F3F3F3F // = '????'
        }
        self = code
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self = FourCharCode(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self = FourCharCode(stringLiteral: value)
    }
    
    /// haahh
    ///
    /// - Parameter value: string
    public init(_ value: String) {
        self = FourCharCode(stringLiteral: value)
    }
    
    public var string: String? {
        let cString: [CChar] = [
            CChar(self >> 24 & 0xFF),
            CChar(self >> 16 & 0xFF),
            CChar(self >> 8 & 0xFF),
            CChar(self & 0xFF),
            0
        ]
        return String(cString: cString)
    }
}

