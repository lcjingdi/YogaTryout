//
//  Show.m
//  YogaTryout
//
//  Created by lcjingdi on 2019/5/14.
//  Copyright © 2019 EKW. All rights reserved.
//

#import "Show.h"

@implementation Show

+ (NSArray *)loadShows {
    return [[self alloc] loadMixersFrom:@"Shows"];
}

- (NSArray *)loadMixersFrom:(NSString *)plistName {
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *shows = [NSMutableArray array];

    for (NSDictionary *dict in dictArray) {
        NSString *title = dict[@"title"];
        NSString *length = dict[@"length"];
        NSString *detail = dict[@"detail"];
        NSString *image = dict[@"image"];
        
        Show *show = [[Show alloc] init];
        show.title = title;
        show.length = length;
        show.detail = detail;
        show.image = image;
        [shows addObject:show];
    }
    
    return [shows copy];
}

@end
