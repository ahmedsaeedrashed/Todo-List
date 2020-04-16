//
//  AddingDescribtion.h
//  TodoList
//
//  Created by AhmedSaeed on 12/14/19.
//  Copyright © 2019 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProtocol.h"
#import "RealData.h"


@interface AddingDescribtion : UIViewController<MyProtocol>
@property (weak, nonatomic) IBOutlet UIButton *updateData;
@property (weak, nonatomic) IBOutlet UIButton *addData;
@property (weak, nonatomic) IBOutlet UITextField *nameDes;
@property (weak, nonatomic) IBOutlet UITextView *describtionDes;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priorityDes;
@property (weak, nonatomic) IBOutlet UISegmentedControl *statusDes;


@property NSString* nameSend ;
@property NSString* describtionSend;
@property NSInteger* priortySend ;
@property NSInteger* statusSend ;
@property NSInteger r;

@property NSInteger displayandhiden ;


//@property NSString* dateSend ;

@property id<MyProtocol>protocalTemp;


@end


