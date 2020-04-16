//
//  MyProtocol.h
//  TodoList
//
//  Created by AhmedSaeed on 12/14/19.
//  Copyright © 2019 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RealData.h"

@protocol MyProtocol <NSObject>

@optional
-(void)changeCellData:(RealData*)f;
-(void)updateCellData:(RealData*)f;


@end


