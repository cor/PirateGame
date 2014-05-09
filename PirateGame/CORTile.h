//
//  CORTile.h
//  PirateGame
//
//  Created by Cor Pruijs on 03-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CORAction.h"
#import "COREnemy.h"

@interface CORTile : NSObject

@property (nonatomic) int healthChange;
@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) CORAction *action1;
@property (strong, nonatomic) CORAction *action2;
@property (strong, nonatomic) COREnemy *enemy;
@property (nonatomic) BOOL action1used;
@property (nonatomic) BOOL action2used;

@end
