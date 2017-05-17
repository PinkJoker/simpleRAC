//
//  SubsciberViewModal.h
//  simpleRAC
//
//  Created by 我叫MT on 17/5/10.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubsciberViewModal : NSObject
@property(nonatomic, strong) RACCommand *subscribeCommand;
@property(nonatomic, copy) NSString *email;
@property(nonatomic, copy)NSString *statusMessage;
@end
