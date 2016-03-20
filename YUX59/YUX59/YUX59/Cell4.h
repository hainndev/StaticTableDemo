//
//  Cell4.h
//  YUX59
//
//  Created by Hai Nguyen on 3/9/16.
//  Copyright © 2016 Hai Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "CellButton.h"

@interface Cell4 : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet CellButton *nameClicked;

@end
