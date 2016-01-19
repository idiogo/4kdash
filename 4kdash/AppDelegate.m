//
//  AppDelegate.m
//  4kdash
//
//  Created by Diogo Carneiro on 10/11/15.
//  Copyright (c) 2015 App Ninja. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	
	urls = @[@"dashboard_url", @"dashboard_url"];
	
	NSURL *url1 = [NSURL URLWithString:@"dashboard_url"];
	NSURLRequest *urlRequest1 = [NSURLRequest requestWithURL:url1];
	[[[self wv1] mainFrame] loadRequest:urlRequest1];
	
	NSURL *url2 = [NSURL URLWithString:@"dashboard_url"];
	NSURLRequest *urlRequest2 = [NSURLRequest requestWithURL:url2];
	[[[self wv2] mainFrame] loadRequest:urlRequest2];
	
	NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:_wv1
																  attribute:NSLayoutAttributeWidth
																  relatedBy:0
																	 toItem:self.view
																  attribute:NSLayoutAttributeWidth
																 multiplier:.5
																   constant:0];
	NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:_wv2
																  attribute:NSLayoutAttributeWidth
																  relatedBy:0
																	 toItem:self.view
																  attribute:NSLayoutAttributeWidth
																 multiplier:.5
																   constant:0];
    [self.view addConstraint:constraint1];
    [self.view addConstraint:constraint2];
	
	_wv1.mainFrame.frameView.allowsScrolling = NO;
	_wv2.mainFrame.frameView.allowsScrolling = NO;
	
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame{
	
	NSScrollView* scrollView = [[[[sender mainFrame] frameView] documentView] enclosingScrollView];
    [[scrollView verticalScroller] setControlSize: NSSmallControlSize];
    [[scrollView horizontalScroller] setControlSize: NSSmallControlSize];
	
}

- (IBAction)changeLeftUrl:(id)sender{
	[self changeUrl:[urls objectAtIndex:[sender tag]] webView:_wv1];
}

- (IBAction)changeRightUrl:(id)sender{
	[self changeUrl:[urls objectAtIndex:[sender tag]] webView:_wv2];
}

- (void)changeUrl:(NSString *)urlStr webView:(WebView *)webView{
	NSURL *url = [NSURL URLWithString:urlStr];
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
	[[webView mainFrame] loadRequest:urlRequest];
}

@end
