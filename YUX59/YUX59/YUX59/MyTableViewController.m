//
//  MyTableViewController.m
//  YUX59
//
//  Created by Hai Nguyen on 3/8/16.
//  Copyright © 2016 Hai Nguyen. All rights reserved.
//

#import "MyTableViewController.h"
#import "Cell1.h"
#import "Cell2.h"
#import "Cell3.h"
#import "Cell4.h"

@interface MyTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *indexPaths;
@end

@implementation MyTableViewController
{
    NSMutableArray *tableData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tableData = [NSMutableArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"";
    
    switch(indexPath.row)
    {
        case 0 :
        {
            simpleTableIdentifier = @"Cell1";
            Cell1 *cell = (Cell1 *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
            
            if (cell == nil) {
                cell = [[Cell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
            }
            return cell;
        }
        case 1 :
        {
            simpleTableIdentifier = @"Cell2";
            Cell2 *cell = (Cell2 *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
            
            if (cell == nil) {
                cell = [[Cell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
            }
            return cell;
        }
        case 2 :
        {
            simpleTableIdentifier = @"Cell3";
            Cell3 *cell = (Cell3 *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
            
            if (cell == nil) {
                cell = [[Cell3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
            }
            return cell;
        }
        default :
            simpleTableIdentifier = @"Cell4";
            
            Cell4 *cell = (Cell4 *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
            
            if (cell == nil) {
                cell = [[Cell4 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
            }
            
            cell.label.text = @"Hai";
            cell.image.image = [UIImage imageNamed:@"creme_brelee.jpg"];
            cell.nameClicked.myName = cell.label.text;
            [cell.nameClicked addTarget:self action:@selector(aMethod:)
forControlEvents:UIControlEventTouchUpInside];
            return cell;
           
    }

}
-(void) aMethod:(CellButton *) sender
{
    Cell3 *cell = [self.myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    cell.lblName.text = sender.myName;
    
    //Remove cells
    NSRange range;
    range.location = 3;
    range.length = tableData.count - 3;
    
    
    [self.myTableView beginUpdates];
    
    [tableData removeObjectsInRange:range];
   
    [self.myTableView deleteRowsAtIndexPaths:self.indexPaths withRowAnimation:(UITableViewRowAnimationFade)];  //or a rowAnimation of your choice
    
    [self.myTableView endUpdates];
    
    
    NSLog(@"Add name");
}



-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
     NSLog (@"Edited: text ");
    [self.myTableView beginUpdates];
    self.indexPaths = [[NSMutableArray alloc] init];

    for (int i = 3; i < 8; i++) {
        [self.indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        [tableData addObject:@"Hai Nguyen"];
    }
    
    [self.myTableView insertRowsAtIndexPaths:self.indexPaths withRowAnimation:(UITableViewRowAnimationFade)];  //or a rowAnimation of your choice
    
    [self.myTableView endUpdates];
}


@end
