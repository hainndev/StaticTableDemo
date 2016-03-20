//
//  ViewController.m
//  YUX59
//
//  Created by Hai Nguyen on 3/1/16.
//  Copyright © 2016 Hai Nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *lblText;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.lblText.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)inputText:(UIButton *)sender {
    NSInteger tag = [sender tag];
    NSLog (@"Tag: %d", (int) tag);
    
    switch(tag)
    {
        case 12 :
            if([self.lblText.text length] > 0){
                self.lblText.text = [self.lblText.text substringToIndex:[self.lblText.text length] - 1];
            }
            break;
        case 11 :
            self.lblText.text = [self.lblText.text stringByAppendingFormat:@"%i", (int) 0];
            break;
        case 10 :
            self.lblText.text = [self.lblText.text stringByAppendingFormat:@"%@", @"."];
            break;
        default :
            self.lblText.text = [self.lblText.text stringByAppendingFormat:@"%i", (int) tag];
    }
    
}

@end
