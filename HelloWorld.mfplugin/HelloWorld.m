//
// HelloWorld.m
// Sample code for making MyFile plug-ins
// Created by Árpád Goretity, 2011.
// Licensed under a CreativeCommons Attribution 3.0 Unported License
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

void MFPInitialize(NSDictionary *env) {
	UIAlertView *av = [[UIAlertView alloc] init];
	av.title = @"Works!";
	av.message = [env description];
	[av addButtonWithTitle:@"Dismiss"];
	[av show];
	[av release];
}

NSString *MFPDescription() {
	return @"This plugin does nothing useful... ;-)";
}

NSArray *MFPSupportedFileTypes() {
	return [NSArray arrayWithObjects:@"xcf", @"dmg", nil];
}
