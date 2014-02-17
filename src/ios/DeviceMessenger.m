//
//  DeviceMessenger.m
//  SignalingStorm2014
//
//  Created by Holger Berg on 2014-02-13.
//
//

#import "DeviceMessenger.h"
#import "AppDelegate.h"

#define DOCUMENTS_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

@implementation DeviceMessenger

- (void)openFile:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* content = [command.arguments objectAtIndex:0];
    NSString* fileName = [command.arguments objectAtIndex:1];

    if (content != nil && [content length] > 0) {
		int base64MarkerPosition = [content rangeOfString:@";base64,"].location;
		if (base64MarkerPosition != NSNotFound)
			content = [content substringFromIndex:base64MarkerPosition + 8];
		NSData* fileContent = [NSData dataFromBase64String:content];
		
		NSError *error = nil;
		NSString* filePath = [DOCUMENTS_FOLDER stringByAppendingPathComponent:fileName];
		[fileContent writeToFile:filePath options:NSDataWritingAtomic error:&error];
		if (error)
			NSLog(@"Write returned error: %@", [error localizedDescription]);
		else {
			//MainViewController *rootController = [(MainViewController*)[(AppDelegate*)[[UIApplication sharedApplication]delegate] window] rootViewController];
			id rootVC = [[[[[UIApplication sharedApplication] keyWindow] subviews] objectAtIndex:0] nextResponder];
			UIDocumentInteractionController *docViewer = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:filePath]];
			[docViewer setDelegate:rootVC];
			[docViewer presentPreviewAnimated:YES];
		}

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"ok"];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)sendArray:(CDVInvokedUrlCommand*)command
{
CDVPluginResult* pluginResult = nil;
    NSArray* content = command.arguments;

    if (content != nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:@"ok, %d items in array", content.count]];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
