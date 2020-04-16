//
//  showingVC.m
//  TodoList
//
//  Created by AhmedSaeed on 12/26/19.
//  Copyright © 2019 none. All rights reserved.
//

#import "showingVC.h"

@interface showingVC ()

@end

@implementation showingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    _nameShow.text = _nameSendshow;
    _discribtionShow.text = _describtionSendshow;
    _priorityShow.selectedSegmentIndex = _priortySendshow;
    _statusShow.selectedSegmentIndex = _statusSendshow;
    
    _date.text = _dataSendShow;
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
