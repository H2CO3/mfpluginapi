//
// AttributesController.m
// Sample code for making MyFile plugins
// Created by Árpád Goretity, 2011
//

#import "AttributesController.h"

@implementation AttributesController

- (id) initWithFile:(NSString *)f mainViewController:(UIViewController *)mvc {
        self = [super initWithStyle: UITableViewStyleGrouped];
        self.tableView.allowsSelection = NO;
        file = [f copy];
        self.navigationItem.title = [f lastPathComponent];
        mainViewController = [mvc retain];
        stat([file UTF8String], &attr);
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(close)] autorelease]; 
        return self;
}

- (int) tableView:(UITableView *)view numberOfRowsInSection:(int)section {
        return 4;
}

- (UITableViewCell *) tableView:(UITableView *)view cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        UITableViewCell *cell = [view dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"] autorelease];
        }
        switch (indexPath.row) {
        case 0:
                cell.textLabel.text = [NSString stringWithFormat:@"%04o", attr.st_mode & 07777];
                cell.detailTextLabel.text = @"permissions";
                break;
        case 1:
                cell.textLabel.text = [NSString stringWithFormat:@"%i", attr.st_uid];
                cell.detailTextLabel.text = @"User ID";
                break;
        case 2:
                cell.textLabel.text = [NSString stringWithFormat:@"%i", attr.st_gid];
                cell.detailTextLabel.text = @"Group ID";
                break;
        case 3:
                cell.textLabel.text = file;
                cell.detailTextLabel.text = @"File name";
                break;
        default:
                cell.textLabel.text = nil;
                cell.detailTextLabel.text = nil;
                break;
        }
        return cell;
}

- (void) close {
        [mainViewController dismissModalViewControllerAnimated: YES];
}

@end
