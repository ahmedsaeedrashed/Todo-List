//
//  DoneVC.m
//  TodoList
//
//  Created by AhmedSaeed on 12/13/19.
//  Copyright © 2019 none. All rights reserved.
//

#import "DoneVC.h"
#import "RealData.h"

@interface DoneVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation DoneVC
{
    NSUserDefaults *defaults ;
    NSMutableArray* myarray ;
    NSMutableArray* usingArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableview.delegate = self;
    _tableview.dataSource = self;
    
    usingArray = [NSMutableArray new];


    defaults = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [defaults objectForKey:@"savedArray"];
    NSMutableArray *objectArray = nil;
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        if (savedArray != nil)
            objectArray = [[NSMutableArray alloc] initWithArray:savedArray];
        else
            objectArray = [[NSMutableArray alloc] init];
    }
    myarray = objectArray;
    
    for (int i = 0 ; i < myarray.count ; i++)
    {
        if([[myarray objectAtIndex:i] statusTodo] == 1)
        {
            [usingArray addObject:[myarray objectAtIndex:i]];
        }
    }
    
}


- (void)viewWillAppear:(BOOL)animated
{
    myarray = [NSMutableArray new];
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
    UITableViewCell* cell =[tableView dequeueReusableCellWithIdentifier:@"done" forIndexPath:indexPath];
    cell.textLabel.text = [[usingArray objectAtIndex:indexPath.row]nameTodo];
    cell.imageView.image = [UIImage imageNamed:@"done.png"];
    
    return  cell;
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    [viewController viewWillAppear:YES];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    tableView.sectionHeaderHeight = 50;
    return @"Done";
}


@end
