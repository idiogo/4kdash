//
//  AppDelegate.h
//  4kdash
//
//  Created by Diogo Carneiro on 10/11/15.
//  Copyright (c) 2015 App Ninja. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>{
	NSArray *urls;
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSView *view;
@property (weak) IBOutlet WebView *wv1;
@property (weak) IBOutlet WebView *wv2;

- (IBAction)changeLeftUrl:(id)sender;
- (IBAction)changeRightUrl:(id)sender;

@end
