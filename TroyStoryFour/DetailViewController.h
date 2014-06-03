//
//  DetailViewController.h
//  TroyStoryFour
//
//  Created by Thomas Orten on 6/3/14.
//  Copyright (c) 2014 Orten, Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
