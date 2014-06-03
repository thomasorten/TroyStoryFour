//
//  MasterViewController.h
//  TroyStoryFour
//
//  Created by Thomas Orten on 6/3/14.
//  Copyright (c) 2014 Orten, Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
