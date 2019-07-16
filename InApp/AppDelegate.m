//
//  AppDelegate.m
//  InApp
//
//  Created by Mrlu on 2019/7/16.
//  Copyright © 2019 mrlu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
}

- (void)handleURLEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent {
    NSString *urlStr = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
    
    ((ViewController *)NSApp.keyWindow.contentViewController).text.string = urlStr;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    ((ViewController *)NSApp.keyWindow.contentViewController).text.string = @"hahaha";
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
