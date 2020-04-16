//
//  ProgressVC.m
//  TodoList
//
//  Created by AhmedSaeed on 12/13/19.
//  Copyright © 2019 none. All rights reserved.
//

#import "ProgressVC.h"
#import "RealData.h"
@interface ProgressVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableviw;

@end

@implementation ProgressVC
{
    NSUserDefaults* defaults;
    NSMutableArray* myarray ;
    NSMutableArray* usingArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _tableviw.delegate = self;
    _tableviw.dataSource = self;
    _tableviw.separatorStyle = NO;
    
}


- (void)viewWillAppear:(BOOL)animated
{
    myarray = [NSMutableArray new];
    usingArray = [NSMutableArray new];
    
    
    defaults = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [defaults objectForKey:@"savedArray"];
    NSMutableArray *objectArray = nil;
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        if (savedArray != nil)
        {
            objectArray = [[NSMutableArray alloc] initWithArray:savedArray];
        }
        else
        {
            objectArray = [[NSMutableArray alloc] init];
        }
    }
    
    myarray = objectArray;
    
    for (int i = 0 ; i < myarray.count ; i++)
    {
        if([[myarray objectAtIndex:i] statusTodo] == 0)
        {
            [usingArray addObject:[myarray objectAtIndex:i]];
        }
    }
    _tableviw.reloadData;

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return usingArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell =[tableView dequeueReusableCellWithIdentifier:@"prog" forIndexPath:indexPath];
    cell.textLabel.text = [[usingArray objectAtIndex:indexPath.row] nameTodo];
    cell.imageView.image = [UIImage imageNamed:@"prog.png"];
    return  cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    tableView.sectionHeaderHeight = 50;
    return @"Progress";
    
}



- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    [viewController viewWillAppear:true];
}



@end
