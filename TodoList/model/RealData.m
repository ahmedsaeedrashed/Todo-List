//
//  RealData.m
//  TodoList
//
//  Created by AhmedSaeed on 12/14/19.
//  Copyright © 2019 none. All rights reserved.
//

#import "RealData.h"

@implementation RealData





- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_nameTodo forKey:@"name"];
    [encoder encodeObject:_discribtionTodo forKey:@"describtion"];
    [encoder encodeInteger:_priorityTodo forKey:@"priorty"];
    [encoder encodeInteger:_statusTodo forKey:@"status"];
    [encoder encodeObject:_dateTodo forKey:@"dataaa"];


    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init])) {
        self.nameTodo = [decoder decodeObjectForKey:@"name"];
        self.discribtionTodo =[decoder decodeObjectForKey:@"describtion"];
        self.priorityTodo = [decoder decodeIntegerForKey:@"priorty"];
        self.statusTodo = [decoder decodeIntegerForKey:@"status"];
        self.dateTodo = [decoder decodeObjectForKey:@"dataaa"];
    }
    return self;
}


@end
