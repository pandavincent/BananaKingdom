//
//  ClubTableViewController.m
//  BK
//
//  Created by Chen Jin on 5/7/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import "ClubTableViewController.h"
#import "ClubDetailViewController.h"
#import "ClubModel.h"

@interface ClubTableViewController ()

@property (strong, nonatomic)ClubModel *cmodel;

@end

@implementation ClubTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initialize the club data model
    _cmodel = [[ClubModel alloc] init];
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_cmodel numberOfClubs];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"
                                        forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *club = [_cmodel clubAtIndex:indexPath.row];
    cell.textLabel.text = club[@"name"];
    cell.imageView.image = [UIImage imageNamed:club[@"image"]];
    return cell;
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id)sender {
    if ([segue.identifier isEqualToString:@"club"]) {
        NSArray * selectedItems = [self.tableView indexPathsForSelectedRows];
        NSIndexPath * selectedItem = selectedItems[0];
        NSInteger selectedIndex = selectedItem.row;
        NSDictionary *club = [self.cmodel clubAtIndex:selectedIndex];
        
        ClubDetailViewController *cdvc = [segue destinationViewController];
        cdvc.club = club;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
