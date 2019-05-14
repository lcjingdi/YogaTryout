//
//  Show.h
//  YogaTryout
//
//  Created by lcjingdi on 2019/5/14.
//  Copyright © 2019 EKW. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Show : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *length;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *image;

+ (NSArray *)loadShows;

@end

NS_ASSUME_NONNULL_END
