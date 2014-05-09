//
//  CORWeapon.h
//  PirateGame
//
//  Created by Cor Pruijs on 03-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CORWeapon : NSObject

@property (nonatomic) int damage;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *image;

@end
