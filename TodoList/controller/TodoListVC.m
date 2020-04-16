//
//  TodoListVC.m
//  TodoList
//
//  Created by AhmedSaeed on 12/13/19.
//  Copyright © 2019 none. All rights reserved.
//

#import "TodoListVC.h"
#import "AddingDescribtion.h"
#import "RealData.h"
#import "showingVC.h"

@interface TodoListVC ()

@property (weak, nonatomic) IBOutlet UITableView* tableViewTodoList;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBAr;

@end

@implementation TodoListVC
{
    AddingDescribtion* discribtion ;
    showingVC* show;
    NSMutableArray* myArr ;
    NSUserDefaults *defaults;
    NSData * allData;
    NSIndexPath * indexy ;
    
    UIAlertView* alert ;
    NSInteger* flage ;
    
    NSMutableArray *filteredDevices;
    BOOL isFiltered;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.searchBAr.delegate = self;
    discribtion = [[self storyboard]instantiateViewControllerWithIdentifier:@"DescribtionIdentefier"];
    show = [[self storyboard] instantiateViewControllerWithIdentifier:@"showing"];
    
    [discribtion setProtocalTemp:self];
     myArr = [NSMutableArray new];

}



- (void)viewWillAppear:(BOOL)animated
{
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
    myArr = objectArray;
    [_tableViewTodoList reloadData];
}
    
    
    

-(void)changeCellData:(RealData*)f
{
    [myArr addObject:f];
    
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults  setObject:[NSKeyedArchiver archivedDataWithRootObject:myArr] forKey:@"savedArray"];
    [defaults synchronize];
    [_tableViewTodoList reloadData];
    
}



- (void)updateCellData:(RealData *)f
{
    [myArr replaceObjectAtIndex:[discribtion r]  withObject:f];
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults  setObject:[NSKeyedArchiver archivedDataWithRootObject:myArr] forKey:@"savedArray"];
    [defaults synchronize];
    [_tableViewTodoList reloadData];
}






- (IBAction)goToDiscribtionPage:(id)sender
{
    [self presentViewController:discribtion animated:YES completion:nil];
    discribtion.displayandhiden = 1;
}

    
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isFiltered)
    {
        return filteredDevices.count;
    }
    printf("array counter : %d", [myArr count]);
    return  [myArr count];
}



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell* cell  = [_tableViewTodoList dequeueReusableCellWithIdentifier:@"cellOfTodo" forIndexPath:indexPath];
    
    if([[myArr objectAtIndex:indexPath.row]statusTodo ] == 0)
    {
        cell.imageView.image = [UIImage imageNamed:@"prog.png"];
      
    }else{
          cell.imageView.image = [UIImage imageNamed:@"done.png"];
    }
    
    if([[myArr objectAtIndex:indexPath.row]statusTodo] == 0)
    {
        if (isFiltered)
        {
            cell.textLabel.text = filteredDevices[indexPath.row];
            
        }else{
            cell.textLabel.text = [[myArr objectAtIndex:indexPath.row] nameTodo];
            
        }
        
    }
    else
    {
        if (isFiltered)
        {
            cell.textLabel.text = filteredDevices[indexPath.row];
        }else{
            cell.textLabel.text = [[myArr objectAtIndex:indexPath.row] nameTodo];
        }
        
    }
    
    [cell setAccessoryType:UITableViewCellAccessoryDetailButton];
    
    return  cell;
}





-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self presentViewController:show animated:YES completion:nil];
    
    show.nameSendshow = [[myArr objectAtIndex:indexPath.row] nameTodo];
    show.describtionSendshow =[[myArr objectAtIndex:indexPath.row] discribtionTodo];
    show.priortySendshow = [[myArr objectAtIndex:indexPath.row]priorityTodo];
    show.statusSendshow =[[myArr objectAtIndex:indexPath.row]statusTodo];
    show.dataSendShow = [[myArr objectAtIndex:indexPath.row] dateTodo];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    printf("for row");
    discribtion.nameSend = [[myArr objectAtIndex:indexPath.row] nameTodo];
    discribtion.describtionSend =[[myArr objectAtIndex:indexPath.row] discribtionTodo];
    discribtion.priortySend = [[myArr objectAtIndex:indexPath.row]priorityTodo];
    discribtion.statusSend =[[myArr objectAtIndex:indexPath.row]statusTodo];
    discribtion.r = indexPath.row ;
    discribtion.displayandhiden = 0;

    [self presentViewController:discribtion animated:YES completion:nil];
}


    
    
    
    
    
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if (searchText.length == 0)
    {
        isFiltered = false;
        [self.searchBAr endEditing:YES];
    }
    else
    {
        isFiltered = true;
        filteredDevices = [[NSMutableArray alloc]init];
        for (int i = 0 ; i < myArr.count ; i++)
        {
            NSString* str = [[myArr objectAtIndex:i]nameTodo];
            NSRange range = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(range.location != NSNotFound)
            {
                [filteredDevices addObject:str];
            }
        }
    }
    [self.tableViewTodoList reloadData];
}


    
    
    
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    [viewController viewWillAppear:true];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Did you want to delete" delegate:self cancelButtonTitle:@"canel" otherButtonTitles:@"yes", nil];
        indexy = indexPath;

        [alert show];
        
        
        

        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if(flage == 0)
    {
        if(buttonIndex == 0  )
        {
            
            printf("you cancel it");

        }else{
            [myArr removeObjectAtIndex:indexy.row];
            
            defaults = [NSUserDefaults standardUserDefaults];
            [defaults  setObject:[NSKeyedArchiver archivedDataWithRootObject:myArr] forKey:@"savedArray"];
            [defaults synchronize];
            [_tableViewTodoList reloadData];
        }
    }


}



@end
