//
//  PriorityVC.m
//  TodoList
//
//  Created by AhmedSaeed on 12/13/19.
//  Copyright © 2019 none. All rights reserved.
//

#import "PriorityVC.h"
#import "RealData.h"
@interface PriorityVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation PriorityVC{
    
    int numberForTag;
    
    NSUserDefaults* defaults;
    NSMutableArray* myarray;
    
    NSMutableArray* heigh;
    NSMutableArray* low;
    NSMutableArray* med;
    NSInteger *number ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableview.dataSource = self;
    _tableview.delegate = self;
    numberForTag = 0 ;
    number = 0;
    
   
}
- (void)viewWillAppear:(BOOL)animated
{
    myarray = [NSMutableArray new];
    heigh = [NSMutableArray new];
    low = [NSMutableArray new];
    med = [NSMutableArray new];
    
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
        if([[myarray objectAtIndex:i] priorityTodo] == 0)
        {
            [heigh addObject:[myarray objectAtIndex:i]];
        }
        else if([[myarray objectAtIndex:i] priorityTodo] == 1)
        {
            [med addObject:[myarray objectAtIndex:i]];
        }
        else if([[myarray objectAtIndex:i] priorityTodo] == 2)
        {
            [low addObject:[myarray objectAtIndex:i]];
        }
    }
    [_tableview reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    switch (numberForTag)
    {
        case 0:
        number = heigh.count;
        
        printf("%d" , number);
            break;
        case 1:
           number = med.count;
            break;
        case 2:
        number = low.count;
            break;
    }
    return number ;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [_tableview dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    switch (numberForTag)
    {
        case 0:
            cell.textLabel.text = [[heigh objectAtIndex:indexPath.row]nameTodo];
            break;
        case 1:
            cell.textLabel.text = [[med objectAtIndex:indexPath.row]nameTodo];
            break;
        case 2:
            cell.textLabel.text = [[low objectAtIndex:indexPath.row]nameTodo];
            break;
    }

    return  cell;
}

- (IBAction)btnClick:(id)sender
{
    numberForTag =[sender tag];
    [_tableview reloadData];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    [viewController viewWillAppear:YES];
}

@end
