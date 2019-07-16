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
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:'aevt' andEventID:'oapp'];
}

- (void)handleURLEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent {
    NSString *urlStr = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
    
    ((ViewController *)NSApp.keyWindow.contentViewController).text.string = urlStr;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSAppleEventDescriptor *event = [[NSAppleEventManager sharedAppleEventManager] currentAppleEvent];
    NSString *eventdes = [event description];
    NSString *urlStr = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
    ((ViewController *)NSApp.keyWindow.contentViewController).text.string = urlStr;
//    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:'ascr' andEventID:'psbr'];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
