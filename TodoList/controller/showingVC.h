//
//  showingVC.h
//  TodoList
//
//  Created by AhmedSaeed on 12/26/19.
//  Copyright © 2019 none. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface showingVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameShow;
@property (weak, nonatomic) IBOutlet UITextView *discribtionShow;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priorityShow;
@property (weak, nonatomic) IBOutlet UISegmentedControl *statusShow;
@property (weak, nonatomic) IBOutlet UILabel *date;


@property NSString* nameSendshow ;
@property NSString* describtionSendshow;
@property NSInteger* priortySendshow ;
@property NSInteger* statusSendshow ;
@property NSString*dataSendShow;



@end

NS_ASSUME_NONNULL_END
