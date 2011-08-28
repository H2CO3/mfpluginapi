//
// Attributes.m
// Sample code for making MyFile plug-ins
// Created by Árpád Goretity, 2011.
// Licensed under a CreativeCommons Attribution 3.0 Unported License
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AttributesController.h"

void MFPInitialize(NSDictionary *env) {
        UIViewController *vc = [env objectForKey:@"MFPViewController"];
        NSString *file = [env objectForKey:@"MFPFile"];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController: [[[AttributesController alloc] initWithFile:file mainViewController:vc] autorelease]];
        [vc presentModalViewController:navController animated:YES];
        [navController release];
}

NSString *MFPDescription() {
	return @"Shows attributes of a file";
}

NSArray *MFPSupportedFileTypes() {
	return [NSArray array];
}
