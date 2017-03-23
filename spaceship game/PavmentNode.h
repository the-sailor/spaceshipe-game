//
//  PavmentNode.h
//  spaceship game
//
//  Created by Meirav Shapira on 11/6/15.
//  Copyright © 2015 NOVN. All rights reserved.
//

#import "GameObjectNode.h"

@interface PavmentNode : GameObjectNode

-(instancetype)initWithColor:(UIColor *)color size:(CGSize)size holesLocation:(NSArray *)holesLocation;

@end

@interface HoleLocation : NSObject

-(instancetype)initWithxLocation:(CGFloat)xLocation width:(CGFloat)width;

@property (nonatomic,assign) CGFloat xLocation;
@property (nonatomic,assign) CGFloat width;

@end
