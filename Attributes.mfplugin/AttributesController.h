//
// AttributesController.h
// Sample code for making MyFile plugins
// Created by Árpád Goretity, 2011
//

#import <sys/stat.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AttributesController: UITableViewController {
	struct stat attr;
	NSString *file;
	UIViewController *mainViewController;
}

- (id) initWithFile:(NSString *)f mainViewController:(UIViewController *)mvc;

@end
