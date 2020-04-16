//
//  AddingDescribtion.m
//  TodoList
//
//  Created by AhmedSaeed on 12/14/19.
//  Copyright © 2019 none. All rights reserved.
//

#import "AddingDescribtion.h"
#import "RealData.h"

@interface AddingDescribtion ()


@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation AddingDescribtion
{
    RealData *realdata;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
}

- (void)viewWillAppear:(BOOL)animated
{
    
    realdata = [RealData new];
    
    _nameDes.text = _nameSend;
    _describtionDes.text = _describtionSend;
    _priorityDes.selectedSegmentIndex = _priortySend;
    _statusDes.selectedSegmentIndex = _statusSend;
    
if(_displayandhiden == 1)
{
    _updateData.hidden = YES;
    _addData.hidden = NO;
}
else if(_displayandhiden == 0)
{
    _addData.hidden = YES;
    _updateData.hidden = NO;
    
}
    
//    _datePicker.date = date;
    
}



- (IBAction)clkBtnSubmit:(id)sender
{

    if(![_nameDes.text  isEqual: @""])
    {
        realdata.nameTodo = _nameDes.text;
        realdata.discribtionTodo =_describtionDes.text;
        realdata.priorityTodo = _priorityDes.selectedSegmentIndex;
        realdata.statusTodo = _statusDes.selectedSegmentIndex;
        
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
        realdata.dateTodo =[dateFormatter stringFromDate:[NSDate date]];
        
        [_protocalTemp changeCellData:realdata];
        
        _nameDes.text = @"";
        _describtionDes.text= @"";
        
        _nameSend = @"";
        _describtionSend = @"";
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
        _updateData.enabled = YES;
        
    }else{
        
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:@"please enter name of todo" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){NSLog(@"ok action");}];
            [alert addAction:ok];
            
            [self presentViewController:alert animated:YES completion:nil];
       
    }
    
    
}


- (IBAction)clickUpdate:(id)sender
{
    realdata.nameTodo = _nameDes.text;
    realdata.discribtionTodo =_describtionDes.text;
    realdata.priorityTodo = _priorityDes.selectedSegmentIndex;
    realdata.statusTodo = _statusDes.selectedSegmentIndex;
    

    [_protocalTemp updateCellData:realdata];
    _nameDes.text = @"";
    _describtionDes.text= @"";
    _nameSend = @"";
    _describtionSend = @"";
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
