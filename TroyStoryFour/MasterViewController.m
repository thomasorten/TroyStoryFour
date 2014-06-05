#import "MasterViewController.h"

@interface MasterViewController () <UITableViewDataSource>
@property NSArray *trojans;
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [self load];
    self.tableView.editing = YES;
}

- (void)load
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Trojan"];
    NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSSortDescriptor *sortDescriptor2 = [[NSSortDescriptor alloc] initWithKey:@"prowress" ascending:NO];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"prowress >= 3 and prowress < 8"];
    
    request.sortDescriptors = [NSArray arrayWithObjects:sortDescriptor1, sortDescriptor2, nil];
    request.predicate = predicate;
    
    self.trojans = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    [self.tableView reloadData];
}

- (IBAction)onTrojanConquest:(UITextField *)sender
{
    int random = arc4random() % 10;
    NSNumber *prowress = [NSNumber numberWithInt:random];
    
    NSManagedObject *trojan = [NSEntityDescription insertNewObjectForEntityForName:@"Trojan" inManagedObjectContext:self.managedObjectContext];
    
    [trojan setValue:sender.text forKeyPath:@"name"];
    [trojan setValue:prowress forKeyPath:@"prowress"];
    
    [self.managedObjectContext save:nil];
    [self load];
    
    sender.text = @"";
    [sender resignFirstResponder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.trojans.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *trojan = [self.trojans objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [trojan valueForKey:@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[trojan valueForKey:@"prowress"]];
    return cell;
}

@end