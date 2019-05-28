//
//  AppDelegate.swift
//  PasswordcheckExample
//
//  Created by Dharma Teja on 19/06/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

@IBOutlet weak var window: NSWindow!

@IBOutlet weak var employeeID: NSTextField!
@IBOutlet weak var password: NSTextField!

func applicationDidFinishLaunching(_ aNotification: Notification) {
   // Insert code here to initialize your application
}

func applicationWillTerminate(_ aNotification: Notification) {
   // Insert code here to tear down your application
}

@IBAction func validateAction(sender: NSButton)
{
	let employeeValue = employeeID.integerValue;
	let pwd = password.stringValue;
	let alert = NSAlert()

	if (employeeValue != 0  && pwd.count != 0)
	{

	switch employeeValue {
	case 1..<100:
		alert.messageText = "No Access"
	case 100..<150:
		if (pwd == "password"){
		alert.messageText = "Access Granted"
		}
	default:
		alert.messageText = "No Access"

	}
	}
	else{
		alert.messageText = "Please provide valid employee ID or Password"
	}
	alert.runModal()
}


}

