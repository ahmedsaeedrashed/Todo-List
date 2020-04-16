//
//  TodoListVC.h
//  TodoList
//
//  Created by AhmedSaeed on 12/13/19.
//  Copyright © 2019 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProtocol.h"

@interface TodoListVC : UIViewController <UITableViewDelegate , UITableViewDataSource,UISearchBarDelegate , MyProtocol ,UITabBarControllerDelegate ,UIAlertViewDelegate>

@end
